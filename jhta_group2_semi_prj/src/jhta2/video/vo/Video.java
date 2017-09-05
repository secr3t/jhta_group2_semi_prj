package jhta2.video.vo;

import jhta2.course.vo.Course;

public class Video {

	private int no;
	private String link;
	private String title;
	private String description;
	private String attached;
	private String permit;
	private int order;
	
	private Course course;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAttached() {
		return attached;
	}
	public void setAttached(String attached) {
		this.attached = attached;
	}
	public String getPermit() {
		return permit;
	}
	public void setPermit(String permit) {
		this.permit = permit;
	}
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	
	@Override
	public String toString() {
		return "Video [no : " + no + ", link : " + link + ", title : " + title + ", description : " + description
				+ ", attached : " + attached + ", permit : " + permit + ", order : " + order + ", course : " + course
				+ "]";
	}
}
