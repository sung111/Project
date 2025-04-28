package project.dto;

import lombok.Data;

//메인 Home화면 
@Data
public class maintitle_DTO {

	//공지시항 일반계시판
	private String postdate ; // 생성날자
	private String title ; // 제목
	
	
	//신규상품, 품질관리
	private String productname ; // 완제품이름
	private String creatdate ; //생성날자
	private String result ; //품질 검사 합격 불합격
	private String productid ; //완제품이름없어서 id값으로 출력
	private String qualitycontroltime ; //완제품이름없어서 id값으로 출력
	
	
	

	
}
