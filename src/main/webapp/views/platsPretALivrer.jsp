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
<table border="1">
	<tr>
		<th>Nom</th>
		<th>Prix</th>
	</tr>
	<c:forEach  items="${platsPret}" var ="plat" varStatus="i">
	<tr>
		<td>${i.index+1}</td>
		<td>${platsPret.label}</td>
		<td>${platsPret.lieu}</td>
		<td><a href="${baseURL}/detailsOrders/changeToPret?idDetailOrder=${platsPret.id}">livrer</a></td>
	</tr>
    </c:forEach>
</table>
</body>
</html>