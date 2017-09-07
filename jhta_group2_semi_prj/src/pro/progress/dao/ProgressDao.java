package pro.progress.dao;

import java.sql.SQLException;
import java.util.List;

import pro.progress.vo.Progress;
import pro.utils.IbatisUtils;

public class ProgressDao {

	private static ProgressDao instance = new ProgressDao();
	private ProgressDao() {}
	public static ProgressDao getInstance() {
		return instance;
	}
	
	public void addProgress(Progress progress) throws SQLException {
		IbatisUtils.getSqlMap().insert("progress.addProgress", progress);
	}
	
	public void updateProgress(Progress progress) throws SQLException {
		IbatisUtils.getSqlMap().update("progress.updateProgress", progress);
	}
	
	public List<Progress> getProgressesByStudentNo(int studentNo) throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("progress.getProgressesByStudentNo", studentNo);
	}
}
