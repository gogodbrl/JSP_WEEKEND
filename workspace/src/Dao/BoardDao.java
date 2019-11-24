package Dao;

import java.util.ArrayList;
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
	 * 게시물 추가 		: InsertBoard
	 * 게시물 댓글 추가 	: InsertReplyBoard
	 * 게시물 수정 		: UpdateBoard
	 * 게시물 삭제 		: DeleteBoard
	 *************************************/
	public int InsertBoard(Board bean) {
		int cnt = -1;
		String sql = "insert into boards(no, subject, writer, content, groupno, orderno, depth)";
		sql += " values(SEQTEST.nextval,?,?,?, SEQTEST.currval, 0, 0)";
		System.out.println("[InsertBoard] "+sql);
		try {
			if(conn == null) { JdbcConnect(); }
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getSubject());
			pstmt.setString(2, bean.getWriter());
			pstmt.setString(3, bean.getContent());
			cnt = pstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			RollBack();
			e.printStackTrace();
		} finally { JdbcClose(); }
		return cnt;
	}
	public int InsertReplyBoard(Board bean) {
		int cnt = -1;
		String sql = "insert into boards(no, subject, writer, content, regdate, groupno, orderno, depth)";
		sql += " values(SEQTEST.nextval,?,?,?, sysdate, SEQTEST.currval, 0, 0)";
		System.out.println("[InsertBoard] "+sql);
		try {
			if(conn == null) { JdbcConnect(); }
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getSubject());
			pstmt.setString(2, bean.getWriter());
			pstmt.setString(3, bean.getContent());
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
		System.out.println("[UpdateBoard] "+sql);
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
		System.out.println("[DeleteBoard] "+sql);
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
	 * 모든 게시물 조회 : SelectBoardAll()
	 * 모든 게시물 조회 : SelectBoardAll(int beginRow, int endRow)
	 * 하나의 게시물 조회 : SelectBoardOne
	 ************************************/
	public List<Board> SelectBoardAll() {
		String sql = "select * from boards";
		System.out.println("[SelectBoardAll] "+sql);
		try {
			if(conn == null) { JdbcConnect(); }

			List<Board> selectList = new ArrayList<Board>();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); 
			while(rs.next()) {
				Board bean = new Board();
				bean.setNo(rs.getInt("no"));
				bean.setContent(rs.getString("content"));
				bean.setRegdate(String.valueOf(rs.getDate("regdate")) );
				bean.setSubject(rs.getString("subject"));
				bean.setWriter(rs.getString("writer"));
				bean.setGroupno(rs.getInt("groupno"));
				bean.setOrderno(rs.getInt("orderno"));
				bean.setDepth(rs.getInt("depth"));
				selectList.add(bean);
			}
			return selectList;
		} catch (Exception e) {	e.printStackTrace(); }
		return null;
	}
	public List<Board> SelectBoardAll(int beginRow, int endRow) {
		String sql = " select no, subject, writer, content, regdate, groupno, orderno, depth"
				+ " from (select no, subject, writer, content, regdate, groupno, orderno, depth, "
				+ " rank() over(order by no desc) as ranking"
				+ " from boards ) "
				+ " where ranking between ? and ? ";
		
		System.out.println("[SelectBoardAll] "+sql);
		try {
			if(conn == null) { JdbcConnect(); }
			if(beginRow < 0) { System.out.println("beginRow is under zero"); return null; }
			if(endRow < 0) { System.out.println("endRow is under zero"); return null; }
			
			List<Board> selectList = new ArrayList<Board>();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, beginRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery(); 
			while(rs.next()) {
				Board bean = new Board();
				bean.setNo(rs.getInt("no"));
				bean.setContent(rs.getString("content"));
				bean.setWriter(rs.getString("writer"));
				bean.setRegdate(String.valueOf(rs.getDate("regdate")) );
				bean.setSubject(rs.getString("subject"));
				bean.setGroupno(rs.getInt("groupno"));
				bean.setOrderno(rs.getInt("orderno"));
				bean.setDepth(rs.getInt("depth"));
				selectList.add(bean);
			}
			return selectList;
		} catch (Exception e) {	e.printStackTrace(); }
		return null;
	}
	public Board SelectBoardOne(String no) {
		String sql = "select * from boards where no=?";
		try {
			if(conn == null) { JdbcConnect(); }
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			
			System.out.println("[SelectBoardOne] "+sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Board bean = new Board();
				bean.setNo(rs.getInt("no"));
				bean.setContent(rs.getString("content"));
				bean.setRegdate(String.valueOf(rs.getDate("regdate")) );
				bean.setSubject(rs.getString("subject"));
				bean.setWriter(rs.getString("writer"));
				return bean;
			}
		} catch (Exception e) { e.printStackTrace(); } 
		finally { JdbcClose(); }
		return null;
	}
	/*************************************
	 * 모든 게시물 갯수 조회 : SelectTotalUploadCount()
	 ************************************/
	public int SelectTotalUploadCount() {
		String sql = "select count(*) from boards";
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
