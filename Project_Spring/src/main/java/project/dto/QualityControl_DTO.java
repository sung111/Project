package project.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class QualityControl_DTO {

//	실적등록 페이지네이션
	private int page;//첫페이지
	private int viewCount;//10개씩보여줌
	private int indexStart;
	private int indexEnd;
	private int totalCount;
//	페이지네이션 db조회필드
	private int rnum;
	private String productname;
	private String username;
	
//	performances 테이블 컬럼명
	private int performanceid;
	private int productid;
	private int planid;
	private String userid;
	private Date reporttime;
	private String performancecomment;
	private int productioncount;
	
//	qualitycontrols 테이블 컬럼명
	private int qualitycontrolid;
	private String result;
	private String failreason;
	private String comments;
	private String qualitycontroltime;
	private int passpack;
	private int failpack;
	
	
//	조회하기위한 필드 정의
	private String searchDateStart;
	private String searchDateEnd;
	
//	모달창을위한 값
	private String productimage; // 이미지이름
	private String normalcriteria; //합
	private String abnormalcriteria; //불합
	
	
	
}
