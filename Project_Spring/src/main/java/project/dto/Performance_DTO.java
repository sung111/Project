package project.dto;

import java.sql.Date;

import lombok.Data;

//실적테이블
@Data
public class Performance_DTO {

//	performances 테이블 db
	int performanceid;
	int productid;
	int planid;
	String userid;
	Date reporttime;
	String performancecomment;
	int productioncount;

//	페이지네이션
	private int Page = 1; //첫페이지
	private int viewCount = 7; //10개씩보여줌
	private int indexStart;
	private int indexEnd;
	private int totalCount;
	
//	페이지네이션 db조회필드
	private int rnum;
	private String productname;
	private String username;
	 
	
	
	
	
	
}
