package pro.mypage.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import pro.course.vo.Course;
import pro.criteria.vo.Criteria;
import pro.enrollment.vo.Enrollment;
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
	
	@SuppressWarnings("unchecked")
	public List<Enrollment> getStudentsByCourseNo(Criteria criteria) throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("MyPageCourse.getStudentsByCourseNo", criteria);
	}
	
	public Course getCourseByCourseNo (int courseNo) throws SQLException {
		return (Course) IbatisUtils.getSqlMap().queryForObject("MyPageCourse.getCourseByCourseNo", courseNo);
	}
	
	public Double getGradeAvgByCourseNo(int courseNo) throws SQLException {
		return (Double) IbatisUtils.getSqlMap().queryForObject("MyPageCourse.getGradeAvgByCourseNo", courseNo);
	}
}
