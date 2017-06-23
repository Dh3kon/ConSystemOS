package com.consystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.consystem.jdbc.ConnectionFactory;
import com.consystem.model.Estoque;

public class EstoqueDao {

	private Connection con;

	public EstoqueDao() {
		try {
			this.con = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void add(Estoque est) {
		try {
			PreparedStatement stmt = con.prepareStatement("insert into estoque (produto, quantidade) values (?,?)");
			stmt.setString(1, est.getProduto());
			stmt.setString(2, est.getQuantidade());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Estoque> getListarEstoque() {
		List<Estoque> lista = new ArrayList<>();
		try {
			PreparedStatement stmt = con.prepareStatement("select * from estoque");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Estoque est = new Estoque();
				est.setIdEstoque(rs.getInt(1));
				est.setProduto(rs.getString(2));
				est.setQuantidade(rs.getString(3));
				lista.add(est);
			}
			rs.close();
			stmt.close();
			return lista;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void editar(Estoque est) {
		try {
			PreparedStatement stmt = con
					.prepareStatement("update estoque set produto = ?, quantidade = ? where idEstoque = ?");
			stmt.setString(1, est.getProduto());
			stmt.setString(2, est.getQuantidade());
			stmt.setInt(3, est.getIdEstoque());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Estoque buscaId(int idEstoque) {
		Estoque est = null;
		try {
			PreparedStatement stmt = con.prepareStatement("select * from estoque where idEstoque = ?");
			stmt.setInt(1, idEstoque);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				est = new Estoque();
				est.setIdEstoque(rs.getInt(1));
				est.setProduto(rs.getString(2));
				est.setQuantidade(rs.getString(3));
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return est;
	}

	public void delete(int idEstoque) {
		try {
			PreparedStatement stmt = con.prepareStatement("delete from estoque where idEstoque = ?");
			stmt.setInt(1, idEstoque);
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
