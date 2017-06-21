package com.consystem.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.consystem.jdbc.ConnectionFactory;
import com.consystem.model.Tecnico;

public class TecnicoDao {

	private Connection con;

	public TecnicoDao() {
		try {
			this.con = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void add(Tecnico tec) {
		try {
			PreparedStatement stmt = con.prepareStatement(
					"insert into tecnico (nome, rg, cpf, tel_contato, endereco, bairro, cidade, estado,"
							+ " nacionalidade, dataNasc, dataAdmissao, funcao, observacao) values (?,?,?,?,?,?,?,?,?,?,?,?,?)");
			stmt.setString(1, tec.getNome());
			stmt.setString(2, tec.getRg());
			stmt.setString(3, tec.getCpf());
			stmt.setString(4, tec.getTelContato());
			stmt.setString(5, tec.getEndereco());
			stmt.setString(6, tec.getBairro());
			stmt.setString(7, tec.getCidade());
			stmt.setString(8, tec.getEstado());
			stmt.setString(9, tec.getNacionalidade());
			stmt.setDate(10, new Date(tec.getDataNasc().getTimeInMillis()));
			stmt.setDate(11, new Date(tec.getDataAdmissao().getTimeInMillis()));
			stmt.setString(12, tec.getFuncao());
			stmt.setString(13, tec.getObs());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Tecnico> getLista() {
		List<Tecnico> lista = new ArrayList<>();
		try {
			PreparedStatement stmt = con.prepareStatement("select * from tecnico");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Tecnico tec = new Tecnico();
				tec.setIdTecnico(rs.getInt("idTecnico"));
				tec.setNome(rs.getString("nome"));
				tec.setRg(rs.getString("rg"));
				tec.setCpf(rs.getString("cpf"));
				tec.setTelContato(rs.getString("tel_contato"));
				tec.setEndereco(rs.getString("endereco"));
				tec.setBairro(rs.getString("bairro"));
				tec.setCidade(rs.getString("cidade"));
				tec.setEstado(rs.getString("estado"));
				tec.setNacionalidade(rs.getString("nacionalidade"));
				Calendar data1 = Calendar.getInstance();
				data1.setTime(rs.getDate("dataNasc"));
				tec.setDataNasc(data1);
				Calendar data2 = Calendar.getInstance();
				data2.setTime(rs.getDate("dataAdmissao"));
				tec.setDataAdmissao(data2);
				tec.setFuncao(rs.getString("funcao"));
				tec.setObs(rs.getString("observacao"));
				lista.add(tec);
			}
			rs.close();
			stmt.close();
			return lista;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void editar(Tecnico tec) {
		try {
			PreparedStatement stmt = con.prepareStatement(
					"update tecnico set nome = ?, rg = ?, cpf = ?, tel_contato = ?, endereco = ?, bairro = ?,"
							+ "cidade = ?, estado = ?, nacionalidade = ?, dataNasc = ?, dataAdmissao = ?, funcao = ?, observacao = ? "
							+ "where idTecnico = ?");
			stmt.setString(1, tec.getNome());
			stmt.setString(2, tec.getRg());
			stmt.setString(3, tec.getCpf());
			stmt.setString(4, tec.getTelContato());
			stmt.setString(5, tec.getEndereco());
			stmt.setString(6, tec.getBairro());
			stmt.setString(7, tec.getCidade());
			stmt.setString(8, tec.getEstado());
			stmt.setString(9, tec.getNacionalidade());
			stmt.setDate(10, new Date(tec.getDataNasc().getTimeInMillis()));
			stmt.setDate(11, new Date(tec.getDataAdmissao().getTimeInMillis()));
			stmt.setString(12, tec.getFuncao());
			stmt.setString(13, tec.getObs());
			stmt.setInt(14, tec.getIdTecnico());
			stmt.executeUpdate();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Tecnico buscaId(int idTcenico) {
		Tecnico tec = null;
		try {
			PreparedStatement stmt = con.prepareStatement("select * from tecnico where idTecnico = ?");
			stmt.setInt(1, idTcenico);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				tec = new Tecnico();
				tec.setIdTecnico(rs.getInt("idTecnico"));
				tec.setNome(rs.getString("nome"));
				tec.setRg(rs.getString("rg"));
				tec.setCpf(rs.getString("cpf"));
				tec.setTelContato(rs.getString("tel_contato"));
				tec.setEndereco(rs.getString("endereco"));
				tec.setBairro(rs.getString("bairro"));
				tec.setCidade(rs.getString("cidade"));
				tec.setEstado(rs.getString("estado"));
				tec.setNacionalidade(rs.getString("nacionalidade"));
				Calendar data1 = Calendar.getInstance();
				data1.setTime(rs.getDate("dataNasc"));
				tec.setDataNasc(data1);
				Calendar data2 = Calendar.getInstance();
				data2.setTime(rs.getDate("dataAdmissao"));
				tec.setDataAdmissao(data2);
				tec.setFuncao(rs.getString("funcao"));
				tec.setObs(rs.getString("observacao"));
			}

			rs.close();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return tec;
	}

	public void delete(int idTecnico) {
		try {
			PreparedStatement stmt = con.prepareStatement("delete from tecnico where idTecnico = ?");
			stmt.setInt(1, idTecnico);
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
