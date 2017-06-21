package com.consystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.consystem.jdbc.ConnectionFactory;
import com.consystem.model.Servico;

public class ServicoDao {

	private Connection con;

	public ServicoDao() {
		try {
			this.con = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void add(Servico serv) {
		try {
			PreparedStatement stmt = con
					.prepareStatement("insert into servico (descricao, idTecnico, pontuacao) values (?,?,?)");
			stmt.setString(1, serv.getDescricao());
			stmt.setInt(2, serv.getIdTecnico());
			stmt.setInt(3, serv.getPontuacao());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Servico> listarServico() {
		List<Servico> lista = new ArrayList<>();
		try {
			PreparedStatement stmt = con.prepareStatement("select * from servico");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Servico serv = new Servico();
				serv.setIdServico(rs.getInt(1));
				serv.setDescricao(rs.getString(2));
				serv.setIdTecnico(rs.getInt(3));
				serv.setPontuacao(rs.getInt(4));
				lista.add(serv);
			}
			rs.close();
			stmt.close();
			return lista;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void editar(Servico serv) {
		try {
			PreparedStatement stmt = con.prepareStatement(
					"update servico set descricao = ?, idTecnico = ?, pontuacao = ? where idServico = ?");
			stmt.setString(1, serv.getDescricao());
			stmt.setInt(2, serv.getIdTecnico());
			stmt.setInt(3, serv.getPontuacao());
			stmt.setInt(4, serv.getIdServico());
			stmt.executeUpdate();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Servico buscaId(int idServico) {
		Servico serv = null;
		try {
			PreparedStatement stmt = con.prepareStatement("select * from servico where idServico = ?");
			stmt.setInt(1, idServico);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				serv = new Servico();
				serv.setIdServico(rs.getInt(1));
				serv.setDescricao(rs.getString(2));
				serv.setIdTecnico(rs.getInt(3));
				serv.setPontuacao(rs.getInt(4));
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return serv;
	}

	public void delete(int idServico) {
		try {
			PreparedStatement stmt = con.prepareStatement("delete from servico where idServico = ?");
			stmt.setInt(1, idServico);
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
