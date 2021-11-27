package model.Bean;

public class Account {
private String username;
private String password;
private String gmail;
private int rank;

public Account() {}

public Account(String username, String password, String gmail, int rank) {
	super();
	this.username = username;
	this.password = password;
	this.gmail = gmail;
	this.rank=rank;
}

public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getGmail() {
	return gmail;
}
public void setGmail(String gmail) {
	this.gmail = gmail;
}

public int getRank() {
	return rank;
}
public void setRank(int rank) {
	this.rank = rank;
}

@Override
public String toString() {
	return "Account [username=" + username + ", password=" + password + ", gmail=" + gmail +", rank= "+rank+ "]";
}


}
