package com.jlab.test;

import java.sql.Connection;
import java.sql.DriverManager;
import org.junit.Test;

public class MySQLConnectionTest {
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	
	private static final String URL = "jdbc:mysql://118.36.130.35:3306/mNote?useSSL=false";
	
	private static final String USER = "jlabdev";
	private static final String PW = "jlabsys123";
	
	@Test
	public void testConnection() throws Exception{
		
		Class.forName(DRIVER);
		
		try(Connection con = DriverManager.getConnection(URL,USER,PW)){
			System.out.println(con);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
