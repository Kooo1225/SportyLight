package com.sportylight.domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberVO {
	private int membersId;
	@NotBlank(message = "사용자 email은 필수항목입니다.")
	@Email(message = "email 형식에 맞지 않습니다.")
	@Size(min = 4, message = "사용자 email은 4글자 이상이어야 합니다.")
	private String email;

	@NotBlank(message = "사용자 비밀번호는 필수항목입니다.")
	private String password;

	@NotBlank(message = "비밀번호 확인는 필수항목입니다.")
	private String password2;

	@NotBlank(message = "사용자 이름은 필수항목입니다.")
	private String name;

	@NotNull(message = "사용자 생년월일,성별은 필수항목입니다.")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;

	@NotBlank(message = "사용자 닉네임은 필수항목입니다.")
	private String nickname;

	private String avatarPath;

	@NotNull(message = "사용자 성별은 필수항목입니다.")
	private GenderEnumVO gender;
	
	private String oauth;

	
	private List<AuthVO> authList;

	public Collection<SimpleGrantedAuthority> getAuthorities() {
		List<SimpleGrantedAuthority> authorities = new ArrayList<>();

		for (AuthVO auth : authList) {
			authorities.add(new SimpleGrantedAuthority(auth.getAuth()));
		}

		return authorities;
	}
}
