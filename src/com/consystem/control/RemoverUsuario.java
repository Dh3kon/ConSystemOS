package com.consystem.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.consystem.dao.UsuarioDao;
import com.consystem.model.Usuario;

@WebServlet("/removeUsuario")
public class RemoverUsuario extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("idUsuario");
		int idUsuario = Integer.parseInt(id);
		
		Usuario user = new Usuario();
		user.setIdUsuario(idUsuario);
		
		UsuarioDao dao = new UsuarioDao();
		dao.delete(idUsuario);
		
		response.sendRedirect("listausuario.jsp");
	}
}

