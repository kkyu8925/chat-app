package poly.service.impl;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import poly.dto.ChatDTO;
import poly.persistance.redis.IChatMapper;
import poly.service.IChatService;
import poly.util.CmmUtil;

@Service("ChatService")
public class ChatService implements IChatService {

	@Resource(name = "ChatMapper")
	private IChatMapper chatMapper;

	// 로그 파일 생성 및 로그 출력을 위한 log4j 프레임워크의 자바 객체
	private Logger log = Logger.getLogger(this.getClass());

	@Override
	public Set<String> getRoomList() throws Exception {

		log.info(this.getClass().getName() + ".getRoomList Start!");

		return chatMapper.getRoomList();
	}

	@Override
	public List<ChatDTO> insertChat(ChatDTO pDTO) throws Exception {

		log.info(this.getClass().getName() + ".getRoomList Start!");

		// 채팅 내용 저장
		if (chatMapper.insertChat(pDTO) == 1) {
			log.info("chatMapper.insertChat Success!");

			// 데이터 만료시간 정의(채팅 이후 5분까지만 데이터 저장)
			chatMapper.setTimeOutMinute(CmmUtil.nvl(pDTO.getRoomKey()), 5);

		} else {
			log.info("chatMapper.insertChat Fail!");

		}

		// 채팅 내용 가져오기
		return getChat(pDTO);
	}

	@Override
	public List<ChatDTO> getChat(ChatDTO pDTO) throws Exception {

		log.info(this.getClass().getName() + ".getChat Start!");

		return chatMapper.getChat(pDTO);
	}

}