package com.consystem.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.consystem.dao.FornecedorDao;
import com.consystem.model.Fornecedor;

@WebServlet("/cadFornecedor")
public class CadastrarFornecedor extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String nome = request.getParameter("nome");
		String cnpj = request.getParameter("cnpj");
		String inscEst = request.getParameter("inscEst");
		String endereco = request.getParameter("endereco");
		String cidade = request.getParameter("cidade");
		String estado = request.getParameter("estado");
		String pais = request.getParameter("pais");
		String telefone = request.getParameter("telefone");
		String email = request.getParameter("email");
		String site = request.getParameter("site");

		Fornecedor forn = new Fornecedor();
		forn.setNome(nome);
		forn.setCnpj(cnpj);
		forn.setInscEst(inscEst);
		forn.setEndereco(endereco);
		forn.setCidade(cidade);
		forn.setEstado(estado);
		forn.setPais(pais);
		forn.setTelefone(telefone);
		forn.setEmail(email);
		forn.setSite(site);

		FornecedorDao dao = new FornecedorDao();
		dao.add(forn);
		
		response.sendRedirect("success.html");
	}
}
