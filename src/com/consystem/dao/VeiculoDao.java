package com.consystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.consystem.jdbc.ConnectionFactory;
import com.consystem.model.Veiculo;

public class VeiculoDao {

	private Connection con;

	public VeiculoDao() {
		try {
			this.con = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void add(Veiculo vel) {
		try {
			PreparedStatement stmt = con
					.prepareStatement("insert into veiculo (modelo, marca, placa, ano, status) values (?,?,?,?,?)");
			stmt.setString(1, vel.getModelo());
			stmt.setString(2, vel.getMarca());
			stmt.setString(3, vel.getPlaca());
			stmt.setString(4, vel.getAno());
			stmt.setString(5, vel.getStatus());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Veiculo> getListarVeiculo() {
		List<Veiculo> lista = new ArrayList<>();
		try {
			PreparedStatement stmt = con.prepareStatement("select * from veiculo");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Veiculo vel = new Veiculo();
				vel.setIdVeiculo(rs.getInt("idVeiculo"));
				vel.setModelo(rs.getString("modelo"));
				vel.setMarca(rs.getString("marca"));
				vel.setPlaca(rs.getString("placa"));
				vel.setAno(rs.getString("ano"));
				vel.setStatus(rs.getString("status"));
				lista.add(vel);
			}

			rs.close();
			stmt.close();
			return lista;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void editar(Veiculo vel) {
		try {
			PreparedStatement stmt = con.prepareStatement(
					"update veiculo set modelo = ?, marca = ?, placa = ?, ano = ?, status = ? where idVeiculo = ?");
			stmt.setString(1, vel.getModelo());
			stmt.setString(2, vel.getMarca());
			stmt.setString(3, vel.getPlaca());
			stmt.setString(4, vel.getAno());
			stmt.setString(5, vel.getStatus());
			stmt.setInt(6, vel.getIdVeiculo());
			stmt.executeUpdate();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Veiculo buscaId(int idVeiculo) {
		Veiculo vel = null;
		try {
			PreparedStatement stmt = con.prepareStatement("select * from veiculo where idVeiculo = ?");
			stmt.setInt(1, idVeiculo);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				vel = new Veiculo();
				vel.setIdVeiculo(rs.getInt("idVeiculo"));
				vel.setModelo(rs.getString("modelo"));
				vel.setMarca(rs.getString("marca"));
				vel.setPlaca(rs.getString("placa"));
				vel.setAno(rs.getString("ano"));
				vel.setStatus(rs.getString("status"));
			}

			rs.close();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return vel;
	}

	public void delete(int idVeiculo) {
		try {
			PreparedStatement stmt = con.prepareStatement("delete from veiculo where idVeiculo = ?");
			stmt.setInt(1, idVeiculo);
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
