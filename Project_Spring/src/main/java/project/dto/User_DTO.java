package project.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class User_DTO {
	
	String userId; //id
	String userPw; //비밀번호
	String userName; //닉네임
	String job; //직책
	String email; //이메일
	String phone; //전화번호
	Date createDate; //생성일
	String field; //권한

}
