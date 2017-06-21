package com.consystem.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.consystem.dao.OrdemServicoDao;
import com.consystem.model.OrdemServico;

@WebServlet("/removerOS")
public class RemoverOS extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ordem = request.getParameter("os");
		int os1 = Integer.parseInt(ordem);
		
		OrdemServico os = new OrdemServico();
		os.setOs(os1);
		
		OrdemServicoDao dao = new OrdemServicoDao();
		dao.delete(os1);
		
		response.sendRedirect("listaos.jsp");
	}
}

