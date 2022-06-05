package com.pj.pet.stores;

import java.net.URI;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.net.http.HttpRequest;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.X509Certificate;
import java.util.HashMap;

import javax.net.ssl.SSLContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.http.conn.ssl.NoopHostnameVerifier;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.TrustStrategy;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("stores/*")
public class StoresController {

	private final String URL = "https://apis.data.go.kr";
	// access properties
	@Value("${spring.hospital.api.key}")
	private String serviceKey;

	@GetMapping("list") 
	public ModelAndView getDJList(@RequestParam String page, @RequestParam String perPage, @RequestParam(required = false, defaultValue = "") String companyName) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
		factory.setConnectTimeout(5000);
		factory.setReadTimeout(3000);

		RestTemplate rest = makeRestTemplate(true);

		HttpHeaders header = new HttpHeaders();
		HttpEntity entity = new HttpEntity<String>(header);

		StringBuilder urlBuilder = new StringBuilder(
				URL + "/6310000/ulsananimalhospitalstatus/getulsananimalhospitalstatusList"); /* URL */
		
		urlBuilder.append("?" + URLDecoder.decode("serviceKey", "UTF-8") + "=" + serviceKey.trim()); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("page", "UTF-8") + "="
				+ URLEncoder.encode(page, "UTF-8")); /* 페이지번호(default : 1) */
		urlBuilder.append("&" + URLEncoder.encode("perPage", "UTF-8") + "="
				+ URLEncoder.encode(perPage, "UTF-8")); /* 페이지당수(default : 10) */
		urlBuilder.append("&" + URLEncoder.encode("companyName", "UTF-8") + "="
				+ URLEncoder.encode(companyName, "UTF-8")); /* JSON/XML(default : JSON) */

		URL url = new URL(urlBuilder.toString());

		URI uri = new URI(url.toString()); 

		// 요청 값에 오타가 있었는지 확인해보는 용도
		System.out.println(url.toString());
		
		String jsonString = rest.getForObject(uri, String.class);
		
		ResponseEntity<String>response = rest.exchange(uri, HttpMethod.GET, entity, String.class);
		System.out.println(jsonString);
		
		JSONParser parser = new JSONParser();
		
		System.out.println(response.getBody());
		
	//	JSONObject jsonObj = (JSONObject) parser.parse(response.getBody());

		// !!
		mv.setViewName("/stores/list");
		mv.addObject("data", response.getBody());
		
		return mv;
	}
	
	// 유알엘 값 수정 권장(예) 테스트 > 리스트 ) 좀 더 가독성+확실하게 해당 요청이 어떤 작업을 수행하는지 단번에 파앋ㄱ 할 수있도록, 에이피아이 문서에 맞춰 파라미터 수정
	@GetMapping("test") 
	public ModelAndView getList(@RequestParam String pageNo, @RequestParam String rowNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
		factory.setConnectTimeout(5000);
		factory.setReadTimeout(3000);

		RestTemplate rest = makeRestTemplate(true);

		HttpHeaders header = new HttpHeaders();
		HttpEntity entity = new HttpEntity<String>(header);
		
		// !!
		StringBuilder urlBuilder = new StringBuilder(
				URL + "/3510500/veterinary_hospital/getList"); /* URL */
		
		urlBuilder.append("?" + URLDecoder.decode("serviceKey", "UTF-8") + "=" + serviceKey.trim()); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "="
				+ URLEncoder.encode(pageNo, "UTF-8")); /* 페이지번호(default : 1) */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
				+ URLEncoder.encode(rowNum, "UTF-8")); /* 페이지당수(default : 10) */
	//	urlBuilder.append("&" + URLEncoder.encode("type", "UTF-8") + "="
	//			+ URLEncoder.encode("XML", "UTF-8")); /* JSON/XML(default : JSON) */

		URL url = new URL(urlBuilder.toString());

		URI uri = new URI(url.toString());

		String jsonString = rest.getForObject(uri, String.class);

		JSONParser parser = new JSONParser();
		Object obj = parser.parse(jsonString);
		JSONObject jsonObj = (JSONObject)obj;
		
		// !!
		mv.setViewName("/stores/test");
		mv.addObject("data", jsonObj);
		
		return mv;
	}
	
	
	public static RestTemplate makeRestTemplate(boolean ignoreSsl)
			throws KeyStoreException, NoSuchAlgorithmException, KeyManagementException {
		if (ignoreSsl) {
			TrustStrategy acceptingTrustStrategy = (X509Certificate[] chain, String authType) -> true;
			SSLContext sslContext = org.apache.http.ssl.SSLContexts.custom()
					.loadTrustMaterial(null, acceptingTrustStrategy).build();

			SSLConnectionSocketFactory csf = new SSLConnectionSocketFactory(sslContext, new NoopHostnameVerifier());
			CloseableHttpClient httpClient = HttpClients.custom().setSSLSocketFactory(csf).build();

			HttpComponentsClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory();
			requestFactory.setHttpClient(httpClient);
			requestFactory.setConnectTimeout(3 * 1000);
			requestFactory.setReadTimeout(3 * 1000);

			return new RestTemplate(requestFactory);
		} else {
			return new RestTemplate();
		}
	}
}
