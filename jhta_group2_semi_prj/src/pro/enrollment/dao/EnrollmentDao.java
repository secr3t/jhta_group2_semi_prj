package pro.enrollment.dao;

import java.sql.SQLException;

import pro.enrollment.vo.Enrollment;
import pro.utils.IbatisUtils;

public class EnrollmentDao {
	
	private EnrollmentDao() {
	}
	private static EnrollmentDao self = new EnrollmentDao();
	public static EnrollmentDao getInstance() {
		return self;
	}
	
	public void addEnrollment(Enrollment enrollment) throws SQLException{
		IbatisUtils.getSqlMap().insert("addEnrollment", enrollment);
	}
}
