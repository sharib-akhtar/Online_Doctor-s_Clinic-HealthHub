package com.example.onlineClinic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	 private static final String name="root";
	    private static final String pass="Administrator@69";
	    private static final String url="jdbc:mysql://localhost:3306/onlineclinic";
	public static Connection getConn()throws SQLException
	{
		Connection conn=DriverManager.getConnection(url, name, pass);
		return conn;
	}

}
