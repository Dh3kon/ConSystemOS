<%@page import="com.consystem.model.Usuario"%>
<%@page import="com.consystem.dao.EquipamentoDao"%>
<%@page import="com.consystem.model.Equipamento"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ConSystem - Lista de Equipamentos</title>
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
			<h2>Lista de Equipamentos</h2>
			 <table class="table table-hover">
			 	<thead>
					 <tr>
					 	<th>C�digo</th>
					 	<th>Descri��o</th>
					 	<th>Marca</th>
					 	<th>Fornecedor</th>
					 	<th>Tipo</th>
					 	<th>N�mero de S�rie</th>
					 </tr>
				</thead>
			<%
				EquipamentoDao dao = new EquipamentoDao();
				List<Equipamento> lista = dao.listarEquipamantos();
				for (Equipamento equip : lista){
			 %>
			 	<tr>
					<td><%=equip.getIdEquipamento() %></td>
					<td><%=equip.getDescricao() %></td>	 
					<td><%=equip.getMarca() %></td>
					<td><%=equip.getFornecedor() %></td>
					<td><%=equip.getTipo() %></td>
					<td><%=equip.getNumSerie() %></td>
					<%
						if (user1.getTipo().equals("ADM")) {
					%>
						<td><a href="editaequipamento.jsp?idEquip=<%=equip.getIdEquipamento()%>">editar</a></td>
					<%
						}
					%>	
					<%
						if (user1.getTipo().equals("ADM")) {
					%>
						<td><a href="removerEquipamento?idEquip=<%=equip.getIdEquipamento()%>">remover</a></td>		
					<%
						}
					%>	
			 	</tr>
			 <% } %>
			 </table>
			 <a class="btn btn-danger" href="homea.jsp" role="button">Voltar</a>
		</div>
	</div>
</body>
</html>