package Main;

import Bean.Member;
import Dao.MemberDao;

public class MemberSelectOne {
	/*************************************
	 * Main
	 ************************************/
	public static void main(String[] args) {
		String id = "hong";
		
		MemberDao dao = new MemberDao();
		Member member = dao.SelectMemberOne(id);
		if(member == null) { 
			System.out.println("Member Bean is null"); 
			return ; 
		}
		System.out.println(member.toString());
	}
}
