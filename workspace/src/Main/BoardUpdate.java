package Main;

import Bean.Board;
import Dao.BoardDao;

public class BoardUpdate {
	/*************************************
	 * Main
	 ************************************/
	public static void main(String[] args) {
		int cnt = -1;
		int no = 7;
		BoardDao dao = new BoardDao();
		
		Board bean = new Board();
		bean.setNo(no);
		bean.setSubject("김정아UPDATE");
		bean.setRegdate("2019/11/10");
		bean.setContent("만나서 반갑습니다.");
		bean.setWriter("choi");
		
		cnt = dao.UpdateBoard(bean);
		if(cnt != -1) {
			System.out.println("질의 성공");
		} else {
			System.out.println("질의 실패");
		}
	}
}
