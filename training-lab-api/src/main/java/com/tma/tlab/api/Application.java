package com.tma.tlab.api;

//import io.katharsis.spring.boot.v3.KatharsisConfigV3;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;

import io.katharsis.spring.boot.v3.KatharsisConfigV3;
//import org.springframework.context.annotation.Import;

@SpringBootApplication
@Import({ KatharsisConfigV3.class })
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

}