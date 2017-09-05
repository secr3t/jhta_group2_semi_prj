package pro.progress.test;

import java.sql.SQLException;

import pro.progress.dao.ProgressDao;
import pro.progress.vo.Progress;
import pro.student.vo.Student;
import pro.video.vo.Video;

public class App {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
//
//		Progress progress = new Progress();
//		progress.setComplete("N");
//		Student student = new Student();
//		student.setNo(1);
//		Video video = new Video();
//		video.setNo(2);
//		progress.setStudent(student);
//		progress.setVideo(video);
//		ProgressDao.getInstance().addProgress(progress);
//		
		for(Progress pro : ProgressDao.getInstance().getProgressesByStudentNo(1)) {
			System.out.println(pro);
		}
		
		
	}

}
