package com.za.tutorial.java.security;
import java.io.IOException;
import java.io.*;
import java.util.Map;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.security.auth.Subject;
import javax.security.auth.callback.Callback;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.callback.NameCallback;
import javax.security.auth.callback.PasswordCallback;
import javax.security.auth.callback.UnsupportedCallbackException;
import javax.security.auth.login.FailedLoginException;
import javax.security.auth.login.LoginException;
import javax.security.auth.spi.LoginModule;

public class ZaLoginModule implements LoginModule {
	
	public static final String TEST_USERNAME = "vimal";
	public static final String TEST_PASSWORD = "123";	
	
	private CallbackHandler callbackHandler = null;
	private boolean authenticationSuccessFlag=false;
	
	@Override
	public void initialize(Subject subject, CallbackHandler callbackHandler, Map<String, ?> sharedState,
			Map<String, ?> options) {
		this.callbackHandler=callbackHandler;
	}
	@Override
	public boolean login() throws LoginException {
        
		Callback[] callbackArray = new Callback[2];
		callbackArray[0] = new NameCallback("User name : ");
		callbackArray[1] = new PasswordCallback("Password : ",false);		
		try {
			callbackHandler.handle(callbackArray);
		} catch (IOException | UnsupportedCallbackException e) {
			e.printStackTrace();
		}
		String userid = ((NameCallback) callbackArray[0]).getName();
		String pwd = new String(((PasswordCallback) callbackArray[1]).getPassword());
	
		// System.out.println(name);
		// System.out.println(password);

//-----------------------------------------------
		// NameCallback nameCallback = new NameCallback("User name : ");
		// PasswordCallback passwordCallback = new PasswordCallback("Password : ",false);		
  //   try 
  //   {
  //       callbackHandler.handle(new Callback[]{na meCallback, passwordCallback});
  //       String name = nameCallback.getName();
  //       String password = new String(passwordCallback.getPassword());

		// if(TEST_USERNAME.equals(name) && TEST_PASSWORD.equals(password))
		// {
		// 	System.out.println("Authentication Success...");
		// 	authenticationSuccessFlag=true;
		// }
		// else
		// {
		// 	System.out.println("Authentication Failure...");
		// 	authenticationSuccessFlag=false;
		// }
	// } 
	// catch (IOException | UnsupportedCallbackException e) {
	// 		e.printStackTrace();
	// 	}
	//  	return authenticationSuccessFlag;
	// }

	//--------------------------------------------------------------------------------
	boolean flag=false;
	try
	{
	 Class.forName("org.postgresql.Driver").newInstance();
	 Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "1234");
	 c.setAutoCommit(false);
	 Statement stmt = c.createStatement();
	 ResultSet rs = stmt.executeQuery( "SELECT * FROM admin_details where admin_name='"+userid+"'");
	 
	 if(rs.next())
	 {
	 	flag=true;
	    if(rs.getString("admin_password").equals(pwd))
	    {
	    	authenticationSuccessFlag=true;
	        stmt.close();
	        c.close();
	    }
	 }

	else
	{
		authenticationSuccessFlag=false;
	}

	if(!flag)
	{
		authenticationSuccessFlag=false;
	}
	}
	catch ( Exception e ) {
	         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
	      }
	 	return authenticationSuccessFlag;
	}
	//--------------------------------------------------------------------------------
	@Override
	public boolean commit() throws LoginException {
		return authenticationSuccessFlag;
	}
	@Override
	public boolean abort() throws LoginException {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean logout() throws LoginException {
		// TODO Auto-generated method stub
		return false;
	}
}
