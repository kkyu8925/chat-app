package poly.dto;

public class ChatDTO {

	private String roomKey = "";
	private String user_name = "";
	private String msg = "";
	private String dateTime = "";
	private String type = ""; // admin / user / who

	public String getRoomKey() {
		return roomKey;
	}

	public void setRoomKey(String roomKey) {
		this.roomKey = roomKey;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
