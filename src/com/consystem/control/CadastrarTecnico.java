package com.consystem.control;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.consystem.dao.TecnicoDao;
import com.consystem.model.Tecnico;

@WebServlet("/cadTecnico")
public class CadastrarTecnico extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String nome = request.getParameter("nome");
		String rg = request.getParameter("rg");
		String cpf = request.getParameter("cpf");
		String telContato = request.getParameter("telContato");
		String endereco = request.getParameter("endereco");
		String bairro = request.getParameter("bairro");
		String cidade = request.getParameter("cidade");
		String estado = request.getParameter("estado");
		String nacionalidade = request.getParameter("nacionalidade");
		String dataNasc = request.getParameter("dataNasc");
		String dataAdm = request.getParameter("dataAdm");
		String funcao = request.getParameter("funcao");
		String obs = request.getParameter("obs");

		Tecnico tec = new Tecnico();
		tec.setNome(nome);
		tec.setRg(rg);
		tec.setCpf(cpf);
		tec.setTelContato(telContato);
		tec.setEndereco(endereco);
		tec.setBairro(bairro);
		tec.setCidade(cidade);
		tec.setEstado(estado);
		tec.setNacionalidade(nacionalidade);

		Calendar dataN = null;
		Calendar dataA = null;
		try {
			Date dateN = new SimpleDateFormat("dd/MM/yyyy").parse(dataNasc);
			dataN = Calendar.getInstance();
			dataN.setTime(dateN);
			Date dateA = new SimpleDateFormat("dd/MM/yyyy").parse(dataAdm);
			dataA = Calendar.getInstance();
			dataA.setTime(dateA);
		} catch (ParseException e) {

		}
		tec.setDataNasc(dataN);
		tec.setDataAdmissao(dataA);
		tec.setFuncao(funcao);
		tec.setObs(obs);

		TecnicoDao dao = new TecnicoDao();
		dao.add(tec);
		
		response.sendRedirect("success.html");
	}
}

