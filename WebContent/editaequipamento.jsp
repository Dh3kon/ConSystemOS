<%@page import="com.consystem.dao.EquipamentoDao"%>
<%@page import="com.consystem.model.Equipamento"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ConSystem - Editar Equipamento</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<c:import url="menuadm.jsp"></c:import>
	<div class="jumbotron">
		<div class="container">
			<%
				Equipamento equip = new Equipamento();
				EquipamentoDao dao = new EquipamentoDao();
				String id = request.getParameter("idEquip");
				int idEquip = Integer.parseInt(id);
				equip = dao.buscaId(idEquip);
			 %>
			 
			 <form action="editaEquip" method="post">
			 	<h2>Editar Equipamento</h2>
			 	<input type="hidden" name="idEquip" value="<%=equip.getIdEquipamento() %>"/>
			 	<div class="form-group">
					<label>Descrição</label>
					<input type="text" name="descricao" class="form-control" value="<%=equip.getDescricao()%>">
				</div>
				<div class="form-group">
					<label>Marca</label>
					<input type="text" name="marca" class="form-control" value="<%=equip.getMarca()%>">
				</div>
				<div class="form-group">
					<label>Fornecedor</label>
					<input type="text" name="fornecedor" class="form-control" value="<%=equip.getFornecedor()%>">
				</div>
				<div class="form-group">
					<label>Tipo</label>
					<input type="text" name="tipo" class="form-control" value="<%=equip.getTipo()%>">
				</div>
				<div class="form-group">
					<label>Número de Série</label>
					<input type="text" name="numero_serie" class="form-control" value="<%=equip.getNumSerie()%>">
				</div>
				<button type="submit" class="btn btn-primary" value="Salvar">Salvar</button>
				<a class="btn btn-warning" href="cadequipamento.html" role="button">Limpar</a>
				<a class="btn btn-danger" href="listaequipamento.jsp" role="button">Voltar</a>
			</form>
		</div>
	</div>
</body>
</html>