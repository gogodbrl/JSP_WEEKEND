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
			System.out.println("JDBC 접속 성공"); 
		} else { System.out.println("JDBC 접속 실패"); }
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
	 * 모든 회원 조회 : SelectMemberAll()
	 * 모든 회원 조회 : SelectMemberAll(int beginRow, int endRow)
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
	public List<Member> SelectMemberAll(int beginRow, int endRow) {
		String sql = " select id, name, salary, hiredate, address"
				+ " from (select id, name, salary, hiredate, address, "
				+ " rank() over(order by id desc) as ranking"
				+ " from members ) "
				+ " where ranking between ? and ? ";
		
		System.out.println("[SelectBoardAll] "+sql);
		try {
			if(conn == null) { JdbcConnect(); }
			if(beginRow < 0) { System.out.println("beginRow is under zero"); return null; }
			if(endRow < 0) { System.out.println("endRow is under zero"); return null; }
			
			List<Member> selectList = new ArrayList<Member>();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, beginRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery(); 
			while(rs.next()) {
				Member bean = new Member();
				bean.setAddress(rs.getString("address"));
				bean.setHiredate(String.valueOf(rs.getDate("hiredate")));
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setSalary(rs.getInt("salary"));
				selectList.add(bean);
			}
			return selectList;
		} catch (Exception e) {	e.printStackTrace(); }
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
	
	/****************************************
	 * 세션 획득을 위한 로그인 정보 조회 : GetLoginInfo
	 ****************************************/
	public Member GetLoginInfo(String id, String name) {
		String sql = " select * from members";
		sql += " where id =? and name = ? ";
		System.out.println(String.format("[%s] %s ", getClass(), sql));
		try {
			if(conn == null) { JdbcConnect(); }
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Member bean = new Member();
				bean.setId(id);
				bean.setName(name);
				return bean;
			}
		} catch (Exception e) { e.printStackTrace(); } 
		finally { JdbcClose(); }
		return null;
	}
	/*************************************
	 * 모든 멤버 수 조회 : SelectTotalUploadCount()
	 ************************************/
	public int SelectTotalUploadCount() {
		String sql = "select count(*) from members";
		System.out.println("[SelectTotalUploadCount] "+sql);
		int result = -1;
		try {
			if(conn == null) { JdbcConnect(); }
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); 
			if(rs.next()){
				result = rs.getInt(1);
			}
		} catch (Exception e) { e.printStackTrace(); }
		return result;
	}
	
}