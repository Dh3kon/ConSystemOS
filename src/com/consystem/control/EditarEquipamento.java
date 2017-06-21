package com.consystem.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.consystem.dao.EquipamentoDao;
import com.consystem.model.Equipamento;

@WebServlet("/editaEquip")
public class EditarEquipamento extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("idEquip");
		String descricao = request.getParameter("descricao");
		String marca = request.getParameter("marca");
		String fornecedor = request.getParameter("fornecedor");
		String tipo = request.getParameter("tipo");
		String numSerie = request.getParameter("numSerie");

		Equipamento equip = new Equipamento();
		equip.setIdEquipamento(Integer.parseInt(id));
		equip.setDescricao(descricao);
		equip.setMarca(marca);
		equip.setFornecedor(Integer.parseInt(fornecedor));
		equip.setTipo(tipo);
		equip.setNumSerie(numSerie);

		EquipamentoDao dao = new EquipamentoDao();
		dao.editar(equip);

		response.sendRedirect("listaequipamento.jsp");
	}
}
