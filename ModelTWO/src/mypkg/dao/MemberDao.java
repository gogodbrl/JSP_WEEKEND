package mypkg.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mypkg.bean.Member;

public class MemberDao {
	
	private Connection conn = null ;	
	public String driver = "oracle.jdbc.driver.OracleDriver" ; 
	public String url = "jdbc:oracle:thin:@localhost:1521:xe" ;
	public String id = "jspid" ;
	public String password = "jsppw" ;
	
	
	public MemberDao() {
		try {
			Class.forName( driver ) ;
			conn = DriverManager.getConnection(url, id, password) ;
			if(conn != null){
				//System.out.println("접속 성공");
			}else{
				System.out.println("MemberDao : 접속 실패");
			}
		} catch (ClassNotFoundException e) {
			System.out.println("클래스 발견 안되요");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("SQL 예외");
			e.printStackTrace();
		}
	}
	
	public Member GetMemberById( String id ){
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		String sql = " select * from members where id = ? "; 
		
		Member member = null ;
		
		try {
			pstmt = conn.prepareStatement( sql ) ;			
			pstmt.setString(1, id ) ;
			rs = pstmt.executeQuery() ; 
			if( rs.next() ){ //해당 아이디가 존재하는 경우
				member = new Member() ;
				member.setId(rs.getString("id")) ;
				member.setName(rs.getString("name"));
				member.setPassword(rs.getString("password"));
				return member ;				
			}
			return null ;
		} catch (SQLException e) {			
			e.printStackTrace();
			return null ;
		}finally{
			try {
				if( rs != null ){rs.close() ;}
				if( pstmt != null ){pstmt.close() ;}
				if( conn != null ){conn.close() ;}				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	} 
	public Member GetMemberInfomation( Member member ){
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		String sql = " select * from members where id = ? ";
		
		//매개 변수 member는 id와 비번이 들어 있는 넘어온 데이터
		//객체 result는 최종 결과물을 담아서 리턴할 객체(만약 존재하지 않으면 null을 리턴해주도록 한다.)		
		Member result = null ;
		
		try {
			pstmt = conn.prepareStatement( sql ) ;			
			pstmt.setString(1, member.getId()) ;
			rs = pstmt.executeQuery() ; 
			if( rs.next() ){ //해당 아이디가 존재하는 경우
				result = new Member() ;
				
				if (rs.getString("password").equals( member.getPassword() )) {
					result.setId(rs.getString("id")) ;
					result.setName(rs.getString("name"));
					result.setPassword(rs.getString("password"));
					return result ;
				}else{//비번이 틀린 경우
					return null ;
				}
				
			}else{ //없는 아이디
				return null ;
			}		
			
		} catch (SQLException e) {			
			e.printStackTrace();
			return null ;
		}finally{
			try {
				if( rs != null ){rs.close() ;}
				if( pstmt != null ){pstmt.close() ;}
				if( conn != null ){conn.close() ;}				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	} 
	
		
}
