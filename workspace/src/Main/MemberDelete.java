package Main;

import Dao.MemberDao;

public class MemberDelete {
	/*************************************
	 * Main
	 ************************************/
	public static void main(String[] args) {
		String id = "kim";
		int cnt = -1;
		
		MemberDao dao = new MemberDao();
		cnt = dao.DeleteMember(id);
		if(cnt > -1) {
			System.out.println("질의 성공");
		} else {
			System.out.println("질의 실패");
		}
	}
}
