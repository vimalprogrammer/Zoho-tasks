package com;

import com.google.zxing.WriterException;

import de.taimos.totp.*;
import java.security.SecureRandom;
import org.apache.commons.codec.binary.*;

import java.io.IOException;
import java.util.Scanner;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
import javax.servlet.RequestDispatcher; 
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;


import java.net.URLEncoder;

 import static com.Utils.getTOTPCode;

@WebServlet("/qr")
public class MainApplication extends HttpServlet{

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        String secretKey = "QDWSM3OYBPGTEVSPB5FKVDM3CSNCWHVK";
        String email = "vimal";
        String companyName = "Awesome Company";
        String barCodeUrl = Utils.getGoogleAuthenticatorBarCode(secretKey, email, companyName);
        System.out.println(barCodeUrl);
        try
        {
        Utils.createQRCode(barCodeUrl, "QRCode.png", 400, 400);

        String code = getTOTPCode(secretKey);

        HttpSession session = request.getSession();

        session.setAttribute("code",code);

        //String otp_code=String.valueOf(session.getAttribute("code"));

        response.sendRedirect(request.getContextPath() + "/QR_pic.jsp");
    }
    catch(Exception e)
    {
        System.out.print("Exception is "+e);
    }

    }

}
