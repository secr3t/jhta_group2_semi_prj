package pro.board.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
	
	private static final SimpleDateFormat YYYYMMDDHHMMSS = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	public static String yyyymmddhhmmss (Date date) {
		if (date == null) {
			return "";
		}
		return YYYYMMDDHHMMSS.format(date);
	}
	
}
