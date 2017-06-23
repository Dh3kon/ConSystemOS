package com.consystem.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.consystem.dao.EstoqueDao;
import com.consystem.model.Estoque;

@WebServlet("/cadEstoque")
public class CadastrarEstoque extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String produto = request.getParameter("produto");
		String quantidade = request.getParameter("quantidade");

		Estoque est = new Estoque();
		est.setProduto(produto);
		est.setQuantidade(quantidade);

		EstoqueDao dao = new EstoqueDao();
		dao.add(est);

		response.sendRedirect("success.html");
	}
}
