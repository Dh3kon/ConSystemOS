<%@page import="com.consystem.dao.VeiculoDao"%>
<%@page import="com.consystem.model.Veiculo"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ConSystem - Editar Veículo</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<c:import url="WEB-INF/jsp/menuadm.jsp"></c:import>
	<%
		Veiculo vel = new Veiculo();
		VeiculoDao dao = new VeiculoDao();
		String id = request.getParameter("idVeiculo");
		int idVeiculo = Integer.parseInt(id);
		vel = dao.buscaId(idVeiculo);
	 %>
	 <div class="jumbotron">
	 	<div class="container">
			<h2>Editar Veículo</h2>
			 <form action="editarVeiculo" method="post">
			 <input type="hidden" class="form-control"
						name="idVeiculo" value="<%=vel.getIdVeiculo() %>">
			 	<div class="form-group">
					<label>Modelo</label> <input type="text" class="form-control"
						name="modelo" value="<%=vel.getModelo() %>">
				</div>
				<div class="form-group">
					<label>Marca</label> <input type="text" class="form-control"
						name="marca" value="<%=vel.getMarca() %>">
				</div>
				<div class="form-group">
					<label>Placa</label> <input type="text" class="form-control"
						name="placa" value="<%=vel.getPlaca() %>">
				</div>
				<div class="form-group">
					<label>Ano</label> <input type="text" class="form-control"
						name="ano" value="<%=vel.getAno() %>">
				</div>
				<div class="form-group">
					<label>Status</label> <select class="form-control" name="status">
						<option>Ativo</option>
						<option>Inativo</option>
						<option>Manutenção</option>
					</select>
				</div>
			 	<button type="submit" class="btn btn-primary" value="Salvar">Atualizar</button>
			 	<a class="btn btn-danger" href="listaveiculo.jsp" role="button">Voltar</a>
			 </form>
	 	</div>
	 </div>
</body>
</html>