package project.dto;

import java.sql.Date;

//? ?? ??΄λΈ?
public class User_DTO {
	
	String userId; //? ?? ??΄?
	String userPw; //? ?? λΉλ?λ²νΈ
	String userName; //? ?? ?΄λ¦?
	String job; //? ?? μ§μ±
	String email; //? ?? ?΄λ©μΌ
	String phone; //? ?? λ²νΈ
	Date createDate; //? ?? ??±?Ό
	String field; //? ?? κΆν
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
