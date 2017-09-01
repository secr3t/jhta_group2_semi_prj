package pro.utils;

import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class IbatisUtils {
	
	private static SqlMapClient SqlMapClient;
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader("com/paran/ibatis/SqlMapConfig.xml");
			SqlMapClient = SqlMapClientBuilder.buildSqlMapClient(reader);
		} catch (Exception e) {
			e.printStackTrace();
			System.exit(0);
		}
	}
	
	public static SqlMapClient getSqlMap () {
		return SqlMapClient;
	}
}
