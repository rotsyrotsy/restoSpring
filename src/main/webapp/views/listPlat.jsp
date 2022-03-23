<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="baseURL" value="${scheme}://${serverName}:${serverPort}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="${baseURL}/plats">
		Trier les plats:
		<select name="categorie">
                    <option value="tous">Tous</option>
		<c:forEach  items="${listCategorie}" var ="categorie">
			<option value="${categorie.label}">${categorie.label}</option>
		</c:forEach>
		</select>
		<input type="submit" value="trier">
	</form>
<table border="1">
	<tr>
		<th>Nom</th>
		<th>Prix</th>
		<th>Categorie</th>
	</tr>
	<c:forEach  items="${listPlat}" var ="plat">
	<tr>
		<td>${plat.label}</td>
		<td>${plat.price}</td>
		<td>${plat.categorie}</td>
	</tr>
    </c:forEach>
</table>
</body>
</html>