package com.consystem.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.consystem.dao.ProdutoDao;
import com.consystem.model.Produto;

@WebServlet("/editarProduto")
public class EditarProduto extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String idProduto = request.getParameter("idProduto");
		String descricao = request.getParameter("descricao");
		String marca = request.getParameter("marca");
		String idFornecedor = request.getParameter("fornecedor");
		String tipo = request.getParameter("tipo");
		String numSerie = request.getParameter("numSerie");

		Produto prod = new Produto();
		prod.setIdProduto(Integer.parseInt(idProduto));
		prod.setDescricao(descricao);
		prod.setMarca(marca);
		prod.setFornecedor(idFornecedor);
		prod.setTipo(tipo);
		prod.setNumeroSerie(numSerie);

		ProdutoDao dao = new ProdutoDao();
		dao.editar(prod);

		response.sendRedirect("listaproduto.jsp");

	}
}
