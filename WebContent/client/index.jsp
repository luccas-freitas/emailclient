<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.mail.Message"%>
<%@ page import="javax.mail.Part" %>
<%@ page import="javax.mail.Multipart" %>
<%@ page import="javax.mail.Address"%>
<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="br.edu.ifpr.emailclient.utils.ReceiverUtility" %>
<%@ page import="javax.mail.MessagingException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>CAUF-2018</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" type="text/css" href="../css/styles.css" />
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="../font-awesome/css/font-awesome.min.css" />

<script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">

		<div class="page-header">
			<h1>
				Gerenciador de e-mails <small>Construção de Aplicações
					Utilizando Frameworks</small>
			</h1>
		</div>

		<div class="container pb-mail-template1">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<nav class="navbar navbar-default pb-mail-navbar">
						<div class="container-fluid">
							<!-- Brand and toggle get grouped for better mobile display -->
							<div class="navbar-header">
								<button type="button" class="navbar-toggle collapsed"
									data-toggle="collapse"
									data-target="#bs-example-navbar-collapse-1"
									aria-expanded="false">
									<span class="sr-only">Toggle navigation</span> <span
										class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
								<a class="navbar-brand" id="brand" href="#">Bem vindo,
									Luccas!</a>
							</div>
						</div>
						</nav>
					</div>
					<div class="row">
						<div class="col-md-2" id="column-resize">
							<div class="collapse navbar-collapse"
								id="bs-example-navbar-collapse-1">
								<button id="btn_email" class="btn btn-danger"
									data-toggle="modal" data-target="#myModal">Novo E-mail
								</button>

								<ul class="sui-treeview-list" tabindex="0" role="tree">
									<li>
										<div class="sui-treeview-item-content">
											<span class="sui-treeview-item-text" id="shielddw"> <span
												class="sui-treeview-item-icon fa fa-envelope"></span>
												Entrada 
											<%
											 	out.println(" (" + session.getAttribute("msgCount") + ")");
											%>
											</span>
										</div>
										<ul class="sui-treeview-list sui-treeview-item-list"
											role="group" style="display: none;"></ul>
									</li>
									<li>
										<div class="sui-treeview-item-content">
											<span class="sui-treeview-item-text" id="shielddx"> <span
												class="sui-treeview-item-icon fa fa-book"></span> Enviados
											</span>
										</div>
										<ul class="sui-treeview-list sui-treeview-item-list"
											role="group" style="display: none;"></ul>
									</li>
									<li aria-describedby="shielddy">
										<div class="sui-treeview-item-content">
											<span class="sui-treeview-item-text" id="shielddy"> <span
												class="sui-treeview-item-icon fa fa-exclamation-triangle"></span>
												Spam
											</span>
										</div>
										<ul class="sui-treeview-list sui-treeview-item-list"
											role="group" style="display: none;"></ul>
									</li>
									<li>
										<div class="sui-treeview-item-content">
											<span class="sui-treeview-item-text" id="shielddz"> <span
												class="sui-treeview-item-icon fa fa-trash-o"></span> Lixeira
											</span>
										</div>
										<ul class="sui-treeview-list sui-treeview-item-list"
											role="group" style="display: none;"></ul>
									</li>
									<li>
										<div class="sui-treeview-item-content">
											<span class="sui-treeview-item-text" id="shieldea"> <span
												class="sui-treeview-item-icon fa fa-info"></span> Info
											</span>
										</div>
										<ul class="sui-treeview-list sui-treeview-item-list"
											role="group" style="display: none;"></ul>
									</li>
								</ul>


							</div>
							<!-- /.navbar-collapse -->
						</div>
						<div class="col-md-10">
							<div class="row" id="row_style">
								<div class="panel panel-default">
									<div class="panel-heading">
										<div class="row">
											<div class="col-xs-4 col-md-4">
												<p id="inbox_parag">Caixa de Entrada</p>
											</div>
											<div class="col-xs-8 col-md-8">
												<div class="input-group">
													<input type="text" name="" placeholder="Pesquisar..."
														class="form-control"> <span
														class="input-group-btn">
														<button class="btn btn-primary" type="button"
															tabindex="-1">
															<span class="fa fa-question fa-2x" area-hidden="true"></span>
														</button>
													</span>
												</div>
											</div>
										</div>
									</div>
									<div class="panel-body">
										<div class="row">
											<div class="col-xs-9 col-md-10">
												<div class="btn-group">
													<a data-toggle="dropdown" href="#"
														class="btn btn-warning btn-md" aria-expanded="false">Selecionar
														todos <i class="fa fa-angle-down "></i>
													</a>
													<ul class="dropdown-menu">
														<li><a href="#">Nenhum</a></li>
														<li><a href="#">Lidos</a></li>
														<li><a href="#">Não lidos</a></li>
													</ul>
												</div>
												<div class="btn">
													<a data-toggle="dropdown" href="#"
														class="btn btn-warning btn-md" aria-expanded="false">Mais
														<i class="fa fa-angle-down "></i>
													</a>
													<ul class="dropdown-menu">
														<li><a href="#">Marcar todos como lidos</a></li>
													</ul>
												</div>
											</div>
											<div class="col-xs-3 col-md-2">

												<div class="btn-group pull-right">
													<a data-toggle="dropdown" href="#" class="btn btn-primary"
														aria-expanded="false"> <i class="fa fa-cog"></i>
													</a>
													<ul class="dropdown-menu">
														<li><a href="#">Complementos</a></li>
														<li><a href="#">Temas</a></li>
														<li><a href="#">Opções</a></li>
														<hr>
														<li><a href="#">Configurar Caixa de Entrada</a></li>
													</ul>
												</div>
											</div>
										</div>
										<hr>


										<div id="grid" role="grid" aria-readonly="true"
											class="sui-grid sui-grid-core">
											<div class="sui-gridheader">
												<table class="sui-table sui-non-selectable">
													<colgroup>
														<col style="width: 2em">
														<col style="width: 2em">
														<col style="width: 17em">
														<col style="width: 2em">
														<col style="width: 20em">
														<col style="width: 5em">
														<col style="width: 2em">
													</colgroup>
													<thead>
														<tr role="row" class="sui-columnheader">
															<th data-field="check" role="columnheader" tabindex="-1"
																class="sui-headercell" style="text-align: center;"><a
																href="#" class="sui-link sui-unselectable"
																unselectable="on" tabindex="-1"><input
																	type="checkbox"></a></th>
															<th data-field="icon" role="columnheader" tabindex="-1"
																class="sui-headercell"><a href="#"
																class="sui-link sui-unselectable" unselectable="on"
																tabindex="-1">&nbsp;</a></th>
															<th data-field="message" role="columnheader"
																tabindex="-1" class="sui-headercell"><a href="#"
																class="sui-link sui-unselectable" unselectable="on"
																tabindex="-1">Assunto</a></th>
															<th data-field="attach" role="columnheader" tabindex="-1"
																class="sui-headercell"><a href="#"
																class="sui-link sui-unselectable" unselectable="on"
																tabindex="-1">&nbsp;</a></th>
															<th data-field="message" role="columnheader"
																tabindex="-1" class="sui-headercell"><a href="#"
																class="sui-link sui-unselectable" unselectable="on"
																tabindex="-1">Remetente</a></th>
															<th data-field="date" role="columnheader" tabindex="-1"
																class="sui-headercell"><a href="#"
																class="sui-link sui-unselectable" unselectable="on"
																tabindex="-1">Entregue em</a></th>
															<th data-field="read" role="columnheader" tabindex="-1"
																class="sui-headercell"><a href="#"
																class="sui-link sui-unselectable" unselectable="on"
																tabindex="-1">Ler</a></th>
														</tr>
													</thead>
													<tbody class="sui-hide">
														<tr>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="sui-gridcontent">
											
											<form action="../EmailContentServlet" method="get">
											
												<table class="sui-table sui-hover sui-selectable table">
													<colgroup>
														<col style="width: 2em">
														<col style="width: 2em">
														<col style="width: 17em">
														<col style="width: 2em">
														<col style="width: 20em">
														<col style="width: 5em">
														<col style="width: 2em">
													</colgroup>
													<tbody>
	<%
		Message[] messages = (Message[]) session.getAttribute("messages");
		for (int i = 0; i < (Integer) session.getAttribute("msgCount"); i++) {
			out.println("<tr data-toggle=\"modal\" data-id=\"" + i
					+ "\" data-target=\"#contentModal\" class=\"sui-alt-row emails\" role=\"row\">");
			out.println(
					"<td style=\"text-align: center;\" role=\"gridcell\" tabindex=\"1\" class=\"sui-cell\"><input type=\"checkbox\"></td>");
			out.println(
					"<td style=\"text-align: center;\" role=\"gridcell\" tabindex=\"-1\" class=\"sui-cell\"><span class=\"fa fa-envelope\"></span></td>");
			out.println("<td role=\"gridcell\" tabindex=\"2\" class=\"sui-cell\">");
			out.println(messages[i].getSubject() + "</td>");
			out.println(
					"<td style=\"text-align: center;\" role=\"gridcell\" tabindex=\"-1\" class=\"sui-cell\"><span class=\"fa fa-paperclip\"></span></td>");
			out.println("<td role=\"gridcell\" tabindex=\"3\" class=\"sui-cell\">");
			Address[] froms = messages[i].getFrom();
			String email = froms == null ? null : ((InternetAddress) froms[0]).getAddress();
			out.println(email + "</td>");

			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			Date data = messages[i].getReceivedDate();

			out.println("<td role=\"gridcell\" tabindex=\"5\" class=\"sui-cell\">" + format.format(data) + "</td>");
			out.println("<td role=\"gridcell\" tabindex=\"5\" class=\"sui-cell\"> <input type=\"submit\" name=\"id\" value=\"" + i + "\"></td>");
			out.println("</tr> </a>");
			
		}
	%>
													</tbody>
												</table>
			</form>
											</div>
											<div class="sui-pager sui-pager-core">
												<ul class="sui-pagination">
													<li class="sui-pager-element sui-disabled"><a
														title="Go to the first page" data-page="1"
														class="sui-first">«</a></li>
													<li class="sui-pager-element sui-disabled"><a
														title="Go to the previous page" data-page="0"
														class="sui-prev">‹</a></li>
													<li class="sui-pager-element"><a data-page="1"
														class="sui-pager-number sui-selected">1</a></li>
													<li class="sui-pager-element sui-disabled"><a
														title="Go to the next page" data-page="2" class="sui-next">›</a></li>
													<li class="sui-pager-element sui-disabled"><a
														title="Go to the last page" data-page="1" class="sui-last">»</a></li>
												</ul>
												<div class="sui-pager-info-box">
													<%
														out.println("1 - " + session.getAttribute("msgCount") + " de " + session.getAttribute("msgCount") + " items");
													%>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Modal view -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="exampleModal" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<div class="row">
										<div class="col-md-4">
											<h5>Novo e-mail</h5>
										</div>
										<div class="col-md-8">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
									</div>
								</div>
								<form action="../EmailSendingServlet" method="post">

									<div class="modal-body">
										<div class="form-group row">
											<div class="col-md-3">
												<p>Para:</p>
											</div>
											<div class="col-md-9">
												<input type="email" name="recipient"
													placeholder="Insira um e-mail" class="form-control"
													required>
											</div>
										</div>
										<div class="form-group row">
											<div class="col-md-3">
												<p>Assunto:</p>
											</div>
											<div class="col-md-9">
												<input type="text" name="subject" class="form-control"
													required>
											</div>
										</div>
										<div class="form-group row">
											<div class="col-md-3">
												<p>E-mail:</p>
											</div>
											<div class="col-md-9">
												<textarea class="form-control" name="content" rows="10"
													required></textarea>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button class="btn btn-primary pull-left" id="btn_file">
											<span class="fa fa-paperclip fa-2x"></span> <input
												type="file" id="file" style="display: none;" />
										</button>
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Cancelar</button>
										<button type="submit" class="btn btn-primary" value="Send">Enviar</button>
									</div>
								</form>

							</div>
						</div>
					</div>
					<!-- End of modal -->

				</div>
			</div>
		</div>

		<!-- you need to include the shieldui css and js assets in order for the charts to work -->
		<link rel="stylesheet" type="text/css"
			href="https://www.shieldui.com/shared/components/latest/css/light-bootstrap/all.min.css" />
		<script src="js/content.js"></script>
	</div>

</body>
</html>