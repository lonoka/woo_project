package poly.util;

public class EncryptTest1 {

	public static void main(String[] args) {
		String str = "md5 test";
		System.out.println("md5암호화 이전 문자열 : " + str);
		EncryptUtil1.testMD5(str);
		System.out.println("md5암호화 이후 문자열 : " + str);
	}
}
