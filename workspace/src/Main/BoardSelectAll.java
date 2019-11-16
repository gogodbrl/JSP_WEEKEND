package Main;

import java.util.List;

import Bean.Board;
import Dao.BoardDao;

public class BoardSelectAll {
	/*************************************
	 * Main
	 ************************************/
	public static void main(String[] args) {
		BoardDao dao = new BoardDao();
		
		List<Board> list = dao.SelectBoardAll();
		if(list == null) { 
			System.out.println("List is null"); 
			return ; 
		}
		for (Board bean : list) { 
			System.out.println(bean.toString());
		}
	}
}
