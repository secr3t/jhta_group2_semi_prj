package pro.mypage.dao;

import java.sql.SQLException;
import java.util.List;

import pro.course.vo.Course;
import pro.lecturer.vo.Lecturer;
import pro.utils.IbatisUtils;

public class MypageLecturerDao {
	
	private static MypageLecturerDao self = new MypageLecturerDao();
	private MypageLecturerDao() {}
	public static MypageLecturerDao getInstance() {
		return self;
	}
	
	public Lecturer getLecturerByNo(int lecturerNo) throws SQLException {
		return (Lecturer) IbatisUtils.getSqlMap().queryForObject("MyPageLecturer.getLecturerByNo", lecturerNo);
	}
	
	public Lecturer getLecturerByEmail(String lecturerEmail) throws SQLException {
		return (Lecturer) IbatisUtils.getSqlMap().queryForObject("MyPageLecturer.getLecturerByEmail", lecturerEmail);
	}
	
	@SuppressWarnings("unchecked")
	public List<Course> getCourseByLecturerNo(int lecturerNo) throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("MyPageLecturer.getCourseByLecturerNo", lecturerNo); 
	}
}
