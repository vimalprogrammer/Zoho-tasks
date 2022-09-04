package com.za.tutorial.java.secutity;
import java.io.IOException;
import java.util.Map;
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
		String name = ((NameCallback) callbackArray[0]).getName();
		String password = new String(((PasswordCallback) callbackArray[1]).getPassword());
		
		if(TEST_USERNAME.equals(name) && TEST_PASSWORD.equals(password))
		{
			System.out.println("Authentication Success...");
			authenticationSuccessFlag=true;
		}
		else
		{   
			authenticationSuccessFlag=false;
			throw new FailedLoginException("authentication failure...");
		}
		return authenticationSuccessFlag;
	}
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
