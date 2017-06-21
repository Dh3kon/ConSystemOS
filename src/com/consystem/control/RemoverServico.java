package com.consystem.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.consystem.dao.ServicoDao;
import com.consystem.model.Servico;

@WebServlet("/removeServico")
public class RemoverServico extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("idServico");
		int idServico = Integer.parseInt(id);
		
		Servico serv = new Servico();
		serv.setIdServico(idServico);
		
		ServicoDao dao = new ServicoDao();
		dao.delete(idServico);
		
		response.sendRedirect("listaservico.jsp");
	}
}

