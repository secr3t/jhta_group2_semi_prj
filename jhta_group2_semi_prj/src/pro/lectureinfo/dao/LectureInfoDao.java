package pro.lectureinfo.dao;

import java.sql.SQLException;
import java.util.List;

import pro.course.vo.Course;
import pro.criteria.vo.Criteria;
import pro.lectureinfo.vo.LectureInfo;
import pro.utils.IbatisUtils;

public class LectureInfoDao {

	private static LectureInfoDao self = new LectureInfoDao();
	private LectureInfoDao() {}
	public static LectureInfoDao getInstance() {
		return self;
	}

	@SuppressWarnings("unchecked")
	public List<LectureInfo> getLecturesInfo(Criteria criteria) throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("lectureInfo.getLecturesInfo", criteria);
	}
	
	
}