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
	
	public int getTotalFinishedCourseByMap(Map<String, Integer> intMap) throws SQLException {
		return (int) IbatisUtils.getSqlMap().queryForObject("MyPageCourse.getTotalFinishedCourseByMap", intMap);
	}

	public int getTotalCourseVideoByCourseNo(int courseNo) throws SQLException {
		return (int) IbatisUtils.getSqlMap().queryForObject("MyPageCourse.getTotalCourseVideoByCourseNo", courseNo);
	}
	
	public Course getCourseByCourseNo (int courseNo) throws SQLException {
		return (Course) IbatisUtils.getSqlMap().queryForObject("MyPageCourse.getCourseByCourseNo", courseNo);
	}
	
	public double getGradeAvgByCourseNo(int courseNo) throws SQLException {
		return (double) IbatisUtils.getSqlMap().queryForObject("MyPageCourse.getGradeAvgByCourseNo", courseNo);
	}
}
