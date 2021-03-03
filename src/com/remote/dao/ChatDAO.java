package com.remote.dao;

import com.remote.model.*; 
import com.remote.util.DBConnection;

import java.util.*;
import java.io.BufferedReader; 
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

public class ChatDAO {
	public static void clientSide(String message) {
        try (Socket socket = new Socket("localhost",6666)){
            BufferedReader echo = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            PrintWriter str = new PrintWriter(socket.getOutputStream(),true);

            String echostring;
            String response;

                echostring=message;
                str.println(echostring);
                if(!echostring.equals("exit")){
                    response = echo.readLine();
                    System.out.println(response);
                }
        } catch (Exception e) {
            System.out.println("client error :"+e.getMessage());
        }
    }
	
	public static void saveMessage(String email,String username,String mes){
		int result=0;
		try{
			SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");  
			Date date = new Date();  
			System.out.println(formatter.format(date));
			Connection con = DBConnection.getConnection();
			String query = "insert into chat values(?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, username);
			ps.setString(3, mes);
			ps.setString(4, formatter.format(date));
			result = ps.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
	
	public static List<ChatModel> getAllMessages()
	{
		List<ChatModel> messages = new ArrayList<ChatModel>();
		try{
			Connection con= DBConnection.getConnection();
			String query = "select * from chat";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ChatModel model = new ChatModel();
				model.setEmail(rs.getString("email"));
				model.setUsername(rs.getString("username"));
				model.setMessage(rs.getString("message"));
				model.setTime(rs.getString("time"));
				messages.add(model);
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		return messages;
	}
}

