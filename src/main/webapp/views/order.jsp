 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="baseURL" value="${scheme}://${serverName}:${serverPort}"/>

<section class="section-mainmenu p-t-110 p-b-70 bg1-pattern">
	<div class="container">
		<div class="row">
			<form action="${baseURL}/order/insert" method="post">
				<input type="text" name="idTable">
				<input type="text" name="idServeur">
				<input type="submit" value="insert">
			</form>
		</div>
	</div>
</section>