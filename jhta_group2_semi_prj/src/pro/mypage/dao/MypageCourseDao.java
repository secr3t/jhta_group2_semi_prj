package pro.mypage.dao;

import java.sql.SQLException;
import java.util.Map;

import pro.course.vo.Course;
import pro.utils.IbatisUtils;

public class MypageCourseDao {

	private static MypageCourseDao self = new MypageCourseDao();
	private MypageCourseDao() {}
	public static MypageCourseDao getInstance() {
		return self;
	}
	
	public Integer getTotalFinishedCourseByMap(Map<String, Integer> intMap) throws SQLException {
		return (Integer) IbatisUtils.getSqlMap().queryForObject("MyPageCourse.getTotalFinishedCourseByMap", intMap);
	}

	public Integer getTotalCourseVideoByCourseNo(int courseNo) throws SQLException {
		return (Integer) IbatisUtils.getSqlMap().queryForObject("MyPageCourse.getTotalCourseVideoByCourseNo", courseNo);
	}
	
	public Integer getTotalStudentByCourseNo(int courseNo) throws SQLException {
		return (Integer) IbatisUtils.getSqlMap().queryForObject("MyPageCourse.getTotalStudentByCourseNo", courseNo);
	}
	
	public Course getCourseByCourseNo (int courseNo) throws SQLException {
		return (Course) IbatisUtils.getSqlMap().queryForObject("MyPageCourse.getCourseByCourseNo", courseNo);
	}
	
	public Double getGradeAvgByCourseNo(int courseNo) throws SQLException {
		return (Double) IbatisUtils.getSqlMap().queryForObject("MyPageCourse.getGradeAvgByCourseNo", courseNo);
	}
}
