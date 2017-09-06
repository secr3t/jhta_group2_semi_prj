package pro.qtype.dao;

import java.sql.SQLException;

import pro.utils.IbatisUtils;

public class QtypeDao {

	private static QtypeDao instance = new QtypeDao();
	
	public static QtypeDao getInstance() {
		return instance;
	}
	
	public int getQtypeNoByQtype(String qtype) throws SQLException {
		return (int) IbatisUtils.getSqlMap().queryForObject("getQtypeNoByQtype", qtype);
	}
}
