package pro.point.dao;
import java.sql.SQLException;

import pro.point.vo.Point;
import pro.utils.IbatisUtils;
public class PointDao {
	
	private static PointDao self = new PointDao();
	public PointDao() {}
	public static PointDao getInstance() {
		return self;
	}	
	
	public void addPoint(Point point) throws SQLException {
		IbatisUtils.getSqlMap().insert("point.addPoint", point);
	}
}
