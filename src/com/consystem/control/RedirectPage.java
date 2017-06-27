package com.consystem.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/redirect")
public class RedirectPage extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		String next = null;
		
		if("usr".equals(action)) {
			next = "WEB-INF/jsp/cadusuarios.jsp";
		} else if ("prod".equals(action)) {
			next = "WEB-INF/jsp/cadprodutos.jsp";
		} else if ("vel".equals(action)) {
			next = "WEB-INF/jsp/cadveiculos.jsp";
		} else if ("tec".equals(action)) {
			next = "WEB-INF/jsp/cadtecnicos.jsp";
		} else if ("eqpto".equals(action)) {
			next = "WEB-INF/jsp/cadequipamento.jsp";
		} else if ("serv".equals(action)) {
			next = "WEB-INF/jsp/cadservico.jsp";
		} else if ("estq".equals(action)){
			next = "WEB-INF/jsp/cadestoque.jsp";
		} else if ("forn".equals(action)) {
			next = "WEB-INF/jsp/cadfornecedor.jsp";
		} else if ("orsv".equals(action)) {
			next = "WEB-INF/jsp/cados.jsp";
		}
		
		request.getRequestDispatcher(next).forward(request, response);
	}
}
