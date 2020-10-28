package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.TestDTO;
import poly.persistance.mapper.ITestMapper;
import poly.service.ITestService;

@Service("TestService")
public class TestService implements ITestService {

	@Resource(name = "TestMapper")
	private ITestMapper testMapper;

	@Override
	public List<TestDTO> getList() {
		return testMapper.getList();
	}

}
