package com.consystem.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.consystem.dao.OrdemServicoDao;
import com.consystem.model.OrdemServico;

@WebServlet("/cadOS")
public class CadastrarOS extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String descricao = request.getParameter("descricao");
		String status = request.getParameter("status");
		String observacao = request.getParameter("observacao");
		String tecnico = request.getParameter("idTecnico");
		String veiculo = request.getParameter("idVeiculo");
		String cliente = request.getParameter("idCliente");

		OrdemServico os = new OrdemServico();
		os.setDescricao(descricao);
		os.setStatus(status);
		os.setObservacao(observacao);
		os.setTecnico(tecnico);
		os.setVeiculo(veiculo);
		os.setCliente(cliente);

		OrdemServicoDao dao = new OrdemServicoDao();
		dao.add(os);

		response.sendRedirect("success.html");
	}
}
