package com.consystem.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.consystem.dao.VeiculoDao;
import com.consystem.model.Veiculo;

@WebServlet("/removerVeiculo")
public class RemoverVeiculo extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("idVeiculo");
		int idVeiculo = Integer.parseInt(id);
		
		Veiculo vel = new Veiculo();
		vel.setIdVeiculo(idVeiculo);
		
		VeiculoDao dao = new VeiculoDao();
		dao.delete(idVeiculo);
		
		response.sendRedirect("listaveiculo.jsp");
	}
}

