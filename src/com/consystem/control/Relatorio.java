package com.consystem.control;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.consystem.jdbc.ConnectionFactory;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;


@WebServlet("/Relatorio")
public class Relatorio extends HttpServlet{

	private static final long serialVersionUID = 1L;

	private InputStream input;
	private OutputStream out;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/pdf");
		String nome = request.getParameter("nome");
		input = getServletContext().getResourceAsStream("/relatorio/" + nome + ".jasper");
		out = response.getOutputStream();
		
		try {
			Connection con = new ConnectionFactory().getConnection();
			JasperPrint print = JasperFillManager.fillReport(input, null, con);
			JasperExportManager.exportReportToPdfStream(print, out);
		} catch (SQLException | JRException e) {
			throw new RuntimeException(e);
		}
		out.flush();
		out.close();
	}
}
