package com.consystem.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.consystem.dao.EquipamentoDao;
import com.consystem.model.Equipamento;

@WebServlet("/cadEquip")
public class CadastrarEquipamento extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String descricao = request.getParameter("descricao");
		String marca = request.getParameter("marca");
		String fornecedor = request.getParameter("fornecedor");
		String tipo = request.getParameter("tipo");
		String numSerie = request.getParameter("numero_serie");
		
		Equipamento equip = new Equipamento();
		equip.setDescricao(descricao);
		equip.setMarca(marca);
		equip.setFornecedor(fornecedor);
		equip.setTipo(tipo);
		equip.setNumSerie(numSerie);
		
		EquipamentoDao dao = new EquipamentoDao();
		dao.add(equip);
		
		response.sendRedirect("success.html");
	}
}

