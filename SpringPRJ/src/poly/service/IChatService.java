package poly.service;

import java.util.List;
import java.util.Set;

import poly.dto.ChatDTO;

public interface IChatService {

	// 채팅 룸 리스트 가져오기
	public Set<String> getRoomList() throws Exception;

	// 채팅 대화 저장하기
	public List<ChatDTO> insertChat(ChatDTO pDTO) throws Exception;

	// 채팅 대화 가져오기
	public List<ChatDTO> getChat(ChatDTO pDTO) throws Exception;
	
}