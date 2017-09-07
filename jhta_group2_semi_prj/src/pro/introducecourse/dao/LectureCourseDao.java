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
	
	@SuppressWarnings("unchecked")
	public List<Course> getCourseByLecturerNo(int no) throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("course.getCourseByLecturerNo", no);
	}
	
	@SuppressWarnings("unchecked")
	public List<Course> getCourseByDeptNo(int no) throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("course.getCourseByDeptNo", no);
	}
	
	public int getCourseQty() throws SQLException {
		return (Integer) IbatisUtils.getSqlMap().queryForObject("course.getCourseQty");
	}
	
}
