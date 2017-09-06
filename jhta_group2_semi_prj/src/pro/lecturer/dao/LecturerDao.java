package pro.lecturer.dao;
import java.sql.SQLException;
import pro.student.vo.Student;
import pro.utils.IbatisUtils;
public class LecturerDao {
	
	private static LecturerDao self = new LecturerDao();
	public LecturerDao() {}
	public static LecturerDao getInstance() {
		return self;
	}	
	
	
	public Student getStudentByEmail(String email) throws SQLException {
		return (Student) IbatisUtils.getSqlMap().queryForObject("student.getStudentByEmail",  email);
	}
	
	public Student getStudentByNo (int no) throws SQLException {
		return (Student) IbatisUtils.getSqlMap().queryForObject("student.getStudentByNo", no);
	}
}
