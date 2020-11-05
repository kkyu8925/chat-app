package poly.dto;

/**
 * @author 강현규
 * @version 1.0 공지사항 DTO
 */
public class UserDTO {
	private String user_no; // 유저번호 insert시, 자동으로 증가
	private String user_email; // 유저 이메일
	private String user_pw; // 유저 비밀번호
	private String user_name; // 유저이름
	private String reg_id; // 등록 아이디
	private String reg_dt; // 등록 일자 default 현재 시간들어감
	private String chg_id; // 변경 아이디
	private String chg_dt; // 변경일자 default 현재 시간들어감
	private String Exists_yn; 

	public String getExists_yn() {
		return Exists_yn;
	}

	public void setExists_yn(String exists_yn) {
		Exists_yn = exists_yn;
	}

	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

	public String getChg_id() {
		return chg_id;
	}

	public void setChg_id(String chg_id) {
		this.chg_id = chg_id;
	}

	public String getChg_dt() {
		return chg_dt;
	}

	public void setChg_dt(String chg_dt) {
		this.chg_dt = chg_dt;
	}

}
