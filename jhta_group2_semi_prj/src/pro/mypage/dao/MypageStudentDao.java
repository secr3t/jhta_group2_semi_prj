package pro.mypage.dao;

import java.sql.SQLException;
import java.util.List;

import pro.criteria.vo.Criteria;
import pro.enrollment.vo.Enrollment;
import pro.qna.vo.Qna;
import pro.student.vo.Student;
import pro.tech.vo.Tech;
import pro.utils.IbatisUtils;

public class MypageStudentDao {
	
	private static MypageStudentDao self = new MypageStudentDao();
	private MypageStudentDao() {}
	public static MypageStudentDao getInstance() {
		return self;
	}
	
	@SuppressWarnings("unchecked")
	public List<Student> getStudentInfo(Criteria criteria) throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("MyPageStudent.getStudentInfo", criteria);
	}
	
	public Integer getTotalStudents(Criteria criteria) throws SQLException {
		return (Integer) IbatisUtils.getSqlMap().queryForObject("MyPageStudent.getTotalStudents", criteria);
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
	
	public Integer getTotalQnaRows(Criteria criteria) throws SQLException {
		return (Integer) IbatisUtils.getSqlMap().queryForObject("MyPageStudent.getTotalQnaRows", criteria);
	}
	
	@SuppressWarnings("unchecked")
	public List<Qna> getQnaByStudentNo(Criteria criteria) throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("MyPageStudent.getQnaByStudentNo", criteria);
	}
	
	public Integer getTotalTechRows(Criteria criteria) throws SQLException {
		return (Integer) IbatisUtils.getSqlMap().queryForObject("MyPageStudent.getTotalTechRows", criteria);
	}
	
	@SuppressWarnings("unchecked")
	public List<Tech> getTechInfo(Criteria criteria) throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("MyPageStudent.getTechInfo", criteria);
	}
	
	public void updateMyInfo(Student student) throws SQLException {
		IbatisUtils.getSqlMap().update("MyPageStudent.updateMyInfo", student);
	}

}
