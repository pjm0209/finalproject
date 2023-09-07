package com.team2.mbti.common;

public interface ConstUtil {
	//게시판 페이징 처리 관련 상수
	int RECORD_COUNT=5;
	int MBTI_RECORD_COUNT=10;
	int BOARD_RECORD_COUNT = 10;
	int BOARD_MAIN_RECORD_COUNT = 5;
	public static final int BLOCK_SIZE=10;	//둘다 가능
	
	//파일 업로드 처리 관련 상수
	String FILE_UPLOAD_TYPE = "test";
	
	//
	String FILE_UPLOAD_PATH = "fileUpload";
	String FILE_UPLOAD_PATH_TEST = "C:\\finalproject\\finalproject\\src\\main\\webapp\\fileUpload";
	
	//관리자 페이지
	String IMAGE_FILE_UPLOAD_PATH = "pd_images";
	String IMAGE_FILE_UPLOAD_PATH_TEST = "C:\\finalproject\\finalproject\\src\\main\\webapp\\fileUpload";
	//book관리자
	String BOOKIMAGE_FILE_UPLOAD_PATH = "pd_images";
	String BOOKIMAGE_FILE_UPLOAD_PATH_TEST = "C:\\finalproject\\finalproject\\src\\main\\webapp\\images\\bookProduct\\upload_img";
	
	//자료실 업로드인지, 상품 등록시 업로드인지 구분값
	int UPLOAD_FILE_FLAG = 1; //자료실 업로드
	int UPLOAD_IMAGE_FLAG = 2; //상품 등록시 이미지 업로드
	
	//장바구니, 주문 관련 상수
	int DELIVERY = 3000;
	int TOTAL_PRICE = 30000;
}