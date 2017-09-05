package pro.board.dao;

import java.sql.SQLException;
import java.util.List;

import pro.qna.vo.Qna;
import pro.utils.IbatisUtils;

public class QnaBoardDao {

	public void AddQnaBoard (Qna qna) throws SQLException{
		IbatisUtils.getSqlMap().insert("QueBoard.addQueBoard", qna);
	}
	
	public Qna getQnaBoardByNo(int no) throws SQLException {
		return (Qna) IbatisUtils.getSqlMap().queryForObject("QueBoard.getQnaBoardByNo", no);
	}
	
	public List<Qna> getAllQnaBoard() throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("QueBoard.getAllQueBoard");
	}
	public void deleteQnaBoard(int no) throws SQLException {
		IbatisUtils.getSqlMap().delete("QueBoard.deletequeBoardByNo", no);
	}
}
