package pro.board.dao;

import java.sql.SQLException;
import java.util.List;

import pro.utils.IbatisUtils;
import pro.vo.Board;

public class BoardDao {

	public void addBoard(Board board) throws SQLException {
		IbatisUtils.getSqlMap().insert("addBoard", board);
	}
	
	public List<Board> getAllBoard() throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("getAllBoard");
	}
}
