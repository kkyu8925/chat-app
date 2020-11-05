package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.UserDTO;
import poly.persistance.mapper.IUserMapper;
import poly.service.IUserService;
import poly.util.CmmUtil;

@Service("UserService")
public class UserService implements IUserService {

	@Resource(name = "UserMapper")
	private IUserMapper userMapper;

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

}
