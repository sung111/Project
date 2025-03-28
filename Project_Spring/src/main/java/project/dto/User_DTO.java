package project.dto;

import java.sql.Date;

//?œ ?? ?…Œ?´ë¸?
public class User_DTO {
	
	String userId; //?œ ?? ?•„?´?””
	String userPw; //?œ ?? ë¹„ë?ë²ˆí˜¸
	String userName; //?œ ?? ?´ë¦?
	String job; //?œ ?? ì§ì±…
	String email; //?œ ?? ?´ë©”ì¼
	String phone; //?œ ?? ë²ˆí˜¸
	Date createDate; //?œ ?? ?ƒ?„±?¼
	String field; //?œ ?? ê¶Œí•œ
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
