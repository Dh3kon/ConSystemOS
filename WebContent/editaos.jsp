<%@page import="com.consystem.dao.OrdemServicoDao"%>
<%@page import="com.consystem.model.OrdemServico"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SistemaOS - Editar Ordem de Serviço</title>
</head>
<body>
	<h2>Editar Ordem de Serviço</h2>
	<hr>
	<%
		OrdemServico os = new OrdemServico();
		OrdemServicoDao dao = new OrdemServicoDao();
		String id = request.getParameter("os");
		int os1 = Integer.parseInt(id);
		os = dao.buscaId(os1);
		String dataos = request.getParameter("dataos");
		String dataf = request.getParameter("dataf");
	 %>
	 
	 <form action="editaOS" method="post">
	 	ID<input type="hidden" name="os" value="<%=os.getOs() %>"/><br>
		Descrição<input type="text" name="descricao" value="<%=os.getDescricao()%>"/><br>
		Status<input type="text" name="status" value="<%=os.getStatus()%>"/><br>
		Observação<input type="text" name="observacao" value="<%=os.getObservacao()%>"/><br>
		Técnico<input type="text" name="idTecnico" value="<%=os.getIdTecnico()%>"/><br>
		Veículo<input type="text" name="idVeiculo" value="<%=os.getIdVeiculo()%>"/><br>
		Cliente<input type="text" name="idCliente" value="<%=os.getIdCliente()%>"/><br>
		Data de Finalização<input type="date" name="dataFinalizacao" value="dataf"/><br>
		<input type="submit" value="Salvar"/>
	</form>
	 <br><hr>
	 <form action="listaos.html">
		<input type="submit" value="Voltar"/>
	</form>
</body>
</html>