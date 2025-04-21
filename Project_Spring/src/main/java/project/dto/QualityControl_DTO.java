package project.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class QualityControl_DTO {

//	페이지네이션
	private int Page;//첫페이지
	private int viewCount;//10개씩보여줌
	private int indexStart;
	private int indexEnd;
	private int totalCount;
//	페이지네이션 db조회필드
	private int rnum;
	private String productname;
	private String username;
	
//	performances 테이블 db
	private int performanceid;
	private int productid;
	private int planid;
	private String userid;
	private Date reporttime;
	private String performancecomment;
	private int productioncount;
	
//	조회하기위한 필드 정의
	private String searchDateStart;
	private String searchDateEnd;
	
	
	
	
}
