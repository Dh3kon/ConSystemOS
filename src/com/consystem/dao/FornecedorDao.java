package com.consystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.consystem.jdbc.ConnectionFactory;
import com.consystem.model.Fornecedor;

public class FornecedorDao {

	private Connection con;

	public FornecedorDao() {
		try {
			this.con = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void add(Fornecedor forn) {
		try {
			PreparedStatement stmt = con.prepareStatement(
					"insert into fornecedor (nome, cnpj, insc_est, endereco, cidade, estado, pais, telefone,"
							+ " email, site) values (?,?,?,?,?,?,?,?,?,?)");
			stmt.setString(1, forn.getNome());
			stmt.setString(2, forn.getCnpj());
			stmt.setString(3, forn.getInscEst());
			stmt.setString(4, forn.getEndereco());
			stmt.setString(5, forn.getCidade());
			stmt.setString(6, forn.getEstado());
			stmt.setString(7, forn.getPais());
			stmt.setString(8, forn.getTelefone());
			stmt.setString(9, forn.getEmail());
			stmt.setString(10, forn.getSite());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Fornecedor> listarFornecedores() {
		List<Fornecedor> lista = new ArrayList<>();
		try {
			PreparedStatement stmt = con.prepareStatement("select * from fornecedor");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Fornecedor forn = new Fornecedor();
				forn.setIdFornecedor(rs.getInt(1));
				forn.setNome(rs.getString(2));
				forn.setCnpj(rs.getString(3));
				forn.setInscEst(rs.getString(4));
				forn.setEndereco(rs.getString(5));
				forn.setCidade(rs.getString(6));
				forn.setEstado(rs.getString(7));
				forn.setPais(rs.getString(8));
				forn.setTelefone(rs.getString(9));
				forn.setEmail(rs.getString(10));
				forn.setSite(rs.getString(11));
				lista.add(forn);
			}
			rs.close();
			stmt.close();
			return lista;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void editar(Fornecedor forn) {
		try {
			PreparedStatement stmt = con.prepareStatement(
					"update fornecedor set nome = ?, cnpj = ?, insc_est = ?, endereco = ?, cidade = ?, estado = ?, pais = ?, "
							+ "telefone = ?, email = ?, site = ? where idFornecedor = ?");
			stmt.setString(1, forn.getNome());
			stmt.setString(2, forn.getCnpj());
			stmt.setString(3, forn.getInscEst());
			stmt.setString(4, forn.getEndereco());
			stmt.setString(5, forn.getCidade());
			stmt.setString(6, forn.getEstado());
			stmt.setString(7, forn.getPais());
			stmt.setString(8, forn.getTelefone());
			stmt.setString(9, forn.getEmail());
			stmt.setString(10, forn.getSite());
			stmt.setInt(11, forn.getIdFornecedor());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Fornecedor buscaId(int idFornecedor) {
		Fornecedor forn = null;
		try {
			PreparedStatement stmt = con.prepareStatement("select * from fornecedor where idFornecedor = ?");
			stmt.setInt(1, idFornecedor);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				forn = new Fornecedor();
				forn.setIdFornecedor(rs.getInt(1));
				forn.setNome(rs.getString(2));
				forn.setCnpj(rs.getString(3));
				forn.setInscEst(rs.getString(4));
				forn.setEndereco(rs.getString(5));
				forn.setCidade(rs.getString(6));
				forn.setEstado(rs.getString(7));
				forn.setPais(rs.getString(8));
				forn.setTelefone(rs.getString(9));
				forn.setEmail(rs.getString(10));
				forn.setSite(rs.getString(11));
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return forn;
	}

	public void delete(int idFornecedor) {
		try {
			PreparedStatement stmt = con.prepareStatement("delete from fornecedor where idFornecedor = ?");
			stmt.setInt(1, idFornecedor);
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
