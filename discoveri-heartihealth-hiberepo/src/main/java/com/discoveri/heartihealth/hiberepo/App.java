package com.discoveri.heartihealth.hiberepo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

/**
 * Hello world!
 *
 */
@SpringBootApplication(scanBasePackages = "com.discoveri.heartihealth")
//@EnableJpaRepositories(basePackages = {"com.discoveri.heartihealth"})
public class App {

	public static void main(String[] args) {

		SpringApplication.run(App.class, args);

	}

	

}
