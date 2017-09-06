package pro.mypage.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import pro.enrollment.vo.Enrollment;
import pro.qna.vo.Qna;
import pro.student.vo.Student;
import pro.utils.IbatisUtils;

public class MypageStudentDao {
	
	private static MypageStudentDao self = new MypageStudentDao();
	private MypageStudentDao() {}
	public static MypageStudentDao getInstance() {
		return self;
	}
	
	public Student getStudentByNo(int studentNo) throws SQLException {
		return (Student) IbatisUtils.getSqlMap().queryForObject("MyPageStudent.getStudentByNo", studentNo);
	}
	
	public Student getStudentByEmail(String studentEmail) throws SQLException {
		return (Student) IbatisUtils.getSqlMap().queryForObject("MyPageStudent.getStudentByEmail", studentEmail);
	}
	
	@SuppressWarnings("unchecked")
	public List<Enrollment> getEnrollmentByStudentNo(int studentNo) throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("MyPageStudent.getEnrollmentByStudentNo", studentNo);
	}
	
	@SuppressWarnings("unchecked")
	public List<Qna> getQnaByStudentNo(int studentNo) throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("MyPageStudent.getQnaByStudentNo", studentNo);
	}
	
	public void updateMyInfo(Student student) throws SQLException {
		IbatisUtils.getSqlMap().update("MyPageStudent.updateMyInfo", student);
	}
}
