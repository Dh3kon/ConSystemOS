<%@page import="com.consystem.dao.ServicoDao"%>
<%@page import="com.consystem.model.Servico"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ConSystem - Editar Serviço</title>
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
				Servico serv = new Servico();
				ServicoDao dao = new ServicoDao();
				String id = request.getParameter("idServico");
				int idServico = Integer.parseInt(id);
				serv = dao.buscaId(idServico);
			 %>
			 <form action="editaServico" method="post">
				<h2>Editar Serviço</h2>
			 	<input type="hidden" name="idServico" value="<%=serv.getIdServico() %>"/><br>
				<div class="form-group">
						<label>Descrição</label>
						<input type="text" class="form-control" name="descricao" value="<%=serv.getDescricao() %>">
					</div>
					<div class="form-group">
						<label>Técnico</label>
						<input type="text" class="form-control" name="idTecnico" value="<%=serv.getIdTecnico()%>">
					</div>
					<div class="form-group">
						<label>Pontuação</label>
						<input type="text" class="form-control" name="pontuacao" value="<%=serv.getPontuacao() %>">
					</div>
			 	<input type="submit" class="btn btn-primary" value="Atualizar"/>
				 <a class="btn btn-danger" href="listaservico.jsp" role="button">Voltar</a>
			 </form>
		</div>
	</div>
</body>
</html>