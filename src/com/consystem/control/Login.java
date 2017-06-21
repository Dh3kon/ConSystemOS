package com.consystem.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.consystem.model.Usuario;

@WebServlet("/login")
public class Login extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Control control;

	@Override
	public void init() throws ServletException {
		super.init();
		control = new Control();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Usuario user = new Usuario();

		user.setLogin(request.getParameter("login"));
		user.setSenha(request.getParameter("senha"));
		user.getTipo();

		user = control.validar(user);

		if (user != null && user.getTipo().equals("ADM")) {
			request.getSession().setAttribute("user", user);
			response.sendRedirect("home.html");
		} else if (user != null && user.getTipo().equals("TEC")) {
			response.sendRedirect("home.html");
		} else {
			response.sendRedirect("index.html");
		}
	}
}
