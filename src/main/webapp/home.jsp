<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="model.beans.*" %>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("prodotti");
	if(products == null) {
		response.sendRedirect("./catalogo");
		return;
	}
	HttpSession sessione = request.getSession();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<link rel="stylesheet" href="utilities/css/home.css">
</head>
<!-- Header -->
<%@ include file="utilities/header.jsp" %>

<body>
 <% if (products != null && products.size() != 0) { %>
<div id=container>
<div class="grid-container">
  <%
    Iterator<?> it = products.iterator();
    while (it.hasNext()) {
      Prodotto bean = (Prodotto) it.next();
  %>
  <div class="product-container" onclick="redirectToProduct(<%= bean.getId() %>)">
    <img class="product-image" src="<%= bean.getImmagine() %>" alt="<%= bean.getNome() %>">
    <h3 class="nome"><%= bean.getNome() %></h3>
    <div class="details">
      <p class="price"><%= bean.getPrezzo() %>€ </p>
      <%if(sessione.getAttribute("id")!=null) {%>
      <a href="ControlloProdotto?action=addToC&id=<%= bean.getId() %>&quantity=1" class="carrello-button">Carrello</a>
    	<%} %>
    </div>
  </div>
  <% } %>
  </div>
</div>
      <% } else { %>
      <div class="error-message">
 		 <p>Nessun prodotto disponibile al momento.</p>
	</div>
	<% }  %>
 <footer><%@ include file="utilities/footer.jsp" %></footer>
</body>
</html>
