package com.consystem.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.consystem.dao.ServicoDao;
import com.consystem.model.Servico;

@WebServlet("/cadServico")
public class CadastrarServico extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String descricao = request.getParameter("descricao");
		String idTecnico = request.getParameter("idTecnico");
		String pontuacao = request.getParameter("pontuacao");

		Servico serv = new Servico();
		serv.setDescricao(descricao);
		serv.setIdTecnico(Integer.parseInt(idTecnico));
		serv.setPontuacao(Integer.parseInt(pontuacao));

		ServicoDao dao = new ServicoDao();
		dao.add(serv);

		response.sendRedirect("success.html");
	}
}
