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
    <form class="flex-c-m flex-w flex-col-c-m-lg p-l-5 p-r-5" action="">
        <span class="txt5 m-10">
            Avoir l'addition d'une table
        </span>

        <div class="wrap-input-signup size17 bo2 bo-rad-10 bgwhite pos-relative txt10 m-10">
            <select class="selection-1 select2-hidden-accessible" tabindex="-1" aria-hidden="true" name="serveur">
               
                <option value="">Choisir...</option>
                <c:forEach  items="${listTable}" var ="table">
					<option value="${table.idOrder}">${table.label}</option>
            </c:forEach>


            </select>
        </div>
        
       
        <!-- Button3 -->
        <button type="submit" class="btn3 flex-c-m size18 txt11 trans-0-4 m-10">
            Valider
        </button>
    </form>
    
    <form class="flex-c-m flex-w flex-col-c-m-lg p-l-5 p-r-5" action="">
        <span class="txt5 m-10">
            Faire la commande d'une table
        </span>

        <div class="wrap-input-signup size17 bo2 bo-rad-10 bgwhite pos-relative txt10 m-10">
            <select class="selection-1 select2-hidden-accessible" tabindex="-1" aria-hidden="true" name="serveur">
               
                <option value="">Choisir...</option>
                <c:forEach  items="${listTable}" var ="table">
					<option value="${table.idOrder}">${table.label}</option>
            </c:forEach>


            </select>
        </div>
        
       
        <!-- Button3 -->
        <button type="submit" class="btn3 flex-c-m size18 txt11 trans-0-4 m-10">
            Valider
        </button>
    </form>
</div>



