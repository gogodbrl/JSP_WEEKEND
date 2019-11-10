package Main;

import Bean.Member;
import Dao.MemberDao;

public class MemberUpdate {
	/*************************************
	 * Main
	 ************************************/
	public static void main(String[] args) {
		int cnt = -1;
		MemberDao dao = new MemberDao();
		
		Member bean = new Member();
		bean.setId("kim2");
		bean.setName("김정아UPDATE");
		bean.setHiredate("2019/11/10");
		bean.setAddress("서울시 관악구");
		bean.setSalary(7776);
		
		cnt = dao.MemberUpdateDao(bean);
		if(cnt != -1) {
			System.out.println("질의 성공");
		} else {
			System.out.println("질의 실패");
		}
	}
}
