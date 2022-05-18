package com.pj.pet.summernote;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.pj.pet.util.FileManager;

@Service
public class SummernoteService {
	
	@Autowired
	public FileManager fileManager;

		//summerFile에서 파일 업로드
		public String setSummerFileUpload(MultipartFile files) throws Exception{
			//file HDD에 저장하고 저장된 파일명을 return
			String fileName = fileManager.fileSave(files, "resources/upload/notice/");
			fileName = "/resources/upload/notice/"+fileName;
			return fileName;
		}
	
		//summerFile에서 파일 삭제
		public boolean setSummerFileDelete(String fileName) throws Exception{
			
			//위 fileName은 전체정보가 있어서 substring으로 문자열을 자름
			//index번호 입력시 fileName.lastIndexOf("/") 사용
			fileName = fileName.substring(fileName.lastIndexOf("/")+1);
			System.out.println(fileName);
			
			return fileManager.remove("/resources/upload/notice/", fileName);

		}

}
