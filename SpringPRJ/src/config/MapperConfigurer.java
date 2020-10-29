package config;

import org.mybatis.spring.mapper.MapperScannerConfigurer;

public class MapperConfigurer extends MapperScannerConfigurer {

	/**
	 * 기본 정보(anntationClass, sqlSessionFactoryBeanName)으로 설정한다.
	 */
	public MapperConfigurer() {
		super.setAnnotationClass(Mapper.class);
		super.setSqlSessionFactoryBeanName("sqlSession");
	}
	
}
