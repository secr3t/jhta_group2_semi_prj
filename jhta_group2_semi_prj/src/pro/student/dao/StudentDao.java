package pro.student.dao;
import java.sql.SQLException;
import pro.student.vo.Student;
import pro.utils.IbatisUtils;
public class StudentDao {
	
	private static StudentDao self = new StudentDao();
	private StudentDao() {}
	public static StudentDao getInstance() {
		return self;
	}	
	
	
	public Student getStudentByEmail(String email) throws SQLException {
		return (Student) IbatisUtils.getSqlMap().queryForObject("student.getStudentByEmail",  email);
	}
	
	public Student getStudentByNo (int no) throws SQLException {
		return (Student) IbatisUtils.getSqlMap().queryForObject("student.getStudentByNo", no);
	}
	
	public void updateStudent (Student student) throws SQLException {
		IbatisUtils.getSqlMap().update("student.updateStudent", student);
	}
}
