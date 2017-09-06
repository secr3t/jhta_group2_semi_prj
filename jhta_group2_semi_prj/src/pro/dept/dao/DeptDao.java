package pro.dept.dao;

import java.sql.SQLException;
import java.util.List;

import pro.dept.vo.Dept;
import pro.utils.IbatisUtils;

public class DeptDao {

	private static DeptDao self = new DeptDao();
	private DeptDao() {}
	public static DeptDao getInstance() {
		return self;
	}
	
	@SuppressWarnings("unchecked")
	public List<Dept> getAllDepts() throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("dept.getAllDepts");
	}

	public Dept getDeptByNo (int no)throws SQLException {
		return (Dept) IbatisUtils.getSqlMap().queryForObject("dept.getDeptByNo", no);
	}
}
