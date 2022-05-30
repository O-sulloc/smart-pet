package com.pj.pet.oauth;

import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class KakaoOauth implements SocialOauth{
	
	@Value("${spring.security.oauth2.client.provider.kakao.authorization-uri}")
	private String KAKAO_SNS_BASE_URL;
	@Value("${spring.security.oauth2.client.registration.kakao.client-id}")
	private String KAKAO_SNS_CLIENT_ID;
	//@Value("${spring.security.oauth2.client.registration.kakao.client-secret}")
    //private String KAKAO_SNS_CLIENT_SECRET;
    @Value("${spring.security.oauth2.client.provider.kakao.token-uri}")
    private String KAKAO_SNS_TOKEN_BASE_URL;


    @Override
	public String getOauthRedirectURL() {
		Map<String, Object> params = new HashMap<>();
		params.put("scope", "profile");
		params.put("response_type", "code");
		params.put("client_id", KAKAO_SNS_CLIENT_ID);
		//params.put("redirect_uri", );
		
		String parameterString = params.entrySet().stream()
				.map(x -> x.getKey() + "=" + x.getValue())
				.collect(Collectors.joining("&"));
				
		return ""; //GOOGLE_SNS_BASE_URL + "?" + parameterString;
	}
	
	@Override
	public String requestAccessToken(String code) {
		// TODO Auto-generated method stub
		return null;
	}
}
