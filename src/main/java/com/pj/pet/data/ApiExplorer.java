package com.pj.pet.data;

/* Java 1.8 샘플 코드 */

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.web.servlet.ModelAndView;

import java.io.BufferedReader;
import java.io.IOException;

public class ApiExplorer {
    public static ModelAndView main(String[] args) throws IOException, ParseException {
    	// 1. url을 만들기 위한 StringBuilder
        StringBuilder urlBuilder = new StringBuilder("http://openapi.jeonju.go.kr/rest/dongmulhospitalservice/getDongMulHospital"); /*URL*/
        
        //2. open api의 요청 규격에 맞는 파라미터 생성, 발급받은 인증키.
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=5hGi9VywJNCpaCcM0vZBeHyR%2BV8mpIs2FoCs1vAkUccc0oZNIkX77GiM5siiTenSmklvTPxWxs2JDGM14u%2Fe5Q%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("address","UTF-8") + "=" + URLEncoder.encode("인후", "UTF-8")); /*주소(도로명주소, 지번주소)검색어*/
        urlBuilder.append("&" + URLEncoder.encode("dongName","UTF-8") + "=" + URLEncoder.encode("센터", "UTF-8")); /*동물병원의 이름*/
        
        //3. url객체 생성
        URL url = new URL(urlBuilder.toString());
        
        //4. 요청하고자 하는 url과 통신하기 위한 connection 객체 생성.
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        
        //5. 통신을 위한 메소드 set
        conn.setRequestMethod("GET");
        
        //6. 통신을 위한 Content-Type set
        conn.setRequestProperty("Content-type", "application/json");
        
        //7. 통신 응답 코드 확인
        System.out.println("Response code: " + conn.getResponseCode());
        
        //8.전달받은 데이터를 BufferedReader 객체로 저장
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        //9.저장된 데이터를 라인별로 읽어 STringBuilder 객체로 저장
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        
        //10.객체해제
        rd.close();
        conn.disconnect();
        
        //-1. 문자열 형태의 json을 파싱하기 위한 jsonParser객체 생성
        JSONParser parser = new JSONParser();
        
        //-2. 문자열을 JSON 형태로 jsonobjec객체에 저장
        JSONObject obj = (JSONObject) parser.parse(sb.toString());
        
        //-3. 필요한 리스트 데이터 부분만 가져와 JSONArray로 저장
        JSONArray dataArr = (JSONArray) obj.get("data");
        
        //-4. model에 담아준다.
        ModelAndView mv = new ModelAndView();
        mv.addObject("data", dataArr);
        mv.setViewName("/data/list");
        
        //11. 전달받은 데이터 확인
        System.out.println(sb.toString());
        
        return mv;
    }
}
