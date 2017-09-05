package jhta2.progress.vo;

import jhta2.student.vo.Student;
import jhta2.video.vo.Video;

public class Progress {

	private String complete;
	private Student student;
	private Video video;
	
	public String getComplete() {
		return complete;
	}
	public void setComplete(String complete) {
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
