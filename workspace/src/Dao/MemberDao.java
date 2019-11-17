package Dao;

import java.util.ArrayList;
import java.util.List;

import Bean.Member;

/*************************************************************
 * DAO클래스 : 데이터 베이스와 연동하여 추가/수정/삭제/조회 등을 수행하는 클래스
 * MemberDao (2019/11/10)
 *************************************************************/
public class MemberDao extends JdbcConnector {
	/*************************************
	 * Construct
	 ************************************/
	public MemberDao() {
		if(JdbcConnect()) { 
			AutoCommit(false);
			System.out.println("JDBC 접속 객체 성공"); 
		} else { System.out.println("JDBC 접속 객체 실패"); }
	}
	
	/*************************************
	 * 회원 추가 : InsertMember
	 * 회원 수정 : UpdateMember
	 * 회원 삭제 : DeleteMember
	 ************************************/
	public int InsertMember(Member bean) {
		int cnt = -1;
		String sql = "insert into members(id, name, salary, hiredate, address)";
		sql += " values(?,?,?,?,?)";
		System.out.println("[InsertMember] "+sql);
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
		} finally { JdbcClose(); }
		return cnt;
	}
	public int UpdateMember(Member bean) {
		int cnt = -1;
		String sql = "update members";
		sql += " set name=?, salary=?,hiredate=?, address=?";
		sql += " where id=?";
		System.out.println("[UpdateMember] "+sql);
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
		} finally { JdbcClose(); }
		return cnt;
	}
	public int DeleteMember(String id) {
		int cnt = -1;
		String sql = "delete from members where id=?";
		System.out.println("[DeleteMember] "+sql);
		try {
			if(conn == null) { JdbcConnect(); }
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			cnt = pstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			RollBack();
			e.printStackTrace();
		} finally { JdbcClose(); }
		return cnt;
	}
	
	/*************************************
	 * 모든 회원 조회 : SelectMemberAll
	 * 회원 1명만 조회 : SelectMemberOne
	 ************************************/
	public List<Member> SelectMemberAll() {
		String sql = "select * from members";
		List<Member> list = new ArrayList<Member>();
		System.out.println("[SelectMemberAll] "+sql);
		try {
			if(conn == null) { JdbcConnect(); }
			
			pstmt = conn.prepareStatement(sql);
			/** Load In Memory **/
			rs = pstmt.executeQuery(); 
			while(rs.next()) {
				Member bean = new Member();
				bean.setAddress(rs.getString("address"));
				bean.setHiredate(String.valueOf(rs.getDate("hiredate")));
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setSalary(rs.getInt("salary"));
				
				list.add(bean);
			}
			return list;
		} catch (Exception e) { e.printStackTrace(); } 
		finally { JdbcClose(); }
		return null;
	}
	public Member SelectMemberOne(String id) {
		String sql = "select * from members where id=?";
		System.out.println("[SelectMemberOne] "+sql);
		try {
			if(conn == null) { JdbcConnect(); }
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Member bean = new Member();
				bean.setAddress(rs.getString("address"));
				bean.setHiredate(String.valueOf(rs.getDate("hiredate")));
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setSalary(rs.getInt("salary"));
				return bean;
			}
		} catch (Exception e) { e.printStackTrace(); } 
		finally { JdbcClose(); }
		return null;
	}
}