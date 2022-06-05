package com.pj.pet.oauth;

import org.springframework.stereotype.Component;

@Component
public class NaverOauth implements SocialOauth{

	@Override
	public String getOauthRedirectURL() {
		return "";
	}
	
	@Override
	public String requestAccessToken(String code) {
		// TODO Auto-generated method stub
		return null;
	}
}
