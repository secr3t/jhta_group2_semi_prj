package pro.notice.vo;

import java.util.Date;

public class Notice {

	private int no;
	private String title;
	private String content;
	private Date regdate;
	private Date expiredate;
	private String active;
	private int ntypeNo;
	
	
	public int getNtypeNo() {
		return ntypeNo;
	}
	public void setNtypeNo(int ntypeNo) {
		this.ntypeNo = ntypeNo;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getExpiredate() {
		return expiredate;
	}
	public void setExpiredate(Date expiredate) {
		this.expiredate = expiredate;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	@Override
	public String toString() {
		return "Notice [no=" + no + ", title=" + title + ", content=" + content + ", regdate=" + regdate
				+ ", expiredate=" + expiredate + ", active=" + active + ", ntypeNo=" + ntypeNo + "]";
	}
	
	
}
