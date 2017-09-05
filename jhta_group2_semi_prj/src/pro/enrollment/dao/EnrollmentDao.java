package pro.enrollment.dao;

import java.sql.SQLException;

import pro.enrollment.vo.Enrollment;
import pro.utils.IbatisUtils;

public class EnrollmentDao {
	
	public void addEnrollment(Enrollment enrollment) throws SQLException{
		IbatisUtils.getSqlMap().insert("addEnrollment", enrollment);
	}
}
