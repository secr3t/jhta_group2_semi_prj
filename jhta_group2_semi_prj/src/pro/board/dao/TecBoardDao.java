package pro.board.dao;

import java.sql.SQLException;
import java.util.List;

import pro.postscription.vo.Postscription;
import pro.tech.vo.Tech;
import pro.utils.IbatisUtils;

public class TecBoardDao {

	public void AddTecBoard (Tech tech) throws SQLException{
		IbatisUtils.getSqlMap().insert("TechBoard.addTechBoard", tech);
	}
	
	public Tech getTecBoardByNo(int no) throws SQLException {
		return (Tech) IbatisUtils.getSqlMap().queryForObject("TechBoard.getTechBoardByNo", no);
	}
	
	public List<Tech> getAllTecBoard() throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("TechBoard.getAllTechBoard");
	}
	
	public void deleteTecBoard(int no) throws SQLException {
		IbatisUtils.getSqlMap().delete("TechBoard.deleteTechBoardByNo", no);
	}
	
	
}
