package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.TestDTO;

@Mapper("TestMapper")
public interface ITestMapper {

	List<TestDTO> getList();

	
}
