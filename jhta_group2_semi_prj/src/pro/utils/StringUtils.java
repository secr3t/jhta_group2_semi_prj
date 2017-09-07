package pro.utils;

public class StringUtils {

	public static int changeIntToString(String str) {
		return changeIntToString(str, 0);
	}
	
	public static int changeIntToString(String str, int defaultValue) {
		if(str == null) {
			return defaultValue;
		}
		return Integer.parseInt(str);
	}
	public static String nullToBlank(String str) {
		if (str == null) {
			return "";
		}
		return str.trim();
	}
}
