package com.consystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
		List<Cliente> lista = new ArrayList<Cliente>();
		try {
			PreparedStatement stmt = con.prepareStatement("select * from cliente");
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				Cliente cli = new Cliente();
				cli.setIdCliente(rs.getInt("idCliente"));
				cli.setNome(rs.getString("nome"));
				cli.setRg(rs.getString("rg"));
				cli.setCpf(rs.getString("cpf"));
				cli.setEndereco(rs.getString("endereco"));
				cli.setBairro(rs.getString("bairro"));
				cli.setCidade(rs.getString("cidade"));
				cli.setEstado(rs.getString("estado"));
				cli.setTel_fixo(rs.getString("tel_fixo"));
				cli.setTel_cel(rs.getString("tel_cel"));
				cli.setSexo(rs.getString("sexo"));
				lista.add(cli);
			}
			rs.close();
			stmt.close();
			return lista;
		} catch (SQLException e) {
			throw new RuntimeException(); 
		}
	}
}
