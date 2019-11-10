package Dao;

import java.util.List;

import Bean.Board;

public class BoardDao extends JdbcConnector {
	/*************************************
	 * Construct
	 ************************************/
	public BoardDao() {
		if(JdbcConnect()) { 
			AutoCommit(false);
			System.out.println("JDBC 접속 객체 성공"); 
		} else { System.out.println("JDBC 접속 객체 실패"); }
	}
	
	/*************************************
	 * 게시물 추가 : InsertBoard
	 * 게시물 수정 : UpdateBoard
	 * 게시물 삭제 : DeleteBoard
	 *************************************/
	public int InsertBoard(Board bean) {
		int cnt = -1;
		String sql = "insert into boards(no, subject, writer, content, regdate)";
		sql += " values(SEQTEST.nextval,?,?,?,?)";
		try {
			if(conn == null) { JdbcConnect(); }
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getSubject());
			pstmt.setString(2, bean.getWriter());
			pstmt.setString(3, bean.getContent());
			pstmt.setString(4, bean.getRegdate());
			
			cnt = pstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			RollBack();
			e.printStackTrace();
		} finally { JdbcClose(); }
		return cnt;
	}
	public int UpdateBoard(Board bean) {
		int cnt = -1;
		String sql = "update boards";
		sql += " set subject=?, writer=?, content=?, regdate=?";
		sql += " where no=?";
		try {
			if(conn == null) { JdbcConnect(); }
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getSubject());
			pstmt.setString(2, bean.getWriter());
			pstmt.setString(3, bean.getContent());
			pstmt.setString(4, bean.getRegdate());
			pstmt.setInt(5, bean.getNo());
			cnt = pstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			RollBack();
			e.printStackTrace();
		} finally { JdbcClose(); }
		return cnt;
	}
	public int DeleteBoard(int no) {
		int cnt = -1;
		String sql = "delete from boards where no=?";
		try {
			if(conn == null) { JdbcConnect(); }
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			cnt = pstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			RollBack();
			e.printStackTrace();
		} finally { JdbcClose(); }
		return cnt;
	}
	
	/*************************************
	 * 모든 게시물 조회 : SelectBoardAll
	 * 하나의 게시물 조회 : SelectBoardOne
	 ************************************/
	public List<Board> SelectBoardAll() {
		return null;
	}
	public Board SelectBoardOne() {
		return null;
	}
}
