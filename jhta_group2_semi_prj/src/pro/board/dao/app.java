package pro.board.dao;

import java.sql.SQLException;
import java.util.Date;

import pro.postscription.vo.Postscription;

public class app {
	public static void main(String[] args) throws SQLException {
		
		AfterBoardDao adao = new AfterBoardDao();
		Postscription pos = new Postscription();
	    pos.setNo(1);
	    pos.setGrade(1);
	    pos.setTitle("d");
	    pos.setContent("ds");
	    pos.setRegdate("1234-11-22");
	    pos.setStudent(student);
	    
		adao.AddAfterBoard(pos);
		
		
	}
}
