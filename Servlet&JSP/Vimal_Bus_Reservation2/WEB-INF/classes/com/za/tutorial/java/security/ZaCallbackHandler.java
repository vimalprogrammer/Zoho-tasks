package com.za.tutorial.java.security;

import java.io.IOException;

import javax.security.auth.callback.Callback;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.callback.NameCallback;
import javax.security.auth.callback.PasswordCallback;
import javax.security.auth.callback.UnsupportedCallbackException;

public class ZaCallbackHandler implements CallbackHandler {

	private String userid = null;
	private String password = null;
	
	public ZaCallbackHandler(String userid, String password)
	{
		this.userid=userid;
		this.password=password;
	}
	
	@Override
	public void handle(Callback[] callbackArray) throws IOException, UnsupportedCallbackException {
		
		NameCallback nameCallback = null;
		PasswordCallback passwordCallback=null;

		int cnt=0;
		while(cnt<callbackArray.length)
		{
			if(callbackArray[cnt] instanceof NameCallback)
			{
				nameCallback = (NameCallback) callbackArray[cnt++];
				nameCallback.setName(userid);
			}
			else if(callbackArray[cnt] instanceof PasswordCallback)
			{
				passwordCallback = (PasswordCallback) callbackArray[cnt++];
				passwordCallback.setPassword(password.toCharArray());
			}
		}

       // for (Callback callback : callbackArray) 
       // {
       //      if (callback instanceof NameCallback) 
       //      {
       //          NameCallback nameCallback = (NameCallback) callback;
       //          nameCallback.setName(userid);
       //      } 
       //      else if (callback instanceof PasswordCallback) 
       //      {
       //          PasswordCallback passwordCallback = (PasswordCallback) callback;
       //          passwordCallback.setPassword(password.toCharArray());
       //      }

       //  }

		// NameCallback nameCallback = (NameCallback) callbackArray[cnt++];
		// nameCallback.setName(userid);
		// PasswordCallback passwordCallback = (PasswordCallback) callbackArray[cnt++];
		// passwordCallback.setPassword(password.toCharArray());		
	}


}
