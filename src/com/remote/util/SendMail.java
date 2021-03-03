package com.remote.util;


public class SendMail {
	static String line1 ="your request has been granted.";
	static String line0 =  "your request has been denied.";
	static String line2 ="thanks,";
	static String line3 ="admin@remote.com";
	
	static String suc =  line1 + "\r\n" + line2 + "\r\n" + line3;
	static String den = line0 + "\r\n" + line2 + "\r\n" + line3;
	public static void successMail(String regno) {    
	     Mailer.send("01prithivi@gmail.com","prithivivishal",regno+"@skct.edu.in","REQUEST ACCEPTED",suc);  
	 }
	
	public static void denyMail(String regno) {    
	     Mailer.send("01prithivi@gmail.com","prithivivishal",regno+"@skct.edu.in","REQUEST DENIED",den);  
	 }   
	
	 public static void sendOTP(String mail,String otp) {
	        Mailer.send("01prithivi@gmail.com","prithivivishal",mail,"REMOTE!","Hello!! your OTP is "+otp);
	    }
}
