package pro.video.test;

import java.sql.SQLException;
import java.util.List;

import pro.course.vo.Course;
import pro.video.dao.VideoDao;
import pro.video.vo.Video;

public class App {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub

		Video video = new Video();
		Course course = new Course();
		course.setNo(1);
		video.setAttached("test");
		video.setCourse(course);
		video.setDescription("test입니다");
		video.setLink("https://www.youtube.com/watch?v=ekCHPqfSdls");
		video.setOrder(1);
		video.setTitle("배틀그라운드 Vector 실탄사격");
		
		VideoDao dao = new VideoDao();
		
		video = dao.getVideoByNo(1);
		System.out.println(video);
		
		List<Video> lists = dao.getVideosByCourseNo(1);
		System.out.println(lists.get(0));
		System.out.println(lists.get(1));
	}

}
