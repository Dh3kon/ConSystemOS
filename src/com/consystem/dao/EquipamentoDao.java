package com.consystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.consystem.jdbc.ConnectionFactory;
import com.consystem.model.Equipamento;


public class EquipamentoDao {

	private Connection con;

	public EquipamentoDao() {
		try {
			this.con = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void add(Equipamento equip) {
		try {
			PreparedStatement stmt = con.prepareStatement(
					"insert into equipamento (descricao, marca, fornecedor, tipo, numero_serie) values (?,?,?,?,?)");
			stmt.setString(1, equip.getDescricao());
			stmt.setString(2, equip.getMarca());
			stmt.setString(3, equip.getFornecedor());
			stmt.setString(4, equip.getTipo());
			stmt.setString(5, equip.getNumSerie());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Equipamento> listarEquipamantos() {
		List<Equipamento> lista = new ArrayList<>();
		try {
			PreparedStatement stmt = con.prepareStatement("select * from equipamento");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Equipamento equip = new Equipamento();
				equip.setIdEquipamento(rs.getInt("idEquip"));
				equip.setDescricao(rs.getString("descricao"));
				equip.setMarca(rs.getString("marca"));
				equip.setFornecedor(rs.getString("fornecedor"));
				equip.setTipo(rs.getString("tipo"));
				equip.setNumSerie(rs.getString("numero_serie"));
				lista.add(equip);
			}
			rs.close();
			stmt.close();
			return lista;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void editar(Equipamento equip) {
		try {
			PreparedStatement stmt = con.prepareStatement(
					"update equipamento set descricao = ?, marca = ?, fornecedor = ?, tipo = ?, numero_serie = ? "
							+ "where idEquip = ?");
			stmt.setString(1, equip.getDescricao());
			stmt.setString(2, equip.getMarca());
			stmt.setString(3, equip.getFornecedor());
			stmt.setString(4, equip.getTipo());
			stmt.setString(5, equip.getNumSerie());
			stmt.setInt(6, equip.getIdEquipamento());
			stmt.executeUpdate();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Equipamento buscaId(int idEquip) {
		Equipamento equip = null;
		try {
			PreparedStatement stmt = con.prepareStatement("select * from equipamento where idEquip = ?");
			stmt.setInt(1, idEquip);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				equip = new Equipamento();
				equip.setIdEquipamento(rs.getInt("idEquip"));
				equip.setDescricao(rs.getString("descricao"));
				equip.setMarca(rs.getString("marca"));
				equip.setFornecedor(rs.getString("fornecedor"));
				equip.setTipo(rs.getString("tipo"));
				equip.setNumSerie(rs.getString("numero_serie"));
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return equip;
	}

	public void delete(int idEquip) {
		try {
			PreparedStatement stmt = con.prepareStatement("delete from equipamento where idEquip = ?");
			stmt.setInt(1, idEquip);
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
}
