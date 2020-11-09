package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.MailDTO;
import poly.dto.UserDTO;
import poly.persistance.mapper.IUserMapper;
import poly.service.IMailService;
import poly.service.IUserService;
import poly.util.CmmUtil;
import poly.util.EncryptUtil;

@Service("UserService")
public class UserService implements IUserService {

	@Resource(name = "UserMapper")
	private IUserMapper userMapper;
	
	// 메일 발송을 위한 MailService 자바객체 가져오기
	@Resource(name = "MailService")
	private IMailService mailService;

	@Override
	public UserDTO getUserInfo(UserDTO pDTO) throws Exception {
		return userMapper.getUserInfo(pDTO);
	}

	@Override
	public List<UserDTO> getUserList() throws Exception {
		return userMapper.getUserList();
	}

	@Override
	public List<UserDTO> getSearchList(UserDTO uDTO) throws Exception {
		return userMapper.getSearchList(uDTO);
	}

	@Override
	public int insertUserInfo(UserDTO pDTO) throws Exception {

		// 회원가입 성공 :1, 아이디 중복으로인한 실패:2, 기타에러:0
		int res = 0;

		// controller에서 같이 정상적으로 못 넘어오는 경우 대비
		if (pDTO == null) {
			pDTO = new UserDTO();
		}

		// 회원 가입 중복 방지를 위해 DB에서 테이터 조회 
		UserDTO rDTO = userMapper.getUserExists(pDTO);

		// mapper에서 같이 정상적으로 못 넘어오는 경우 대비
		if (rDTO == null) {
			rDTO = new UserDTO();
		}

		// 중복된 회원정보가 있는 경우, 결과값을 2로 변경, 더이상 작업 진행안함
		if (CmmUtil.nvl(rDTO.getExists_yn()).equals("Y")) {
			res = 2;

		} else { // 중복이 아니면 계속 진행

			// 회원 가입
			int success = userMapper.insertUserInfo(pDTO);

			// db에 데이터가 등록
			if (success > 0) {

				res = 1; // 1:성공

			} else {
				res = 0;
			}
		}
		return res;
	}

	@Override
	public UserDTO emailCheckForAjax(UserDTO pDTO) throws Exception {
		return userMapper.emailCheckForAjax(pDTO);
	}

	@Override
	public int findPasswordProc(UserDTO pDTO) throws Exception {
		
		// 비밀번호변경성공 :1, 회원가입안함:2, 오류:0
		int res = 0;
		
		// controller에서 같이 정상적으로 못 넘어오는 경우 대비
		if (pDTO == null) {
			pDTO = new UserDTO();
		}
		
		// 가입회원인지 확인 이메일&유저이름 확인
		UserDTO rDTO = userMapper.getUserExists2(pDTO);

		// mapper에서 같이 정상적으로 못 넘어오는 경우 대비
		if (rDTO == null) {
			rDTO = new UserDTO();
		}

		// 회원 정보가 있다면 비번 변경후 매일 전송.
		if (CmmUtil.nvl(rDTO.getExists_yn()).equals("Y")) {
			
			String newPassword = RandomNum();
			
			// 비밀번호는 절대로 복호화되지 않도록 해시 알고리즘으로 암호화
			pDTO.setUser_pw(EncryptUtil.encHashSHA256(newPassword));
			
			int passRes = userMapper.insertNewPassword(pDTO);
			
			if(passRes==1) {
			/*
			 * ###################################################
			 * 
			 * 메일 발송 로직 추가 시작
			 * 
			 * ###################################################
			 */

			MailDTO mDTO = new MailDTO();

			// 회원가입화면에서 입력받은 이메일 변수(암호화되어 넘어오기 떄문에 복호화 수행)
			mDTO.setToMail(EncryptUtil.decAES128CBC(CmmUtil.nvl(pDTO.getUser_email())));

			// 제목
			mDTO.setTitle("Chat 계정의 비밀번호가 변경되었습니다.");
			// 내용 가입자 이름넣어 발송
			mDTO.setContents(CmmUtil.nvl(pDTO.getUser_name()) + "님의 비밀번호가 "+newPassword+"로 변경되었습니다. 로그인 후 비밀번호를 변경해주세요.");

			// 발송
			mailService.doSendMail(mDTO);

			/*
			 * ###################################################
			 * 
			 * 메일 발송 로직 추가 끝
			 * 
			 * ###################################################
			 */
			res = 1;
			}

		} else { // 회원 아니라면 종료

			res = 2;
		}
		return res;
	}
	
	 public String RandomNum() {
	    	StringBuffer buffer = new StringBuffer();
	    	for(int i = 0; i < 6; i++) {
	    		int n = (int)(Math.random() * 10);
	    		buffer.append(n);
	    		
	    	}
	    	return buffer.toString();
	 }
	 	

}
