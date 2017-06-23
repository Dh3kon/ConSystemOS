package com.consystem.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.consystem.jdbc.ConnectionFactory;
import com.consystem.model.Cliente;

public class ClienteDao {

	private Connection con;
	
	public ClienteDao() {
		try {
			this.con = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<Cliente> getLista(){
		return null;
	}
}
