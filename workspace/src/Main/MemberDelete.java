package Main;

import Dao.MemberDao;

public class MemberDelete {
	/*************************************
	 * Main
	 ************************************/
	public static void main(String[] args) {
		String id = "kim";
		
		MemberDao dao = new MemberDao();	

		int cnt = dao.MemberDeleteDao(id);
		if(cnt > -1) {
			System.out.println("질의 성공");
		} else {
			System.out.println("질의 실패");
		}
	}
}
