package com.consystem.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.consystem.dao.VeiculoDao;
import com.consystem.model.Veiculo;

@WebServlet("/cadVeiculo")
public class CadastrarVeiculo extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String modelo = request.getParameter("modelo");
		String marca = request.getParameter("marca");
		String placa = request.getParameter("placa");
		String ano = request.getParameter("ano");
		String status = request.getParameter("status");

		Veiculo vel = new Veiculo();
		vel.setModelo(modelo);
		vel.setMarca(marca);
		vel.setPlaca(placa);
		vel.setAno(ano);
		vel.setStatus(status);

		VeiculoDao dao = new VeiculoDao();
		dao.add(vel);

		response.sendRedirect("success.html");
	}
}
