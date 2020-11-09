package poly.service;

import java.util.List;

import poly.dto.UserDTO;

public interface IUserService {
	
	// 로그인 위해 유저 정보 가져오기
	UserDTO getUserInfo(UserDTO pDTO) throws Exception;
	
	// ajax 전체 유저 가져오기
	List<UserDTO> getUserList() throws Exception;
	
	// ajax user_name 서칭해서 같은 유저 리스트 가져오기
	List<UserDTO> getSearchList(UserDTO uDTO) throws Exception;
	
	// 회원가입하기(회원정보 등록)
	int insertUserInfo(UserDTO pDTO) throws Exception;

	UserDTO emailCheckForAjax(UserDTO pDTO) throws Exception;

	int findPasswordProc(UserDTO pDTO) throws Exception;
	
}
