package com.consystem.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.consystem.dao.TecnicoDao;
import com.consystem.model.Tecnico;

@WebServlet("/removerTecnico")
public class RemoverTecnico extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("idTecnico");
		int idTecnico = Integer.parseInt(id);
		
		Tecnico tec = new Tecnico();
		tec.setIdTecnico(idTecnico);
		
		TecnicoDao dao = new TecnicoDao();
		dao.delete(idTecnico);
		
		response.sendRedirect("listatecnico.jsp");
	}
}

