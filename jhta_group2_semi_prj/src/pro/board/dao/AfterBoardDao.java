package pro.board.dao;

import java.sql.SQLException;
import java.util.List;

import pro.course.vo.Course;
import pro.criteria.vo.Criteria;
import pro.enrollment.vo.Enrollment;
import pro.postscription.vo.Postscription;
import pro.utils.IbatisUtils;

public class AfterBoardDao {
	public static AfterBoardDao self = new AfterBoardDao();
	private AfterBoardDao() {}
	public static AfterBoardDao getInstance () {
		return self;
	}
	
	public void addAfterBoard (Postscription postscription) throws SQLException{
		IbatisUtils.getSqlMap().insert("AfterBoard.addAfterBoard", postscription);
	}
	
	public Postscription getAfterBoardByNo(int no) throws SQLException {
		return (Postscription) IbatisUtils.getSqlMap().queryForObject("AfterBoard.getAfterBoardByNo", no);
	}
	
	@SuppressWarnings("unchecked")
	public List<Postscription> getAllAfterBoard(Criteria criteria) throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("AfterBoard.getAllAfterBoard", criteria);
	}
	public void deleteAfterBoard(int no) throws SQLException {
		IbatisUtils.getSqlMap().update("AfterBoard.deleteAfterBoardByNo", no);
	}
	public int getTotalRows (Criteria criteria) throws SQLException {
		return (Integer)IbatisUtils.getSqlMap().queryForObject("AfterBoard.getTotalRows", criteria);
	}
	public List<Postscription> getAfterBoardTop() throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("AfterBoard.getAfterBoardTop");
	}
	public Enrollment getEnrollmentByNo(int no) throws SQLException {
		return (Enrollment) IbatisUtils.getSqlMap().queryForObject("AfterBoard.getEnrollmentByNo", no);
	}
}
