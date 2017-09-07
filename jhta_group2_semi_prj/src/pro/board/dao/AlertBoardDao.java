package pro.board.dao;

import java.sql.SQLException;
import java.util.List;

import pro.criteria.vo.Criteria;
import pro.notice.vo.Notice;
import pro.postscription.vo.Postscription;
import pro.utils.IbatisUtils;

public class AlertBoardDao {
	public static AlertBoardDao self = new AlertBoardDao();
	private AlertBoardDao () {}
	public static AlertBoardDao getInstance () {
		return self;
	}
	
	public void addAlertBoard (Notice notice) throws SQLException{
		IbatisUtils.getSqlMap().insert("AlertBoard.addAlertBoard", notice);
	}
	
	public Notice getAlertBoardByNo(int no) throws SQLException {
		return (Notice) IbatisUtils.getSqlMap().queryForObject("AlertBoard.getAlertBoardByNo", no);
	}
	
	public List<Notice> getAllAlertBoard(Criteria criteria) throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("AlertBoard.getAllAlertBoard", criteria);
	}
	public void deleteAlertBoardByNo (int no) throws SQLException {
		IbatisUtils.getSqlMap().delete("AlertBoard.deleteAlertBoardByNo", no);
	}
	public int getTotalRows (Criteria criteria) throws SQLException {
		return (Integer)IbatisUtils.getSqlMap().queryForObject("AlertBoard.getTotalRows", criteria);
	}
}
