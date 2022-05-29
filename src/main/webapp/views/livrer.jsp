<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="baseURL" value="${scheme}://${serverName}:${serverPort}"/>
<!-- Title Page -->
<section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-image: url(${baseURL}/views/images/bg-title-page-01.jpg);">
    <h2 class="tit6 t-center">
        Se faire livré
    </h2>
</section>
<div class="section-signup bg1-pattern p-t-85 p-b-85">
    <form class="flex-c-m flex-w flex-col-c-m-lg p-l-7 p-r-7" action="${baseURL}/order/insertLivraison" method="post">
        <span class="txt5 m-10">
            Saisir lieu de livraison:
        </span>
		<div class="row">
		<div class="col-md-5" style="margin-top:3%;">
			<input class="form-control" name="lieuLivraison" />
       </div>
        <!-- Button3 -->
		<div class="col-md-4">
	        <button type="submit" class="btn3 flex-c-m size18 txt11 trans-0-4 m-10">
	            Valider
	        </button>
        </div>
        </div>
    </form>
</div>



