package pro.board.dao;

import java.sql.SQLException;
import java.util.List;

import pro.criteria.vo.Criteria;
import pro.qna.vo.Qna;
import pro.utils.IbatisUtils;

public class QnaBoardDao {
	public static QnaBoardDao self = new QnaBoardDao();
	private QnaBoardDao () {}
	public static QnaBoardDao getInstance () {
		return self;
	}
	
	public void addQnaBoard (Qna qna) throws SQLException{
		IbatisUtils.getSqlMap().insert("QueBoard.addQueBoard", qna);
	}
	public Qna getQnaBoardByNo(int no) throws SQLException {
		return (Qna) IbatisUtils.getSqlMap().queryForObject("QueBoard.getQnaBoardByNo", no);
	}
	
	public List<Qna> getAllQnaBoard(Criteria criteria) throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("QueBoard.getAllQueBoard", criteria);
	}
	public void deleteQnaBoard(int no) throws SQLException {
			IbatisUtils.getSqlMap().delete("QueBoard.deletequeBoardByNo", no);
	}
	public void updateQnaAnsBoard(Qna qna) throws SQLException {
		IbatisUtils.getSqlMap().update("QueBoard.updateQnaAnsBoard", qna);
	}
	public int getTotalRows(Criteria criteria) throws SQLException {
		return (Integer) IbatisUtils.getSqlMap().queryForObject("QueBoard.getTotalRows", criteria);
	}
}
