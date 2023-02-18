package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {

	/*
	 * Creating the variable "factory" of SessionFactory type for holding the configurations of sessionFactory 
	 * >> Why static? 
	 * Because when we want to use "getFactory" function 
	 * then we would not require to create it's object (i.e. FactorProvider object). 
	 * For this reason we also have to make "factory" variable as static because in static methods we can
	 * only call static variables.
	 * In this way it can also help in memory management by not creating irrelevant objects.
	 */
	
	public static SessionFactory factory;
	
	public static SessionFactory getFactory()
	{
		
		if (factory == null)
		{
			factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		}
		return factory;
	}
	
	public void closeFactory()
	{
		if (factory.isOpen())
		{
			factory.close();
		}
	}
}
