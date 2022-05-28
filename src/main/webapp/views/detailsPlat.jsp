<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="baseURL" value="${scheme}://${serverName}:${serverPort}"/>


<!-- Title Page -->
<section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-image: url(${baseURL}/views/images/bg-title-page-02.jpg);">
    <h2 class="tit6 t-center">
        Ingrédients du plat
    </h2>
</section>
<div class="section-signup bg1-pattern p-t-85 p-b-85">
	<div class="t-center">
		<span class="tit2 t-center">
			Les ingrédients composant le ${platIngredient[0].label}
		</span>
	</div>
	<div class="container">
	<div class="row">
	    <div class="col-lg-12 p-b-30">
		    <table class="table">
		        <thead>
		            <tr>
		                <th></th>
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
		          
		        </tbody>
		    </table>
		   </div>
	  </div>
	  </div>
</div>



