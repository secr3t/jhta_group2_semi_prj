package pro.board.dao;

import java.sql.SQLException;
import java.util.List;

import pro.criteria.vo.Criteria;
import pro.postscription.vo.Postscription;
import pro.tech.vo.Tech;
import pro.utils.IbatisUtils;

public class TechBoardDao {
	public static TechBoardDao self = new TechBoardDao();
	private TechBoardDao () {}
	public TechBoardDao getInstance () {
		return self;
	}
	
	public void addTechBoard (Tech tech) throws SQLException{
		IbatisUtils.getSqlMap().insert("TechBoard.addTechBoard", tech);
	}
	
	public Tech getTechBoardByNo(int no) throws SQLException {
		return (Tech) IbatisUtils.getSqlMap().queryForObject("TechBoard.getTechBoardByNo", no);
	}
	
	@SuppressWarnings("unchecked")
	public List<Tech> getAllTechBoard(Criteria criteria) throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("TechBoard.getAllTechBoard", criteria);
	}
	
	public void deleteTechBoard(int no) throws SQLException {
		IbatisUtils.getSqlMap().delete("TechBoard.deleteTechBoardByNo", no);
	}
	public void updateTechAnsBoard(Tech tech) throws SQLException {
		IbatisUtils.getSqlMap().update("TechBoard.updateTechBoard", tech);
	}
	public int getTotalRows(Criteria criteria) throws SQLException {
		return (Integer) IbatisUtils.getSqlMap().queryForObject("TechBoard.getTotalRows", criteria);
	}
	
	
}
