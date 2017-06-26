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
import com.consystem.model.OrdemServico;

public class OrdemServicoDao {

	private Connection con;

	public OrdemServicoDao() {
		try {
			this.con = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void add(OrdemServico os) {
		try {
			PreparedStatement stmt = con.prepareStatement(
					"insert into ordem_servico (descricao, status_os, observacao, tecnico, veiculo, cliente) values (?,?,?,?,?,?)");
			stmt.setString(1, os.getDescricao());
			stmt.setString(2, os.getStatus());
			stmt.setString(3, os.getObservacao());
			stmt.setString(4, os.getTecnico());
			stmt.setString(5, os.getVeiculo());
			stmt.setString(6, os.getCliente());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<OrdemServico> getLista() {
		List<OrdemServico> lista = new ArrayList<>();
		try {
			PreparedStatement stmt = con.prepareStatement("select * from ordem_servico");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				OrdemServico os = new OrdemServico();
				os.setOs(rs.getInt("os"));
				
				Calendar date1 = Calendar.getInstance();
				date1.setTime(rs.getDate("data_os"));
				os.setDataOs(date1);
				
				os.setDescricao(rs.getString("descricao"));
				os.setStatus(rs.getString("status_os"));
				
				Calendar date2 = Calendar.getInstance();
				date2.setTime(rs.getDate("dataFinalizacao"));
				os.setDataFinalizacao(date2);
				
				os.setObservacao(rs.getString("observacao"));
				os.setTecnico(rs.getString("tecnico"));
				os.setVeiculo(rs.getString("veiculo"));
				os.setCliente(rs.getString("cliente"));
				lista.add(os);

			}
			rs.close();
			stmt.close();
			return lista;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void editar(OrdemServico os) {
		try {
			PreparedStatement stmt = con.prepareStatement(
					"update ordem_servico set descricao = ?, status_os = ?, dataFinalizacao = ?, observacao = ?, "
							+ "tecnico = ?, veiculo = ?, cliente = ? where os = ?");// *****melhorar
																							// chamada
																							// sql*****
			stmt.setString(1, os.getDescricao());
			stmt.setString(2, os.getStatus());
			stmt.setDate(3, new Date(os.getDataFinalizacao().getTimeInMillis()));
			stmt.setString(4, os.getObservacao());
			stmt.setString(5, os.getTecnico());
			stmt.setString(6, os.getVeiculo());
			stmt.setString(7, os.getCliente());
			stmt.setInt(7, os.getOs());
			stmt.executeUpdate();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public OrdemServico buscaId(int os) {
		OrdemServico ord = null;
		try {
			PreparedStatement stmt = con.prepareStatement("select os, descricao, status_os, dataFinalizacao, observacao, tecnico, veiculo, cliente from ordem_servico where os = ?");
			stmt.setInt(1, os);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				ord = new OrdemServico();
				ord.setOs(rs.getInt("os"));
				ord.setDescricao(rs.getString("descricao"));
				ord.setStatus(rs.getString("status_os"));
				Calendar cal = Calendar.getInstance();
				cal.setTime(rs.getDate("dataFinalizacao"));
				ord.setDataFinalizacao(cal);
				ord.setObservacao(rs.getString("observacao"));
				ord.setTecnico(rs.getString("tecnico"));
				ord.setVeiculo(rs.getString("veiculo"));
				ord.setCliente(rs.getString("cliente"));
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return ord;
	}

	public void delete(int os) {
		try {
			PreparedStatement stmt = con.prepareStatement("delete from ordem_servico where os = ?");
			stmt.setInt(1, os);
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
