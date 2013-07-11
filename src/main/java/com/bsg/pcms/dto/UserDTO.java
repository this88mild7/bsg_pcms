package com.bsg.pcms.dto;

public class UserDTO extends CommonDTO{
	
	private int user_mgmtseq;
	
	private String id;
	private String pwd;
	private String team;
	private String name;
	private String title;
	private String phoneno;
	private String email;
	private String level_cd;
	
	
	public int getUser_mgmtseq() {
		return user_mgmtseq;
	}
	public void setUser_mgmtseq(int user_mgmtseq) {
		this.user_mgmtseq = user_mgmtseq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLevel_cd() {
		return level_cd;
	}
	public void setLevel_cd(String level_cd) {
		this.level_cd = level_cd;
	}
	@Override
	public String toString() {
		return "\nUserDTO [user_mgmtseq=" + user_mgmtseq + ", id=" + id + ", pwd=" + pwd + ", team=" + team + ", name=" + name + ", title=" + title + ", phoneno=" + phoneno + ", email=" + email + ", level_cd=" + level_cd + "]\n";
	}
	
	
	
}
