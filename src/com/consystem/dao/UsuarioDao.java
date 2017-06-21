package com.consystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.consystem.jdbc.ConnectionFactory;
import com.consystem.model.Usuario;

public class UsuarioDao {

	private Connection con;

	public UsuarioDao() {
		try {
			this.con = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void add(Usuario user) {
		try {
			PreparedStatement stmt = con
					.prepareStatement("insert into usuario (login, senha, idTecnico, tipo) values (?,?,?,?)");
			stmt.setString(1, user.getLogin());
			stmt.setString(2, user.getSenha());
			stmt.setInt(3, user.getIdTecnico());
			stmt.setString(4, user.getTipo());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Usuario> listarUsuarios() {
		List<Usuario> lista = new ArrayList<>();
		try {
			PreparedStatement stmt = con.prepareStatement("select * from usuario");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Usuario user = new Usuario();
				user.setIdUsuario(rs.getInt("idUsuario"));
				user.setLogin(rs.getString("login"));
				user.setSenha(rs.getString("senha"));
				user.setIdTecnico(rs.getInt("idTecnico"));
				user.setTipo(rs.getString("tipo"));
				lista.add(user);
			}
			rs.close();
			stmt.close();
			return lista;
		} catch (SQLException e) {
			throw new RuntimeException();
		}

	}

	public void editar(Usuario user) {
		try {
			PreparedStatement stmt = con.prepareStatement(
					"update usuario set login = ?, senha = ?, idTecnico = ?, tipo = ? where idUsuario = ?");
			stmt.setString(1, user.getLogin());
			stmt.setString(2, user.getSenha());
			stmt.setInt(3, user.getIdTecnico());
			stmt.setString(4, user.getTipo());
			stmt.setInt(5, user.getIdUsuario());
			stmt.executeUpdate();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Usuario buscaId(int idUsuario) {
		Usuario user = null;
		try {
			PreparedStatement stmt = con.prepareStatement("select * from usuario where idUsuario = ?");
			stmt.setInt(1, idUsuario);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				user = new Usuario();
				user.setIdUsuario(rs.getInt("idUsuario"));
				user.setLogin(rs.getString("login"));
				user.setSenha(rs.getString("senha"));
				user.setIdTecnico(rs.getInt("idTecnico"));
				user.setTipo(rs.getString("tipo"));
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return user;

	}

	public void delete(int idUsuario) {
		try {
			PreparedStatement stmt = con.prepareStatement("delete from usuario where idUsuario = ?");
			stmt.setInt(1, idUsuario);
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Usuario efetuaLogin(String login) {
		Usuario user = null;

		try {
			PreparedStatement stmt = con.prepareStatement("select login, senha, tipo from usuario where login = ?");
			stmt.setString(1, login);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				user = new Usuario();
				user.setLogin(rs.getString("login"));
				user.setSenha(rs.getString("senha"));
				user.setTipo(rs.getString("tipo"));
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return user;
	}
}
