<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="baseURL" value="${scheme}://${serverName}:${serverPort}"/>


<!-- Title Page -->
<section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-image: url(${baseURL}/views/images/bg-title-page-01.jpg);">
    <h2 class="tit6 t-center">
        Les ingrédients en stock
    </h2>
</section>
<div class="section-signup bg1-pattern p-t-85 p-b-85">
        <h1>Les ingrédients actuels</h1>
        
    <div class="col-md-3"></div>
    <table class="table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Quantite</th>
            </tr>
        </thead>
        <tbody>
              <c:forEach  items="${ingredients}" var="ingredient" varStatus="i">
            <tr>
                <td>${i.index+1}</td>
                <td>${ingredient.nomIngredient}</td>
                <td>${ingredient.qte} ${ingredient.unite}</td>
            </tr>
            </c:forEach>
           
        </tbody>
    </table>
    <div class="col-md-3"></div>
</div>



