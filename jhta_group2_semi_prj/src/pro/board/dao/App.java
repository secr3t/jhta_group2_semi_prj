package pro.board.dao;

import java.sql.SQLException;
import java.util.List;

import pro.tech.vo.Tech;

public class App {
public static void main(String[] args) throws SQLException{
	 	TechBoardDao tdao = TechBoardDao.getInstance();
	 	List<Tech> t = tdao.getAllTechBoardByNo(1);
	 				 Tech ta = tdao.getTechBoardByNo(1);
	 	
	 	for(Tech tt : t) {
	 		System.out.println(tt);
	 	}
	}
}
