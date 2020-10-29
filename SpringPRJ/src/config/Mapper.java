package config;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.stereotype.Component;

@Target({ ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Component
public @interface Mapper {
	/**
	 * The value may indicate a suggestion for a logical mapper name, to be turned into a Spring bean in case of an autodetected component.
	 * 
	 * @return the suggested mapper name, if any
	 */
	String value() default "";
}
