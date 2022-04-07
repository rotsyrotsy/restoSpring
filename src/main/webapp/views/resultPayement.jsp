<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="baseURL" value="${scheme}://${serverName}:${serverPort}"/>


<!-- Title Page -->
<section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-image: url(${baseURL}/views/images/bg-title-page-01.jpg);">
    <h2 class="tit6 t-center">
        Pato Menu
    </h2>
</section>
<div class="section-signup bg1-pattern p-t-85 p-b-85">
	${message }
        <h1>Payement entre ${date1 } et ${date2 }</h1>
    <div class="col-md-3"></div>
	
    <h4>Payement par chèque : ${sumCheque } Ar</h4>
    <table class="table">
        <thead>
            <tr>
                <th>#</th>
                <th>Valeur (Ar)</th>
            </tr>
        </thead>
       <tbody>
              <c:forEach  items="${cheque}" var="che" varStatus="i">
            <tr>
                <td>${i.index+1}</td>
                <td>${che.idOrder}</td>
            </tr>
            </c:forEach>
      		<tr>
      			<td>Somme</td>
      			<td>${sumCheque}</td>
      		</tr>
        </tbody>
    </table>
    <h4>Payement par espèce :  ${sumEspece } Ar</h4>
    <table class="table">
        <thead>
            <tr>
                <th>#</th>
                <th>Valeur (Ar)</th>
            </tr>
        </thead>
       <tbody>
              <c:forEach  items="${espece}" var="esp" varStatus="i">
            <tr>
                <td>${i.index+1}</td>
                <td>${esp.idOrder}</td>
            </tr>
            </c:forEach>
      		<tr>
      			<td>Somme</td>
      			<td>${sumEspece}</td>
      		</tr>
        </tbody>
    </table>
    
	<h2>Somme total des payements: ${sumTotal} Ar</h2>
    <div class="col-md-3"></div>
</div>



