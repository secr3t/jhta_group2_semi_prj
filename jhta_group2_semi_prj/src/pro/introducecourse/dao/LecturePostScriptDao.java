package pro.introducecourse.dao;

import java.sql.SQLException;
import java.util.List;
import pro.postscription.vo.Postscription;
import pro.utils.IbatisUtils;

public class LecturePostScriptDao {

	private static LecturePostScriptDao self = new LecturePostScriptDao();
	private LecturePostScriptDao() {}
	public static LecturePostScriptDao getInstance() {
		return self;
	}
	
	@SuppressWarnings("unchecked")
	public List<Postscription> getAllpostscriptions()throws SQLException {
		return IbatisUtils.getSqlMap().queryForList("getAllpostscriptions");
	}
}
