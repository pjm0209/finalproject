package com.team2.mbti.common;

public interface ConstUtil {
	//게시판 페이징 처리 관련 상수
	int RECORD_COUNT=5;
	int MBTI_RECORD_COUNT=10;
	public static final int BLOCK_SIZE=10;	//둘다 가능
	
	//파일 업로드 처리 관련 상수
	String FILE_UPLOAD_TYPE = "test";
	//String FILE_UPLOAD_TYPE = "deploy";
	
	//자료실 파일 저장 경로
	String FILE_UPLOAD_PATH = "pds_upload";
	String FILE_UPLOAD_PATH_TEST = "C:\\finalproject\\finalproject\\src\\main\\webapp\\uploadFile";
	
	//관리자 페이지 - 상품 등록시 상품이미지 저장 경로
	String IMAGE_FILE_UPLOAD_PATH = "pd_images";
	String IMAGE_FILE_UPLOAD_PATH_TEST = "C:\\finalproject\\finalproject\\src\\main\\webapp\\uploadFile";
	
	//자료실 업로드인지, 상품 등록시 업로드인지 구분값
	int UPLOAD_FILE_FLAG = 1; //자료실 업로드
	int UPLOAD_IMAGE_FLAG = 2; //상품 등록시 이미지 업로드
}