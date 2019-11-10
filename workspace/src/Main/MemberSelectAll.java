package Main;

import java.util.List;

import Bean.Member;
import Dao.MemberDao;

public class MemberSelectAll {
	/*************************************
	 * Main
	 ************************************/
	public static void main(String[] args) {
		MemberDao dao = new MemberDao();
		
		List<Member> list = dao.SelectMemberAll();
		if(list == null) { 
			System.out.println("List is null"); 
			return ; 
		}
		for (Member bean : list) { 
			System.out.println(bean.toString());
		}
	}
}
