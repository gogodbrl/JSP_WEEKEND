package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public abstract class JdbcConnector {
	/*************************************
	 * Static
	 ************************************/
	private static final String driver 		= "oracle.jdbc.driver.OracleDriver";
	private static final String id 			= "oraman";
	private static final String password 	= "oracle";
	private static final String url 		= "jdbc:oracle:thin:@localhost:1521:xe";
	
	/*************************************
	 * Variable
	 ************************************/
	protected Connection conn = null;
	protected PreparedStatement pstmt = null;
	protected ResultSet rs = null;
	
	/*************************************
	 * Construct
	 ************************************/
	public JdbcConnector() {}
	
	/*************************************
	 * JDBC 객체 연결  : JdbcConnect()
	 ************************************/
	protected boolean JdbcConnect() {
		try {
			if(conn != null) { return true; }
			Class.forName(driver);
			conn = DriverManager.getConnection(url, id, password);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/*************************************
	 * Connection 객체 연결해제  : JdbcClose()
	 ************************************/
	protected void JdbcClose() {
		try {
			if(pstmt != null) 	{ pstmt.close();	}
			if(rs != null) 		{ rs.close(); 		}
			if(conn != null) 	{ conn.close(); 	}
		} catch (Exception e) { e.printStackTrace(); }
	}
	
	/*************************************
	 * AutoCommit()
	 * RollBack()
	 ************************************/
	protected void AutoCommit(boolean isAutoCommit) {
		try {
			conn.setAutoCommit(isAutoCommit);
		} catch (Exception e) { e.printStackTrace(); }
	}
	protected void RollBack() {
		try { conn.rollback(); } 
		catch (Exception e) { e.printStackTrace(); }
	}
}
