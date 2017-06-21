package com.consystem.control;

import java.sql.Connection;
import java.sql.SQLException;

import com.consystem.dao.UsuarioDao;
import com.consystem.jdbc.ConnectionFactory;
import com.consystem.model.Usuario;

public class Control {

	private Connection con;

	public Control() {
		try {
			this.con = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Usuario validar(Usuario user) {
		UsuarioDao dao = new UsuarioDao();
		Usuario novo = dao.efetuaLogin(user.getLogin());
		if (novo != null && user.getLogin().equals(novo.getLogin()) && user.getSenha().equals(novo.getSenha())) {
			return novo;
		}
		return null;
	}
}
