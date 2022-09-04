package com.za.tutorial.java.secutity;

import java.io.IOException;

import javax.security.auth.callback.Callback;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.callback.NameCallback;
import javax.security.auth.callback.PasswordCallback;
import javax.security.auth.callback.UnsupportedCallbackException;

public class ZaCallbackHandler implements CallbackHandler {

	private String user = null;
	private String password = null;
	
	public ZaCallbackHandler(String user, String password)
	{
		this.user=user;
		this.password=password;
	}
	
	@Override
	public void handle(Callback[] callbackArray) throws IOException, UnsupportedCallbackException {
		
		int cnt=0;
		while(cnt<callbackArray.length)
		{
			if(callbackArray[cnt] instanceof NameCallback)
			{
				NameCallback nameCallback = (NameCallback) callbackArray[cnt++];
				nameCallback.setName(user);
			}
			else if(callbackArray[cnt] instanceof PasswordCallback)
			{
				PasswordCallback passwordCallback = (PasswordCallback) callbackArray[cnt++];
				passwordCallback.setPassword(password.toCharArray());
			}
		}
		
	}


}
