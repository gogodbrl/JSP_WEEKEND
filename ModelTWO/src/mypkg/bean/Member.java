package mypkg.bean;

public class Member {
	/*****************************************************
	 * Variable
	 *****************************************************/
	private String id ;
	private String password ;
	private String name ;
	
	/*****************************************************
	 * Getter & Setter
	 *****************************************************/
	@Override
	public String toString() {
		return String.format("Member [id=%s, password=%s, name=%s]", id, password, name);
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
