package pro.mypage.dao;

import java.sql.SQLException;
import java.util.List;

import pro.course.vo.Course;
import pro.criteria.vo.Criteria;
import pro.lecturer.vo.Lecturer;
import pro.qna.vo.Qna;
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
	
	@SuppressWarnings("unchecked")
	public List<Qna> getQnaByLecturerNo(Criteria criteria) throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("MyPageLecturer.getQnaByLecturerNo", criteria);
	}
	
	public void updateMyInfo(Lecturer lecturer) throws SQLException {
		IbatisUtils.getSqlMap().update("MyPageLecturer.updateMyInfo", lecturer);
	}
}
