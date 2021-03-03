package com.remote.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.remote.model.RequestModel;
import com.remote.util.DBConnection;

public class RequestDAO {
	public static List<RequestModel> getAllRequest()
	{
		List<RequestModel> students = new ArrayList<RequestModel>();
		try{
			Connection con= DBConnection.getConnection();
			String query = "select * from requesttable where status = 0";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				RequestModel user = new RequestModel();
				user.setName(rs.getString("name"));
				user.setRegno(rs.getString("regno"));
				user.setDepartment(rs.getString("department"));
				user.setPurpose(rs.getString("purpose"));
				user.setFromdate(rs.getString("fromDate"));
				user.setTodate(rs.getString("toDate"));
				user.setReason(rs.getString("reason"));
				students.add(user);
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		return students;
	}
	
	public static void makestatusDone(String regno)
	{
		int result=0;
		try{
			Connection con = DBConnection.getConnection();
			String query = "UPDATE `requesttable` SET `status`= 1 WHERE regno = ?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, regno);
			result = pst.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
}
