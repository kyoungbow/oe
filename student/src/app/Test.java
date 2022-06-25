package app;

public class Test {
	public static void main(String[] args) {
		// utf-16 한글2byte 영어2byte
		
		String str1 = "abcd"; // 4
		String str2 = "가34"; // 3
		String str3 = "가나"; // 2
		System.out.println("123456789012345678901234567890123456789012345678901234567890");
		String formatter = String.format("%%%ds%%%ds%%%ds%%n", 10-getKorCnt(str2), 10-getKorCnt(str3), 10-getKorCnt(str1)); // %7s%10s%10s%n
//		String formatter = "%"+7+"s" + "%"+10+"s" + "%"+10+"s" + "%n";
//		System.out.printf(formatter, str2, str3, str1);
		System.out.print(convert(str3, 20));
		System.out.print(convert(str2, 20));
		System.out.print(convert(str1, 20));
		System.out.println();
		
//		String test = String.format("%%%ds", 7);
//		System.out.println(test);
	}
	
	// static getKorCnt 매개변수 : 문자열    리턴 : 한글 갯수(int) 
	public static int getKorCnt(String string) {
		int cnt = 0;
		for(int i = 0 ; i < string.length() ; i++) {
			if(string.charAt(i) >= '가' && string.charAt(i) <= '힣') {
				cnt++;
			}
		}
		return cnt;
	}
	public static String convert(String word, int size) {
		String formatter = String.format("%%%ds", size - getKorCnt(word));
		return String.format(formatter, word);
	}
}
