package pro.introducecourse.dao;

import java.sql.SQLException;
import java.util.List;
import pro.postscription.vo.Postscription;
import pro.utils.IbatisUtils;

public class LecturePostScriptDao {

	private static LecturePostScriptDao self = new LecturePostScriptDao();
	private LecturePostScriptDao() {}
	public static LecturePostScriptDao getInstance() {
		return self;
	}
	
	@SuppressWarnings("unchecked")
	public List<Postscription> getAllpostscriptions()throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("postscription.getAllpostscriptions");
	}
	public Postscription getPostscriptionByCourseNo(int courseNo) throws SQLException {
		return (Postscription) IbatisUtils.getSqlMap().queryForObject("postscription.getPostscriptionByCourseNo", courseNo);
	}

	public double getPostscriptionAvgGradeByCourseNo(int courseNo) throws SQLException{
		return (double) IbatisUtils.getSqlMap().queryForObject("postscription.getPostscriptionAvgGradeByCourseNo", courseNo);
	}
	
}

