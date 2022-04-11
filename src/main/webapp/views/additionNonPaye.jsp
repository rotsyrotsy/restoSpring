<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="baseURL" value="${scheme}://${serverName}:${serverPort}"/>


<!-- Title Page -->
<section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-image: url(${baseURL}/views/images/bg-title-page-01.jpg);">
    <h2 class="tit6 t-center">
        Addition non encore payé
    </h2>
</section>
<div class="section-signup bg1-pattern p-t-85 p-b-85">
	
        <h1>Addition non encore payé</h1>
    <div class="col-md-3"></div>
	
    <table class="table">
        <thead>
            <tr>
                <th>#</th>
                <th>Table</th>
                <th>Date</th>
                <th>Montant total</th>
                <th>Déja payé</th>
                <th>Restant</th>
            </tr>
        </thead>
       <tbody>
              <c:forEach  items="${addition}" var="ad" varStatus="i">
            <tr>
                <td>${i.index+1}</td>
                <td>${ad.numero}</td>
                <td>${ad.date}</td>
                <td>${ad.total}</td>
                <td>${ad.dejapayer}</td>
                <td>${ad.restant}</td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="col-md-3"></div>
</div>



