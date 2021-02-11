<%@page import="com.remote.util.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
		String contentType = request.getContentType();
		if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) 
		{
			DataInputStream in = new DataInputStream(request.getInputStream());
			int formDataLength = request.getContentLength();
			System.out.println(formDataLength);
			byte dataBytes[] = new byte[formDataLength];
			int byteRead = 0;
			int totalBytesRead = 0;
			
			while (totalBytesRead < formDataLength) 
			{
				byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
				totalBytesRead += byteRead;
			}
			
			String file = new String(dataBytes);
			String saveFile = file.substring(file.indexOf("filename=\"") + 10);
			System.out.println("saveFile=" + saveFile);
			saveFile = saveFile.substring(saveFile.lastIndexOf("\\")+ 1,saveFile.indexOf("\""));
			System.out.println("saveFile" + saveFile);
			saveFile = file.substring(file.indexOf("filename=\"") + 10);
			saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
			saveFile = saveFile.substring(saveFile.lastIndexOf("\\")+ 1,saveFile.indexOf("\""));
			int lastIndex = contentType.lastIndexOf("=");
			String boundary = contentType.substring(lastIndex + 1,contentType.length());
			int pos;
			
			pos = file.indexOf("filename=\"");
			pos = file.indexOf("\n", pos) + 1;
			pos = file.indexOf("\n", pos) + 1;
			pos = file.indexOf("\n", pos) + 1;
			int boundaryLocation = file.indexOf(boundary, pos) - 4;
			int startPos = ((file.substring(0, pos)).getBytes()).length;
			int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
			
			FileOutputStream fileOut = new FileOutputStream(saveFile);
			fileOut.write(dataBytes, startPos, (endPos - startPos));
			
			%>
			<b>File <% out.println(saveFile); %> has been uploaded and inserted into Database.</b>
			
			<% Connection con=DBConnection.getConnection();
			Statement pst=null;
			String line = null;
			String value=null;
			try{
				StringBuilder contents = new StringBuilder();
				BufferedReader input = new BufferedReader(new FileReader(saveFile));
				while (( line = input.readLine()) != null)
				{
					String[] a = line.split(",");
					for(int i=0;i<a.length;i++)
					{
						System.out.println(a[i]);
					}
					PreparedStatement ps = con.prepareStatement("insert into dashboard(`Mailid`, `Name`, `week1`, `week2`, `week3`, `week4`, `avg`, `rank`) values(?,?,?,?,?,?,?,?)");
					ps.setString(1,a[0]);
					ps.setString(2,a[1]);
					ps.setInt(3,Integer.parseInt(a[2]));
					ps.setInt(4,Integer.parseInt(a[3]));
					ps.setInt(5,Integer.parseInt(a[4]));
					ps.setInt(6,Integer.parseInt(a[5]));
					ps.setInt(7,Integer.parseInt(a[6]));
					ps.setInt(8,Integer.parseInt(a[7]));
					int data = ps.executeUpdate();
					System.out.println("----------------->"+data);
					System.out.println(line);
				}
			}
			catch(Exception e)
			{
				System.out.println(e.getMessage());		
			}
		}
		%>
</html>