package com.discoveri.heartihealth.repo;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.springframework.context.annotation.Bean;


public class HibernateConfig {
	
	@Bean
	public SessionFactory buildSessionFactory() {
	
		Configuration configObj = new Configuration();
		configObj.configure("hibernate.cfg.xml");

	
		ServiceRegistry serviceRegistryObj = new StandardServiceRegistryBuilder().applySettings(configObj.getProperties()).build(); 

	
		SessionFactory sessionFactoryObj = configObj.buildSessionFactory(serviceRegistryObj);
		return sessionFactoryObj;
	}

}
