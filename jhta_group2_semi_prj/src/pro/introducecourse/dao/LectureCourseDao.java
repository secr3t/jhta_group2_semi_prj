package pro.introducecourse.dao;

import java.sql.SQLException;
import java.util.List;

import pro.course.vo.Course;
import pro.utils.IbatisUtils;

public class LectureCourseDao {

	private static LectureCourseDao self = new LectureCourseDao();
	private LectureCourseDao() {}
	public static LectureCourseDao getInstance() {
		return self;
	}
	
	@SuppressWarnings("unchecked")
	public List<Course> getAllCourses() throws SQLException{
		return IbatisUtils.getSqlMap().queryForList("course.getAllCourses");
	}
	
	public Course getCourseByNo(int no) throws SQLException {
		return (Course) IbatisUtils.getSqlMap().queryForObject("course.getCourseByNo", no);
	}
	
	public Course getCourseByLecturerNo(int no) throws SQLException {
		return (Course) IbatisUtils.getSqlMap().queryForObject("course.getCourseByLecturerNo", no);
	}
	
	public Course getCourseByDeptNo(int no) throws SQLException {
		return (Course) IbatisUtils.getSqlMap().queryForObject("course.getCourseByDeptNo", no);
	}
	
}
