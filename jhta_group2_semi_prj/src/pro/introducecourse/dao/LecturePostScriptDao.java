package pro.introducecourse.dao;

import java.sql.SQLException;
import java.util.List;

import pro.criteria.vo.Criteria;
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
		return IbatisUtils.getSqlMap().queryForList("postscription.getAllPostscriptions");
	}
	@SuppressWarnings("unchecked")
	public List<Postscription> getPostscriptionsByCourseNo(int courseNo) throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("postscription.getPostscriptionsByCourseNo", courseNo);
	}

	public double getPostscriptionAvgGradeByCourseNo(int courseNo) throws SQLException{
		return (double) IbatisUtils.getSqlMap().queryForObject("postscription.getPostscriptionAvgGradeByCourseNo", courseNo);
	}
	
	@SuppressWarnings("unchecked")
	public List<Postscription> getPostscriptionsByCourseNo (Criteria criteria) throws SQLException{
		return IbatisUtils.getSqlMap().queryForList("postscription.getPostscriptionsByCriteriaCourseNo", criteria);
	}
	
	public int getQtyByCriteriaCourseNo (int courseNo) throws SQLException {
		return (int) IbatisUtils.getSqlMap().queryForObject("postscription.getQtyByCriteriaCourseNo", courseNo);
	}
	
}

