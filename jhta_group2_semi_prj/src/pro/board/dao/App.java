package pro.board.dao;

import java.sql.SQLException;

public class App {
public static void main(String[] args) throws SQLException{
		
		QnaBoardDao qdao = QnaBoardDao.getInstance();
		qdao.deleteQnaBoard(85);
	}
}
