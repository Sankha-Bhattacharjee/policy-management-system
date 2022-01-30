package com.policymanagement.test;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DbConnection {

	public static Connection returnConnectionObject(){
		Connection conn=null;
		
		Properties prp = new Properties();
		try {
			prp.load(new FileInputStream("src/main/resources/application.properties"));
			String dburl = prp.getProperty("spring.datasource.url");
			String user = prp.getProperty("spring.datasource.username");
			String passw = prp.getProperty("spring.datasource.password");
			conn = DriverManager.getConnection(dburl, user, passw);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return conn;
	}
}
