package com.consystem.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.consystem.dao.EstoqueDao;
import com.consystem.model.Estoque;

@WebServlet("/removeEstoque")
public class RemoverEstoque extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("idEstoque");
		int idEstoque = Integer.parseInt(id);

		Estoque est = new Estoque();
		est.setIdEstoque(idEstoque);

		EstoqueDao dao = new EstoqueDao();
		dao.delete(idEstoque);

		response.sendRedirect("listaestoque.jsp");
	}
}
