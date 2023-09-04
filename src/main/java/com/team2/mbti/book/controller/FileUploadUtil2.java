package com.team2.mbti.book.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team2.mbti.common.ConstUtil;

import jakarta.servlet.http.HttpServletRequest;

@Component
public class FileUploadUtil2 {
	private static final Logger logger = LoggerFactory.getLogger(FileUploadUtil2.class);
	
	public List<Map<String, Object>> fileupload(HttpServletRequest request, int pathFlag) throws IllegalStateException, IOException {
		//파일 업로드 처리
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
		
		//Map<String, MultipartFile> fileMap = multiRequest.getFileMap();
		List<MultipartFile> files = multiRequest.getFiles("upfile");
		
		// 여러개 업로드된 파일의 정보를 저장할 리스트
		List<Map<String, Object>> resultList = new ArrayList<>();
		
		//Iterator<String> iter = fileMap.keySet().iterator();
		int i = 0;
		while(i < files.size()) {
			MultipartFile tempFile = files.get(i);//업로드된 파일을 임시파일 형태로 제공
			if(!tempFile.isEmpty()) { //파일이 업로드된 경우
				long fileSize = tempFile.getSize(); //파일 크기
				String originName = tempFile.getOriginalFilename(); //변경전 파일명
				
				//변경된 파일 이름
				String fileName = getUniqueFileName(originName);
				
				//파일 업로드 처리
				String uploadPath = getUploadPath(request, pathFlag);
				File file = new File(uploadPath, fileName);
				tempFile.transferTo(file);
				
				//업로드 파일 정보 저장
				Map<String, Object> resultMap = new HashMap<>();
				resultMap.put("fileName", fileName);
				resultMap.put("originalFileName", originName);
				resultMap.put("fileSize", fileSize);	
				
				resultList.add(resultMap);
				
				i++;
			}//if			
		}//while		
		
		return resultList;
	}

	public String getUploadPath(HttpServletRequest request, int pathFlag) {
		//업로드 경로 구하기
		String path = "";
		
		if(ConstUtil.FILE_UPLOAD_TYPE.equals("test")) {
			if(pathFlag == ConstUtil.UPLOAD_FILE_FLAG) { //자료실
				path = ConstUtil.FILE_UPLOAD_PATH_TEST;
			} else if (pathFlag == ConstUtil.UPLOAD_IMAGE_FLAG) { //상품 이미지 업로드
				path = ConstUtil.BOOKIMAGE_FILE_UPLOAD_PATH_TEST;
			}
		} else { //deploy
			if(pathFlag == ConstUtil.UPLOAD_FILE_FLAG) { //자료실
				path = ConstUtil.FILE_UPLOAD_PATH; //pds_upload
			} else if (pathFlag == ConstUtil.UPLOAD_IMAGE_FLAG) { //상품 이미지 업로드
				path = ConstUtil.BOOKIMAGE_FILE_UPLOAD_PATH; //pd_images
			}
			
			//실제 물리적인 경로 구하기
			path = request.getSession().getServletContext().getRealPath(path);
		}
		
		logger.info("업로드 경로: {}", path);
		
		return path;
	}
	
	public String getDateTimeStamp() {
		Date date = new Date();
		
		String result = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(date);
		logger.info("날짜 밀리초: {}", result);
		
		return result;
	}

	public String getUniqueFileName(String originName) {
		//ab.txt => ab_밀리초.txt
		int index = originName.lastIndexOf(".");
		String fileName = originName.substring(0, index); //ab
		String fileType = originName.substring(index); //.txt
		
		String result = fileName + "_" + getDateTimeStamp() + fileType;
		logger.info("변경된 파일명: {}", result);
		
		return result;
	}	
}