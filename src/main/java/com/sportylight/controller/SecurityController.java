package com.sportylight.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sportylight.domain.GenderEnumVO;
import com.sportylight.domain.KakaoProfile;
import com.sportylight.domain.MemberVO;
import com.sportylight.domain.OAuthToken;
import com.sportylight.service.MemberService;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Log4j
@RequestMapping("/security")
@Controller
public class SecurityController {

	@Autowired
	private MemberService service;

	@Autowired
	private AuthenticationManager authenticationManager;


	@GetMapping("/login")
	public void login(Model model) {
		log.info("login page");
	}

	@GetMapping("/join")
	public void signup(@ModelAttribute("member") MemberVO member) {
	}

	@PostMapping("/join")
	public String join(@Valid @ModelAttribute("member") MemberVO member, Errors errors, MultipartFile avatar) throws Exception {

		// 1. 비밀번호, 비밀번호 확인 일치여부
		if (!member.getPassword().equals(member.getPassword2())) {
			// 에러 추가
			errors.rejectValue("password2", "비밀번호 불일치", "비밀번호 확인이 일치하지 않습니다.");
		}

		// 2. 아이디 중복확인
		if (!errors.hasFieldErrors("email")) { // username 유효성 통과한 경우에
			// DB에서 email을 검사

			if (service.checkEmail(member.getEmail()) != null) { // 중복일 때
				errors.rejectValue("email", "email 중복", "이미 사용중인 email입니다.");
			}
		}

		if (!errors.hasFieldErrors("nickname")) { // nick name 유효성 통과한 경우에
			// DB에서 nickname을 검사
			if (service.checkNickname(member.getNickname()) != null) { // 중복일 때
				errors.rejectValue("nickname", "nickname 중복", "이미 사용중인 닉네임입니다.");
			}
		}

		if (errors.hasFieldErrors()) {
			return "security/join";
		}

		// DB에 저장
		service.register(member, avatar); // null
		return "redirect:/map";
	}

	@GetMapping("/findId")
	public void findId() {

	}

	@PostMapping("/findId")
	public String findId2(@DateTimeFormat(pattern = "yyyy-MM-dd") Date birth, String name, Model model) {
		System.out.println(birth + name);

		MemberVO foundMember = service.findId(birth, name);

		System.out.println(foundMember);

		if (foundMember == null) {
			model.addAttribute("result", "false");
		} else {
			model.addAttribute("result", "true");
			model.addAttribute("email", foundMember.getEmail());
		}

		return "security/findId";
	}

	@GetMapping("/findpw")
	public String findpw() {
		return "security/findPw";
	}

	@GetMapping("/avatar/{size}/{membersId}")
	@ResponseBody
	public void avatar(@PathVariable("size") String size, @PathVariable("membersId") String membersId,
			HttpServletResponse response) throws IOException {
		File src = new File(service.getAvatarPath(), membersId + ".png");
		
		if (!src.exists()) {
			src = new File(service.getAvatarPath(), "unknown.png");
		}
		response.setHeader("Content-Type", "image/png");

		if (size.equals("sm")) {
			Thumbnails.of(src).size(40, 40).outputQuality(1.0).toOutputStream(response.getOutputStream());
		} else if (size.equals("m")) {
			Thumbnails.of(src).size(75, 75).outputQuality(1.0).toOutputStream(response.getOutputStream());
		} else {
			Thumbnails.of(src).size(192, 192).outputQuality(1.0).toOutputStream(response.getOutputStream());
		}
	}

	@GetMapping("/profile")
	public void profile() {

	}

	@GetMapping("/kakao/callback")
	public String kakaoCallback(String code) throws Exception {
		
		RestTemplate rt = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "ad5f045a6d90afc878186d9093e76908");
		params.add("redirect_uri", "https://www.sportylight.online/security/kakao/callback");
		params.add("code", code);
		
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);
		
		System.out.println(kakaoTokenRequest);
		
		ResponseEntity<String> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST,
				kakaoTokenRequest, String.class);
		
		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken = null;

		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println("kakao access Token: " + oauthToken.getAccess_token());

		RestTemplate rt2 = new RestTemplate();

		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + oauthToken.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest = new HttpEntity<>(headers2);

		ResponseEntity<String> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST,
				kakaoProfileRequest, String.class);

		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoProfile kakaoProfile = null;

		try {
			kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		// User 오브젝트 : email, password, name, birth, gender, nickname
		System.out.println("이메일: " + kakaoProfile.getKakao_account().getEmail());
		String tempPassword = "1234";
		System.out.println("패스워드: " + tempPassword);
		System.out.println("이름: " + kakaoProfile.getKakao_account().getName());
		System.out.println("닉네임: " + kakaoProfile.getKakao_account().getProfile().getNickname());
		System.out.println("생년월일: " + kakaoProfile.getKakao_account().getBirthyear() + "-"
				+ kakaoProfile.getKakao_account().getBirthday());
		System.out.println("성별: " + kakaoProfile.getKakao_account().getGender());
		System.out.println("프로필: " + kakaoProfile.getKakao_account().getProfile().getThumbnail_image_url());

		String birth = kakaoProfile.getKakao_account().getBirthyear() + "-"
				+ kakaoProfile.getKakao_account().getBirthday().substring(0, 2) + "-"
				+ kakaoProfile.getKakao_account().getBirthday().substring(2);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = formatter.parse(birth);
		System.out.println(date);

		String gender = kakaoProfile.getKakao_account().getGender();
		GenderEnumVO gen;
		if (gender.equals("male")) {
			gen = GenderEnumVO.male;
		} else {
			gen = GenderEnumVO.female;
		}

		MemberVO kakaoUser = MemberVO.builder().email(kakaoProfile.getKakao_account().getEmail()).password(tempPassword)
				.name(kakaoProfile.getKakao_account().getName())
				.nickname(kakaoProfile.getKakao_account().getProfile().getNickname()).birth(date).gender(gen)
				.oauth("kakao").avatarPath(kakaoProfile.getKakao_account().getProfile().getThumbnail_image_url())
				.build();

		System.out.println(kakaoUser.getEmail());
		System.out.println(kakaoUser.getPassword());
		System.out.println(kakaoUser.getName());
		System.out.println(kakaoUser.getNickname());
		System.out.println(kakaoUser.getBirth());
		System.out.println(kakaoUser.getGender());
		System.out.println(kakaoUser.getOauth());
		System.out.println(kakaoUser.getAvatarPath());

		System.out.println(kakaoUser);
		
		// 가입자 혹은 미가입자 체크
		if (service.checkEmail(kakaoUser.getEmail()) == null) {
			System.out.println("새로 오셨군요. 자동 회원가입을 진행합니다.");
			try {
				service.register(kakaoUser, null);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		Authentication authentication = authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(kakaoUser.getEmail(), tempPassword));
		SecurityContextHolder.getContext().setAuthentication(authentication);

		System.out.println("자동 로그인을 진행하였습니다.");
		log.info(kakaoUser);
		log.info(authentication);

		return "redirect:/map";
	}
}
