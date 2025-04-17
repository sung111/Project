package project.dto;

import java.sql.Date;

import lombok.Data;


//DTO : Data Transfer Object
//VO : Value Object
//@Getter
//@Setter
//@ToString
//@RequiredArgsConstructor // 생성자
//@EqualsAndHashCode
@Data // 통합
public class Prodto {

	
	
	
	private int postid;
	private String userid;  
	private String title;    // 글쓰기 내용
	private String content;  // 글쓰기 제목
	private Date postdate; 
	private String notify;
	private int viewcount;
	
	private int page = 1; // 기본적으로 보이는 페이지
	private int pagecount = 10; // 페이지당 보여줄 수 countPerPage rowPerPage
	private int indexStart;
	private int indexEnd;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 주소인 출력값을 String으로 변경
	@Override
	public String toString() {
		return "Prodto [postid=" + postid + ", userid=" + userid + ", title=" + title + ", content=" + content
				+ ", postdate=" + postdate + ", notify=" + notify + ", viewcount=" + viewcount + "]";
	}
	
	
	
	// 롬복으로 생략
	
	
	
	
	
	
	
	
	
	
}
