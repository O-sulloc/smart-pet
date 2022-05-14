package com.pj.pet.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;



@Component
public class FileDown extends AbstractView {
	@Autowired
	private ServletContext servletContext; //실제경로 받아오기 위함 
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//1. 파일이  저장된  경로 설정
				//다른 방식 : "classpath:/static/" -멍구리 참조 
				String path = "resources/upload/";
				path = path + (String)model.get("board"); //모델에서 보드 꺼내면 보드 나옴 
				path = servletContext.getRealPath(path); //실제 경로 가져오기 
				
		        //2. Model에서 파일 객체 Get
		        FileVO fileVO =(FileVO)model.get("fileVO");
				
				
		        //3. 위의 정보를 담는 파일 객체 생성
				File file = new File(path, fileVO.getFileName()); //경로명,파일명 
				
				
				//한글 처리
				response.setCharacterEncoding("UTF-8");
				
				//총 파일의 크기
				response.setContentLengthLong(file.length());
				
				//다운로드시 파일 이름을 인코딩 처리
				String fileName = URLEncoder.encode(fileVO.getOriName(), "UTF-8");
				
				//header 설정
				response.setHeader("Content-Disposition", "attachment;filename=\""+fileName+"\"" );
				response.setHeader("Content-Transfer-Encoding", "binary");
				
				//HDD에서 파일을 읽고
				FileInputStream fi = new FileInputStream(file);
				//Client로 전송 준비
				OutputStream os = response.getOutputStream();
				
				//전송
				FileCopyUtils.copy(fi, os);
				
				os.close();
				fi.close();
		
	}
}
