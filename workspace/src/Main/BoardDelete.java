package Main;

import Dao.BoardDao;

public class BoardDelete {
	/*************************************
	 * Main
	 ************************************/
	public static void main(String[] args) {
		int no = 1;
		
		BoardDao dao = new BoardDao();	
		int cnt = dao.DeleteBoard(no);
		if(cnt > -1) {
			System.out.println("질의 성공");
		} else {
			System.out.println("질의 실패");
		}
	}
}
