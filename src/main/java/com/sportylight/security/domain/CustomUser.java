package com.sportylight.security.domain;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.sportylight.domain.MemberVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CustomUser extends User {
	private MemberVO member;

	public CustomUser(String email, String password, Collection<? extends GrantedAuthority> authorities) {
		super(email, password, authorities);
	}

	public CustomUser(MemberVO vo) {
		super(vo.getEmail(), vo.getPassword(), vo.getAuthorities());
		this.member = vo;
	}
	
	public int getMembersId() {
		return member.getMembersId();
	}
	
	public String getNickName() {
		return member.getNickname();
	}
	
	public String getAvatarPath() {
		return member.getAvatarPath();
	}
}
