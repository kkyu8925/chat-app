package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.UserDTO;

@Mapper("UserMapper")
public interface IUserMapper {

	UserDTO getUserInfo(UserDTO pDTO) throws Exception ;

	List<UserDTO> getUserList() throws Exception;

	List<UserDTO> getSearchList(UserDTO uDTO) throws Exception;

	UserDTO getUserExists(UserDTO pDTO) throws Exception;

	int insertUserInfo(UserDTO pDTO) throws Exception;

	UserDTO emailCheckForAjax(UserDTO pDTO) throws Exception;

	int insertNewPassword(UserDTO pDTO) throws Exception;

	UserDTO getUserExists2(UserDTO pDTO) throws Exception;

}
