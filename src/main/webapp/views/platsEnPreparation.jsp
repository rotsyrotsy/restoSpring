 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="baseURL" value="${scheme}://${serverName}:${serverPort}"/>
	<!-- Title Page -->
	<section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-image: url(${baseURL}/views/images/bg-title-page-01.jpg);">
		<h2 class="tit6 t-center">
			Tous les plats validés
		</h2>
	</section>

	<section class="section-lunch bgwhite">
		<div class="container">
			<div class="row p-t-108 p-b-70">
				<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>Nom</th>
						<th></th>
					</tr>
					</thead>
					<tbody>
					<c:forEach  items="${platsEnPreparation}" var ="plat" varStatus="i">
					<tr>
						<td>${i.index+1}</td>
						<td>${plat.label}</td>
						<td><a href="${baseURL}/detailsOrders/changeToPret?idDetailOrder=${plat.id}" class="btn3 flex-c-m size30 txt11 trans-0-4 m-10">terminer</a></td>
					</tr>
				    </c:forEach>
					</tbody>
					
				</table>
			</div>
		</div>
	</section>



