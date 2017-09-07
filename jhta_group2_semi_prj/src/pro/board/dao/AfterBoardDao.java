package pro.board.dao;

import java.sql.SQLException;
import java.util.List;

import pro.criteria.vo.Criteria;
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
	public List<Postscription> getAllAfterBoard(Criteria criteria) throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("AfterBoard.getAllAfterBoard", criteria);
	}
	public void deleteAfterBoard(int no) throws SQLException {
		IbatisUtils.getSqlMap().delete("AfterBoard.deleteAfterBoardByNo", no);
	}
	public int getTotalRows () throws SQLException {
		return (Integer)IbatisUtils.getSqlMap().queryForObject("AfterBoard.getTotalRows");
	}
}
