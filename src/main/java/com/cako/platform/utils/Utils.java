package com.cako.platform.utils;

public class Utils {
	public static String BLOCK = "__jsp_override__";
	public static String NEXT_LINE = "\n";

	public static String getOverrideVariableName(String name) {
		return BLOCK + name;
	}
}
