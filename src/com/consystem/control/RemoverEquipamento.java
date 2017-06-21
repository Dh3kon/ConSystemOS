package com.consystem.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.consystem.dao.EquipamentoDao;
import com.consystem.model.Equipamento;

@WebServlet("/removerEquipamento")
public class RemoverEquipamento extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("idEquip");
		int idEquip = Integer.parseInt(id);

		Equipamento equip = new Equipamento();
		equip.setIdEquipamento(idEquip);

		EquipamentoDao dao = new EquipamentoDao();
		dao.delete(idEquip);

		response.sendRedirect("listaequipamento.jsp");
	}
}
