package pro.board.dao;

import java.sql.SQLException;
import java.util.List;

import pro.postscription.vo.Postscription;
import pro.utils.IbatisUtils;

public class AfterBoardDao {
	
	public void AddAfterBoard (Postscription postscription) throws SQLException{
		IbatisUtils.getSqlMap().insert("AfterBoard.addAfterBoard", postscription);
	}
	
	public Postscription getAfterBoardByNo(int no) throws SQLException {
		return (Postscription) IbatisUtils.getSqlMap().queryForObject("AfterBoard.getAfterBoardByNo", no);
	}
	
	@SuppressWarnings("unchecked")
	public List<Postscription> getAllAfterBoard() throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("AfterBoard.getAllAfterBoard");
	}
	public void deleteAfterBoard(int no) throws SQLException {
		IbatisUtils.getSqlMap().delete("AfterBoard.deleteAfterBoardByNo", no);
	}
}
