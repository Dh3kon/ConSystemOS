package com.consystem.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.consystem.dao.UsuarioDao;
import com.consystem.model.Usuario;

@WebServlet("/cadUsuario")
public class CadastrarUsuario extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		String idTecnico = request.getParameter("idTecnico");
		String tipo = request.getParameter("tipo");

		Usuario user = new Usuario();
		user.setLogin(login);
		user.setSenha(senha);
		user.setTecnico(idTecnico);
		user.setTipo(tipo);

		UsuarioDao dao = new UsuarioDao();
		dao.add(user);

		response.sendRedirect("success.html");
	}
}
