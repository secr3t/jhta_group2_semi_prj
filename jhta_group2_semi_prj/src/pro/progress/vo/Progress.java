package pro.progress.vo;

import pro.student.vo.Student;
import pro.utils.StringUtils;
import pro.video.vo.Video;

public class Progress {

	private Double complete;
	private Student student;
	private Video video;
	
	public Double getComplete() {
		return complete;
	}
	public void setComplete(Double complete) {
		this.complete = complete;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Video getVideo() {
		return video;
	}
	public void setVideo(Video video) {
		this.video = video;
	}
	
	@Override
	public String toString() {
		return "Progress [complete : " + complete + ", student : " + student + ", video : " + video + "]";
	}
}
