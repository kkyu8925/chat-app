package poly.persistance.redis;

import java.util.List;
import java.util.Set;

import poly.dto.ChatDTO;

public interface IChatMapper {

	// 채팅 룸 리스트 가져오기
	public Set<String> getRoomList() throws Exception;

	// 채팅 대화 저장하기
	public int insertChat(ChatDTO pDTO) throws Exception;

	// 채팅 대화 가져오기
	public List<ChatDTO> getChat(ChatDTO pDTO) throws Exception;

	// 데이터 저장 유효시간을 시간 단위로 설정
	public boolean setTimeOutHour(String roomKey, int hours) throws Exception;

	// 데이터 저장 유효시간을 분 단위로 설정
	public boolean setTimeOutMinute(String roomKey, int minutes) throws Exception;
	

}
