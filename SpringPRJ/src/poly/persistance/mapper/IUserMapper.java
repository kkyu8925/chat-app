package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.UserDTO;

@Mapper("UserMapper")
public interface IUserMapper {
	
	// 유저 정보 가져오기
	UserDTO getUserInfo(UserDTO pDTO) throws Exception ;
	
	// 유저리스트 가져오기 ajax
	List<UserDTO> getUserList() throws Exception;
	
	// 서칭 유저리스트 가져오기 ajax
	List<UserDTO> getSearchList(UserDTO uDTO) throws Exception;
	
	// 유저 존재 여부 확인
	UserDTO getUserExists(UserDTO pDTO) throws Exception;
	
	// 회원가입
	int insertUserInfo(UserDTO pDTO) throws Exception;
	
	// 이메일 중복 확인 ajax
	UserDTO emailCheckForAjax(UserDTO pDTO) throws Exception;
	
	// 비밀번호 찾기 램덤 비밀번호 업데이트
	int insertNewPassword(UserDTO pDTO) throws Exception;
	
	// 비밀번호 찾기 이메일 확인
	UserDTO getUserExists2(UserDTO pDTO) throws Exception;
	
	// 유저번호로 유저 정보가져오기
	UserDTO getUserInfoforNo(UserDTO pDTO) throws Exception;
	
	// 유저 이름 변경
	int chgPWProc(UserDTO pDTO) throws Exception;
	
	// 유저 비밀번호 변경
	int chgNameProc(UserDTO pDTO) throws Exception;

}
