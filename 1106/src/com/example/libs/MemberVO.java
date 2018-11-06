package com.example.libs;

public class MemberVO {
	private String userid;        
	private String username;      
	private String userpasswd;    
	private String useremail;     
	private String zippost;       
	private String useraddress;
	public MemberVO(String userid, String username, String userpasswd, String useremail) {
		this.userid = userid;
		this.username = username;
		this.userpasswd = userpasswd;
		this.useremail = useremail;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpasswd() {
		return userpasswd;
	}
	public void setUserpasswd(String userpasswd) {
		this.userpasswd = userpasswd;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getZippost() {
		return zippost;
	}
	public void setZippost(String zippost) {
		this.zippost = zippost;
	}
	public String getUseraddress() {
		return useraddress;
	}
	public void setUseraddress(String useraddress) {
		this.useraddress = useraddress;
	}
	@Override
	public String toString() {
		return "MemberVO [userid=" + userid + ", username=" + username + ", userpasswd=" + userpasswd + ", useremail="
				+ useremail + ", zippost=" + zippost + ", useraddress=" + useraddress + "]";
	}   
}
