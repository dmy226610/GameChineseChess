package model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Bean.Account;



public class CheckLogin_DAO {
	public boolean isValidUser(String username, String password) {
		try{
			Connection conn=null;
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/gamecc","root","");
			String sql ="select *from account where username=? and password=?";
			PreparedStatement statement = conn.prepareStatement(sql);
		    statement.setString(1,username);
		    statement.setString(2, password);
		    ResultSet result=statement.executeQuery();
		    if(result.next()){
		    	return true;}
		}catch(Exception e){}
		  
		
	    	return false;
	    
	}
	public boolean isExistUser(String username) {
		try{
			Connection conn=null;
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/gamecc","root","");
			String sql ="select *from account where username=? ";
			PreparedStatement statement = conn.prepareStatement(sql);
		    statement.setString(1,username);
		    ResultSet result=statement.executeQuery();
		    if(result.next()){
		    	return true;}
		}catch(Exception e){
			System.out.println("Loi r");
		}
	    	return false;
	    
	}
public Account getAccount(String Username) {
		
		try{
			Connection conn=null;
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/gamecc","root","");
			String sql ="select *from account where username=?";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1,Username );
		    ResultSet result=statement.executeQuery();
		    if(result.next()) {
			   String username=result.getString(1);
			   String password=result.getString(2);
			   String gmail=result.getString(3);
			   
			   Account ac = new Account();
			  ac.setUsername(username);
			  ac.setPassword(password);
			  ac.setGmail(gmail);
			  ac.setRank(0);
			   return ac;
		    }
		   
		}catch(Exception e){
			System.out.println("LOI");
		}
		
	    	return null;
	}
public void AddAccount(String user,String pass,String gmail ) {
	
	try{
		Connection conn=null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/gamecc","root","");
		String sql ="INSERT INTO account(username, password, gmail,rank)"+"VALUES(?,?,?,?)";
		PreparedStatement statement = conn.prepareStatement(sql);
		 statement.setString(1, user);
		 statement.setString(2,pass);
		 statement.setString(3, gmail);
		 statement.setInt(4, 0);
		 statement.execute();
	}catch(Exception e){
		System.out.println("Loi r");
	}
	
}
public ArrayList<Account> getAllAccount() {
	ArrayList<Account> AccountList= new ArrayList<Account>();
	try{
		Connection conn=null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/gamecc","root","");
		String sql ="select *from account";
		PreparedStatement statement = conn.prepareStatement(sql);
	    ResultSet result=statement.executeQuery();
	   while(result.next()) {
		   String username=result.getString("username");
		   String password=result.getString("password");
		   String gmail=result.getString("gmail");
		   int rank=result.getInt("rank");
		   Account st = new Account();
		  st.setUsername(username);
		  st.setPassword(password);
		  st.setGmail(gmail);
		  st.setRank(rank);
		   AccountList.add(st);  
	   }
	   return AccountList;
	}catch(Exception e){}
	
    	return null;
}
}
