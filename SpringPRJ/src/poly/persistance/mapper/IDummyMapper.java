package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.DummyDTO;

@Mapper("DummyMapper")
public interface IDummyMapper {

	//게시판 리스트
	List<DummyDTO> getDummyList() throws Exception;
	
}
