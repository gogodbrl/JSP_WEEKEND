package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import Bean.Member;

/*************************************************************
 * DAO클래스 : 데이터 베이스와 연동하여 추가/수정/삭제/조회 등을 수행하는 클래스
 * MemberDao (2019/11/10)
 *************************************************************/
public class MemberDao {
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
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	
	/*************************************
	 * Construct
	 ************************************/
	public MemberDao() {
		if(JdbcConnect()) { 
			JdbcSetAutoCommit(false);
			System.out.println("JDBC 접속 객체 성공"); 
		} else { System.out.println("JDBC 접속 객체 실패"); }
	}
	
	/*************************************
	 * JDBC 객체 연결 
	 * JdbcConnect()
	 ************************************/
	public boolean JdbcConnect() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, id, password);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/*************************************
	 * Connection 객체 연결해제  
	 * JdbcClose()
	 ************************************/
	private void JdbcClose() {
		try {
			if(pstmt != null) { pstmt.close(); }
			if(pstmt.isClosed() && conn != null) { conn.close(); }
			if(conn != null) { conn.close(); }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/*************************************
	 * AutoCommit 실행 여부
	 * JdbcSetAutoCommit()
	 ************************************/
	private void JdbcSetAutoCommit(boolean isAutoCommit) {
		try {
			conn.setAutoCommit(isAutoCommit);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/*************************************
	 * Query 롤백
	 * RollBack()
	 ************************************/
	private void RollBack() {
		try {
			conn.rollback();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/*************************************
	 * 회원 추가 : MemberInsertDao
	 * 회원 수정 : MemberUpdateDao
	 * 회원 삭제 : MemberDeleteDao
	 ************************************/
	public int MemberInsertDao(Member bean) {
		int cnt = -1;
		String sql = "insert into members(id, name, salary, hiredate, address)";
		sql += " values(?,?,?,?,?)";
		try {
			if(conn == null) { JdbcConnect(); }
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getName());
			pstmt.setInt(3, bean.getSalary());
			pstmt.setString(4, bean.getHiredate());
			pstmt.setString(5, bean.getAddress());
			cnt = pstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			RollBack();
			e.printStackTrace();
		} finally {
			JdbcClose();
		}
		return cnt;
	}
	public int MemberUpdateDao(Member bean) {
		int cnt = -1;
		String sql = "update members";
		sql += " set name=?, salary=?,hiredate=?, address=?";
		sql += " where id=?";
		try {
			if(conn == null) { JdbcConnect(); }
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setInt(2, bean.getSalary());
			pstmt.setString(3, bean.getHiredate());
			pstmt.setString(4, bean.getAddress());
			pstmt.setString(5, bean.getId());
			cnt = pstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			RollBack();
			e.printStackTrace();
		} finally {
			JdbcClose();
		}
		return cnt;
	}
	public int MemberDeleteDao(String id) {
		int cnt = -1;
		String sql = "delete from members where id=?";
		try {
			if(conn == null) { JdbcConnect(); }
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			cnt = pstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			RollBack();
			e.printStackTrace();
		} finally {
			JdbcClose();
		}
		return cnt;
	}
	
	/*************************************
	 * 모든 회원 조회 : MemberAllDao
	 * 회원 1명만 조회 : MemberOneDao
	 ************************************/
	public int MemberAllDao() {
		return 0;
	}
	
	public int MemberOneDao() {
		return 0;
	}
}
