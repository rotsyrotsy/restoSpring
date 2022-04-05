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
        <h1>Detail Plat ${platIngredient[0].nomPlat}</h1>
    <div class="col-md-3"></div>
    <table class="table">
        <thead>
            <tr>
                <th>#</th>
                <th>label</th>
                <th>Quantite</th>
            </tr>
        </thead>
        <tbody>
              <c:forEach  items="${platIngredient}" var="platIng" varStatus="i">
            <tr>
                <td>${i.index+1}</td>
                <td>${platIng.nomIngredient}</td>
                <td>${platIng.quantity} ${platIng.unite}</td>
            </tr>
            </c:forEach>
           <tr>
                <td></td>
                <td></td>
                <td></td>
               
            </tr>
            
        </tbody>
    </table>
    <div class="col-md-3"></div>
</div>



