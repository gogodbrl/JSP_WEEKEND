package Main;

import Bean.Board;
import Dao.BoardDao;

public class BoardSelectOne {
	/*************************************
	 * Main
	 ************************************/
	public static void main(String[] args) {
		BoardDao dao = new BoardDao();
		
		String writer = "hong";
		
		Board bean = dao.SelectBoardOne(writer);
		if(bean == null) { 
			System.out.println("Member Bean is null"); 
			return ; 
		}
		System.out.println(bean.toString());
	}
}
