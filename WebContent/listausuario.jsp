<%@page import="com.consystem.dao.UsuarioDao"%>
<%@page import="com.consystem.model.Usuario"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SistemaOS - Lista de Usuários</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
<%
		Usuario user1 = (Usuario) session.getAttribute("user");
		if (user1.getTipo().equals("TEC")) {
	%>
			<c:import url="menutec.jsp"></c:import>
	<%		
		}
		if (user1.getTipo().equals("ADM")) {
	%>
			<c:import url="WEB-INF/jsp/menuadm.jsp"></c:import>
	<%
		}	 
	%>
	<div class="jumbotron">
		<div class="container">
			<h2>Lista de Usuários</h2>
			<table class="table table-hover" >
				<tr>
					<td></td>
					<td>Login</td>
					<td>Senha</td>
					<td>ID Técnico</td>
					<td>Tipo</td>
				</tr>
				<%
					UsuarioDao dao = new UsuarioDao();
					List<Usuario> lista = dao.listarUsuarios();
					for(Usuario user : lista) {
				 %>
				 <tr>
				 	<td><%=user.getIdUsuario() %></td>
				 	<td><%=user.getLogin() %></td>
				 	<td><%=user.getSenha() %></td>
				 	<td><%=user.getTecnico() %></td>
				 	<td><%=user.getTipo() %></td>
				 	<%
						if (user1.getTipo().equals("ADM")) {
					%>
					 	<td><a href="editausuario.jsp?idUsuario=<%=user.getIdUsuario()%>">editar</a></td>
					<%
						}
					%>	
				 	<td><a href="removeUsuario?idUsuario=<%=user.getIdUsuario() %>">remover</a></td>
				 </tr>
				<% } %>
			</table>
			<a class="btn btn-danger" href="index.html" role="button">Voltar</a>
		</div>
	</div>
</body>
</html>