package Main;

import Bean.Board;
import Dao.BoardDao;

public class BoardInsert {
	/*************************************
	 * Main
	 ************************************/
	public static void main(String[] args) {
		BoardDao dao = new BoardDao();
		int cnt = -1;
		
		Board bean = new Board();
		bean.setSubject("Test3");
		bean.setWriter("kim3");
//		bean.setRegdate("2019/11/10");
		bean.setContent("만나서 반갑습니다");
		
		cnt = dao.InsertBoard(bean);
		if(cnt != -1) {
			System.out.println("질의 성공");
		} else {
			System.out.println("질의 실패");
		}
	}
}
