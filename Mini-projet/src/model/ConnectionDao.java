package model;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import DB.DBConnection;
public class ConnectionDao {
	public String ajouter(User user)
	{
		String varName= user.getName();
		String varPwd= user.getPassword();
		String varEmail = user.getEmail();
		String varAd= user.getAdresse();
		Connection con=null;
		Statement statement=null;
		try {
			con=DBConnection.createConnection();
			statement=con.createStatement();
			String req="INSERT INTO `client`(`Name`, `Password`, `Email`, `Adresse`) VALUES ('"+varName+"','"+varPwd+"','"+varEmail+"','"+varAd+"') ";
			//statement.executeUpdate(req);
			int i=statement.executeUpdate(req);
			if(i!=0) 
				return "success";
			
				
			
	
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return "error";
		
	}

	

}
