package model.BO;

import java.util.ArrayList;

import model.Bean.Account;
import model.DAO.CheckLogin_DAO;



public class CheckLogin_BO {
	CheckLogin_DAO checkLogin_DAO = new CheckLogin_DAO();
	public boolean isValidUser(String username, String password) {
		return checkLogin_DAO.isValidUser(username, password);
	}
	public Account getAccount(String username){
		return checkLogin_DAO.getAccount(username);
	}
	public void AddAccount(String username, String password,String gmail){
		checkLogin_DAO.AddAccount(username,password,gmail);
	}
	public ArrayList<Account> getAllAccount(){
		return checkLogin_DAO.getAllAccount();
	}
	public boolean isExistUser(String username) {
		return checkLogin_DAO.isExistUser(username);
	}
}
