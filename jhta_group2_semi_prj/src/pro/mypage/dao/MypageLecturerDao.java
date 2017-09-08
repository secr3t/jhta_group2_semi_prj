package pro.mypage.dao;

import java.sql.SQLException;
import java.util.List;

import pro.course.vo.Course;
import pro.criteria.vo.Criteria;
import pro.lecturer.vo.Lecturer;
import pro.qna.vo.Qna;
import pro.utils.IbatisUtils;
import pro.video.vo.Video;

public class MypageLecturerDao {
	
	private static MypageLecturerDao self = new MypageLecturerDao();
	private MypageLecturerDao() {}
	public static MypageLecturerDao getInstance() {
		return self;
	}
	
	public void addCourseVideo(Video video)  throws SQLException{
		IbatisUtils.getSqlMap().insert("MyPageLecturer.addCourseVideo", video);
	}
	
	public void addCourse(Course course) throws SQLException {
		IbatisUtils.getSqlMap().insert("MyPageLecturer.addCourse", course);
	}
	
	public Lecturer getLecturerByNo(int lecturerNo) throws SQLException {
		return (Lecturer) IbatisUtils.getSqlMap().queryForObject("MyPageLecturer.getLecturerByNo", lecturerNo);
	}
	
	public Lecturer getLecturerByEmail(String lecturerEmail) throws SQLException {
		return (Lecturer) IbatisUtils.getSqlMap().queryForObject("MyPageLecturer.getLecturerByEmail", lecturerEmail);
	}
	
	public Integer getTotalCourseRows(int lecturerNo) throws SQLException {
		return (Integer) IbatisUtils.getSqlMap().queryForObject("MyPageLecturer.getTotalCourseRows", lecturerNo);
	}
	
	@SuppressWarnings("unchecked")
	public List<Course> getCourseByLecturerNo(Criteria criteria) throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("MyPageLecturer.getCourseByLecturerNo", criteria); 
	}
	
	public Integer getTotalQnaRows(int lecturerNo) throws SQLException {
		return (Integer) IbatisUtils.getSqlMap().queryForObject("MyPageLecturer.getTotalQnaRows", lecturerNo);
	}
	
	@SuppressWarnings("unchecked")
	public List<Qna> getQnaByLecturerNo(Criteria criteria) throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("MyPageLecturer.getQnaByLecturerNo", criteria);
	}
	
	public void updateMyInfo(Lecturer lecturer) throws SQLException {
		IbatisUtils.getSqlMap().update("MyPageLecturer.updateMyInfo", lecturer);
	}
}
