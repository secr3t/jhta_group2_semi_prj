package pro.utils;

public class StringUtils {

	public static int changeIntToString(String str) {
		return changeIntToString(str, 0);
	}
	
	public static int changeIntToString(String str, int defaultValue) {
		if(str == null || "".equals(str)) {
			return defaultValue;
		}
		return Integer.parseInt(str);
	}

	public static double changeStringToDouble(String str) {
		return (changeStringToDouble(str, 0.00));
	}
	
	public static double changeStringToDouble(String str, double defaultValue) {
		return str == null ? defaultValue : Double.parseDouble(str);
	}
	
	public static String nullToBlank(String str) {
		if (str == null) {
			return "";
		}
		return str.trim();
	}
	
	
}
