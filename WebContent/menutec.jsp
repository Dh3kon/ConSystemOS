<%@page import="com.consystem.model.Usuario"%>
<%
		Usuario user = (Usuario) session.getAttribute("user");
%>
<section id="menu">
		<div class="container">
			<div class="row">
				<nav class="navbar navbar-default">
					<div class="container-fluid">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1"
								aria-expanded="false">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li class="active"><a href="homet.jsp">Home<span
										class="sr-only">(current)</span></a></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">Listar <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="listaveiculo.jsp">Ve�culo</a></li>
										<li><a href="listaproduto.jsp">Produto</a></li>
										<li><a href="listaequipamento.jsp">Equipamento</a></li>
										<li><a href="listaservico.jsp">Servi�o</a></li>
										<li><a href="listaestoque.jsp">Estoque</a></li>
										<li><a href="listafornecedor.jsp">Fornecedor</a></li>
										<li><a href="listaos.jsp">Ordem de Servi�o</a></li>
									</ul></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">Relat�rio <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="Relatorio?nome=listaUsuario" target="_novo">Usu�rio</a></li>
										<li><a href="Relatorio?nome=listaVeiculo" target="_novo">Ve�culo</a></li>
										<li><a href="Relatorio?nome=listaTecnico" target="_novo">T�cnico</a></li>
										<li><a href="Relatorio?nome=listaProduto" target="_novo">Produto</a></li>
										<li><a href="Relatorio?nome=listaEquipamento" target="_novo">Equipamento</a></li>
										<li><a href="Relatorio?nome=listaServicos" target="_novo">Servi�o</a></li>
										<li><a href="Relatorio?nome=listaEstoque" target="_novo">Estoque</a></li>
										<li><a href="Relatorio?nome=listaFornecedor" target="_novo">Fornecedor</a></li>
										<li><a href="Relatorio?nome=listaOs" target="_novo">Ordem de Servi�o</a></li>
									</ul></li>
							</ul>
							<ul class="nav navbar-nav navbar-right">
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false"><%=user.getTecnico() %> <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="index.html">Logout</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</div>
	</section>