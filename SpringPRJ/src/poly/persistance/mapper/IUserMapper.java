package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.UserDTO;

@Mapper("UserMapper")
public interface IUserMapper {

	UserDTO getUserInfo(UserDTO pDTO);

	List<UserDTO> getUserList();

	List<UserDTO> getSearchList(UserDTO uDTO);

}
