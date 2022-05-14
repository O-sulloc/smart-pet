package com.pj.pet.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManager {
	
	@Autowired
	private ServletContext servletContext;
	
	public boolean fileDelete(String fileName, String path)throws Exception{
		path = servletContext.getRealPath(path);
		
		File file = new File(path, fileName);
		
		return file.delete();
		
		
	}
	
	
	//보드서비스에서 불러옴 
	//path="resources/upload/board/"
	public String fileSave(MultipartFile mf, String path)throws Exception{
		//path ="프로젝트 상의 파일을 저장할 폴더의 경로"
		//1. 파일을 HDD에 저장하고
		//2. 저장된 파일명을 리턴(파일명은 중복 X)
		path = servletContext.getRealPath(path); //hdd 경로 
		System.out.println("fileManger실제경로:"+path);
		
		//경로 찾았는데 없을 수도 있잖아 존재하지 않는다면 디렉토리 생성 
		File file = new File(path);
		if(!file.exists()) { 
			file.mkdirs();
		}
		
		//중복되지 않도록 유니버셜유니크아이디 
		String fileName = UUID.randomUUID().toString();
		fileName = fileName+"_"+mf.getOriginalFilename();
		
		file = new File(file, fileName); //file 경로에 fileName 파일명
		
		mf.transferTo(file); //저장 
		
		return fileName; //파일명 DB에 저장해야되니까 리턴 
	}
}
