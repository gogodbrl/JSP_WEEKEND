package Bean;

import java.util.Date;

public class Member {
	/*************************************
	 * Static
	 ************************************/
	private static String FMT_MEMBER_TOSTRING = "Member [id=%s, name=%s, salary=%s, hiredate=%s, address=%s]";
	
	/*************************************
	 * Variable
	 * 데이터베이스의 컬럼 이름과 동일하게 하는게 실수를 줄일 수 있다.
	 ************************************/
	private String id;
	private String name;
	private int salary;
	private String hiredate; //날짜 타입(date)이다.
	private String address;
	
	/*************************************
	 * Construct
	 ************************************/
	public Member() {}
	
	/*************************************
	 * toString
	 ************************************/
	@Override
	public String toString() {
		return String.format(FMT_MEMBER_TOSTRING, id, name, salary, hiredate, address);
	}
	
	/*************************************
	 * Getter & Setter
	 ************************************/
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getHiredate() {
		return hiredate;
	}
	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}
