package com.consystem.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.consystem.dao.FornecedorDao;
import com.consystem.model.Fornecedor;

@WebServlet("/removeFornecedor")
public class RemoverFornecedor extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("idFornecedor");
		int idFornecedor = Integer.parseInt(id);

		Fornecedor forn = new Fornecedor();
		forn.setIdFornecedor(idFornecedor);

		FornecedorDao dao = new FornecedorDao();
		dao.delete(idFornecedor);

		response.sendRedirect("listafornecedor.jsp");
	}
}
