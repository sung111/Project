package project.dto;

import java.sql.Date;

//?��?? ?��?���?
public class User_DTO {
	
	String userId; //?��?? ?��?��?��
	String userPw; //?��?? 비�?번호
	String userName; //?��?? ?���?
	String job; //?��?? 직책
	String email; //?��?? ?��메일
	String phone; //?��?? 번호
	Date createDate; //?��?? ?��?��?��
	String field; //?��?? 권한
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	

	

}
