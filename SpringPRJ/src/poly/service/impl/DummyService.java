package poly.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.persistance.mapper.IDummyMapper;
import poly.service.IDummyService;

@Service("DummyService")
public class DummyService implements IDummyService{
	
	@Resource(name="DummyMapper")
	private IDummyMapper dummyMapper;

}
