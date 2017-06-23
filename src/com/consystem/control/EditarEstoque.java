package com.consystem.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.consystem.dao.EstoqueDao;
import com.consystem.model.Estoque;

@WebServlet("/editaEstoque")
public class EditarEstoque extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String idEstoque = request.getParameter("idEstoque");
		String produto = request.getParameter("produto");
		String quantidade = request.getParameter("quantidade");

		Estoque est = new Estoque();
		est.setIdEstoque(Integer.parseInt(idEstoque));
		est.setProduto(produto);
		est.setQuantidade(quantidade);

		EstoqueDao dao = new EstoqueDao();
		dao.editar(est);

		response.sendRedirect("listaestoque.jsp");
	}
}
