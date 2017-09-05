package pro.board.dao;

import java.sql.SQLException;
import java.util.List;

import pro.notice.vo.Notice;
import pro.postscription.vo.Postscription;
import pro.utils.IbatisUtils;

public class AlertBoardDao {

	public void AddAlertBoard (Notice notice) throws SQLException{
		IbatisUtils.getSqlMap().insert("AlertBoard.addAlertBoard", notice);
	}
	
	public Notice getAlertBoardByNo(int no) throws SQLException {
		return (Notice) IbatisUtils.getSqlMap().queryForObject("AlertBoard.getAlertBoardByNo", no);
	}
	
	public List<Notice> getAllAlertBoard() throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("AlertBoard.getAllAlertBoard");
	}
	public void deleteAlertBoardByNo (int no) throws SQLException {
		IbatisUtils.getSqlMap().delete("AlertBoard.deleteAlertBoardByNo", no);
	}
}
