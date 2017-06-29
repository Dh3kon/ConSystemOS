<%@page import="com.consystem.dao.OrdemServicoDao"%>
<%@page import="com.consystem.model.OrdemServico"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ConSystem - Editar Ordem de Serviço</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<c:import url="WEB-INF/jsp/menuadm.jsp"></c:import>
	<%
		OrdemServico os = new OrdemServico();
		OrdemServicoDao dao = new OrdemServicoDao();
		String id = request.getParameter("os");
		int os1 = Integer.parseInt(id);
		os = dao.buscaId(os1);
	 %>
	 <div class="jumbotron">
	 	<div class="container">
		<h2>Editar Ordem de Serviço</h2>
			 <form action="editaOS" method="post">
			 	<div class="form-group">
			 		<label>Descrição</label>
					<input type="text" name="descricao" class="form-control" value="<%=os.getDescricao()%>">
			 	</div>
			 	<div class="form-group">
			 		<label>Status</label>
					<input type="text" name="status" class="form-control" value="<%=os.getStatus()%>">
			 	</div>
			 	<div class="form-group">
			 		<label>Observação</label>
					<input type="text" name="observacao" class="form-control" value="<%=os.getObservacao()%>"/><br>
			 	</div>
			 	<div class="form-group">
			 		<label>Técnico</label>
					<input type="text" name="idTecnico" class="form-control" value="<%=os.getTecnico()%>"/><br>
			 	</div>
			 	<div class="form-group">
			 		<label>Veículo</label>
					<input type="text" name="idVeiculo" class="form-control" value="<%=os.getVeiculo()%>"/><br>
			 	</div>
			 	<div class="form-group">
			 		<label>Cliente</label>
					<input type="text" name="idCliente" class="form-control" value="<%=os.getCliente()%>"/><br>
			 	</div>
			 	<button type="submit" class="btn btn-primary" value="Salvar">Atualizar</button>
			 	<a class="btn btn-danger" href="listaos.jsp" role="button">Voltar</a>
			</form>
	 	</div>
	 </div>
	 <br><hr>
	 <form action="listaos.html">
		<input type="submit" value="Voltar"/>
	</form>
</body>
</html>