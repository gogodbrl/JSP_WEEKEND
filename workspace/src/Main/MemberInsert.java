package Main;

import Bean.Member;
import Dao.MemberDao;

public class MemberInsert {
	/*************************************
	 * Main
	 ************************************/
	public static void main(String[] args) {
		MemberDao dao = new MemberDao();
		int cnt = -1;
		
		Member bean = new Member();
		bean.setAddress("서울시 압구정동");
		bean.setHiredate("2000/08/15");
		bean.setId("choi2");
		bean.setName("최영");
		bean.setSalary(1234);
		
		cnt = dao.InsertMember(bean);
		if(cnt != -1) {
			System.out.println("질의 성공");
		} else {
			System.out.println("질의 실패");
		}
	}
}
