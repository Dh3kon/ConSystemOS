package com.consystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.consystem.jdbc.ConnectionFactory;
import com.consystem.model.Produto;

public class ProdutoDao {

	private Connection con;

	public ProdutoDao() {
		try {
			this.con = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void add(Produto prod) {
		try {
			PreparedStatement stmt = con.prepareStatement(
					"insert into produto (descricao, marca, idFornecedor, tipo, numero_serie) values " + "(?,?,?,?,?)");
			stmt.setString(1, prod.getDescricao());
			stmt.setString(2, prod.getMarca());
			stmt.setInt(3, prod.getIdFornecedor());
			stmt.setString(4, prod.getTipo());
			stmt.setString(5, prod.getNumeroSerie());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Produto> listarProduto() {
		List<Produto> lista = new ArrayList<>();
		try {
			PreparedStatement stmt = con.prepareStatement("select * from produto");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Produto prod = new Produto();
				prod.setIdProduto(rs.getInt(1));
				prod.setDescricao(rs.getString(2));
				prod.setMarca(rs.getString(3));
				prod.setIdFornecedor(rs.getInt(4));
				prod.setTipo(rs.getString(5));
				prod.setNumeroSerie(rs.getString(6));
				lista.add(prod);
			}

			rs.close();
			stmt.close();
			return lista;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void editar(Produto prod) {
		try {
			PreparedStatement stmt = con.prepareStatement(
					"update produto set descricao = ?, marca = ?, idFornecedor = ?, tipo = ?, numero_serie = ? "
							+ "where idProduto = ?");
			stmt.setString(1, prod.getDescricao());
			stmt.setString(2, prod.getMarca());
			stmt.setInt(3, prod.getIdFornecedor());
			stmt.setString(4, prod.getTipo());
			stmt.setString(5, prod.getNumeroSerie());
			stmt.setInt(6, prod.getIdProduto());
			stmt.executeUpdate();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Produto buscaId(int idProduto) {
		Produto prod = null;
		try {
			PreparedStatement stmt = con.prepareStatement("select * from produto where idProduto = ?");
			stmt.setInt(1, idProduto);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				prod = new Produto();
				prod.setIdProduto(rs.getInt("idProduto"));
				prod.setDescricao(rs.getString("descricao"));
				prod.setMarca(rs.getString("marca"));
				prod.setIdFornecedor(rs.getInt("idFornecedor"));
				prod.setTipo(rs.getString("tipo"));
				prod.setNumeroSerie(rs.getString("numero_serie"));
			}

			rs.close();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return prod;
	}

	public void delete(int idProduto) {
		try {
			PreparedStatement stmt = con.prepareStatement("delete from produto where idProduto = ?");
			stmt.setInt(1, idProduto);
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
