package com.consystem.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.consystem.dao.ServicoDao;
import com.consystem.model.Servico;

@WebServlet("/editaServico")
public class EditarServico extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("idServico");
		String descricao = request.getParameter("descricao");
		String tecnico = request.getParameter("idTecnico");
		String pontuacao = request.getParameter("pontuacao");

		Servico serv = new Servico();
		serv.setIdServico(Integer.parseInt(id));
		serv.setDescricao(descricao);
		serv.setIdTecnico(Integer.parseInt(tecnico));
		serv.setPontuacao(Integer.parseInt(pontuacao));

		ServicoDao dao = new ServicoDao();
		dao.editar(serv);

		response.sendRedirect("listaservico.jsp");
	}
}
