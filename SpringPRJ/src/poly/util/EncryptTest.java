  
package poly.util;

// 해시 암호화 알고리즘 테스트
public class EncryptTest {

	public static void main(String[] args) throws Exception {

		System.out.println("---------------------");
		System.out.println("해시 암호화 알고리즘");
		// 암호화할 문자열
		String str = "암호화 대기중";

		// 복화하가 불가능한 해시암호화 알고리즘 실행
		String hasEnc = EncryptUtil.encHashSHA256(str);

		// 해시 암호화 알고리즘 결과 출력
		System.out.println("hasEnc : " + hasEnc);
		System.out.println("---------------------");
		System.out.println("AES128-CBC 암호화,암복호화 알고리즘");

		// AES128-CBC 암호화 알고리즘 실행
		String enc = EncryptUtil.encAES128CBC(str);

		// AES128-CBC 암호화 알고리즘 결과 출력
		System.out.println("enc : " + enc);

		// AES128-CBC 복호화 알고리즘 실행
		String dec = EncryptUtil.decAES128CBC(enc);

		// AES128-CBC 복호화 알고리즘 결과 출력
		System.out.println("dec : " + dec);

		System.out.println("-----------------------");

	}

}