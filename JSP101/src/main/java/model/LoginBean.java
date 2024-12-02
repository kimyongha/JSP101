package model;

import javax.servlet.http.HttpServlet;

public class LoginBean extends HttpServlet {

	
	private String id;
	private String passwd;
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	

	
	public boolean validator() {
		
		
		if(passwd.equals("1234")) {
			
			
			return true;
			
		} else {
			
			return false;
			
		}
		
		
		
	}

	
	
	
	
	

}
