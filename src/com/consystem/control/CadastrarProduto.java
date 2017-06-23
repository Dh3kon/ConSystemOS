package com.consystem.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.consystem.dao.ProdutoDao;
import com.consystem.model.Produto;

@WebServlet("/cadProduto")
public class CadastrarProduto extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String descricao = request.getParameter("descricao");
		String marca = request.getParameter("marca");
		String fornecedor = request.getParameter("fornecedor");
		String tipo = request.getParameter("tipo");
		String numeroSerie = request.getParameter("numSerie");

		Produto prod = new Produto();
		prod.setDescricao(descricao);
		prod.setMarca(marca);
		prod.setFornecedor(fornecedor);
		prod.setTipo(tipo);
		prod.setNumeroSerie(numeroSerie);

		ProdutoDao dao = new ProdutoDao();
		dao.add(prod);

		response.sendRedirect("success.html");
	}
}
