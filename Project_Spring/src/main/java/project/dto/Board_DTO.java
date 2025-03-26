package project.dto;

import java.sql.Date;

public class Board_DTO {

	private int postid;
	private String userid;  
	private String title;    // ê¸??“°ê¸? ?‚´?š©
	private String content;  // ê¸??“°ê¸? ? œëª?
	private Date postdate; 
	private String notify;
	private int viewcount;
	
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPostdate() {
		return postdate;
	}
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
	public String getNotify() {
		return notify;
	}
	public void setNotify(String notify) {
		this.notify = notify;
	}
	public int getViewcount() {
		return viewcount;
	}
	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}
	
	
	
	
	

	
	
	
	
	
	
	               
	
	
	
	
	
	
	
	
	
	
}
