<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="baseURL" value="${scheme}://${serverName}:${serverPort}"/>
<!-- Title Page -->
<section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-image: url(${baseURL}/views/images/bg-title-page-01.jpg);">
    <h2 class="tit6 t-center">
        Prendre une commande
    </h2>
</section>
<div class="section-signup bg1-pattern p-t-85 p-b-85">
	<c:if test="${sessionScope.sessionOrder != null}">
			<center>
				<a href="${baseURL}/order/logoutIdOrder" class="btn3 flex-c-m size4 txt11 trans-0-4 m-10">
					 Prendre une autre commande
				</a>
			</center>
	</c:if>
    <form class="flex-c-m flex-w flex-col-c-m-lg p-l-5 p-r-5" action="${baseURL}/order" method="get">
        <span class="txt5 m-10">
            Reprendre la commande d'une table
        </span>

        <div class="wrap-input-signup size17 bo2 bo-rad-10 bgwhite pos-relative txt10 m-10">
            <select class="selection-1 select2-hidden-accessible" tabindex="-1" aria-hidden="true" name="idTable">
               
                <option value="">Table...</option>
               <c:forEach  items="${listTable}" var ="table">
					<option value="${table.id}">${table.numero}</option>
            </c:forEach>

            </select>
        </div>
        
       
        <!-- Button3 -->
        <button type="submit" class="btn3 flex-c-m size18 txt11 trans-0-4 m-10">
            Valider
        </button>
        
        <c:if test="${erreur != null}">
			<div class="alert alert-danger" role="alert">
			  ${erreur }
			</div>
		</c:if>
    </form>
    
    <form class="flex-c-m flex-w flex-col-c-m-lg p-l-7 p-r-7" action="${baseURL}/order/insert" method="post">
        <span class="txt5 m-10">
            Prendre une nouvelle commande
        </span>
		<div class="row">
	        <div class="col-md-5">
	            <p>
	            	<select class="selection-1 select2-hidden-accessible" tabindex="-1" aria-hidden="true" name="idTable">
	               
	                	<option value="">Table</option>
	                	<c:forEach  items="${listTable}" var ="table">
							<option value="${table.id}">${table.numero}</option>
	            		</c:forEach>
				  	</select>
				</p>
	       	</div>
	        <div class="col-md-7">
	            <p>
	            	<select class="selection-1 select2-hidden-accessible" tabindex="-1" aria-hidden="true" name="idServeur">
	        	        <option value="">Serveur</option>
	    	            <c:forEach  items="${listServeur}" var ="serveur">
							<option value="${serveur.id}">${serveur.nom}</option>
	            		</c:forEach>
	            	</select>
	          	</p>
	      	</div>
        </div>
       
        <!-- Button3 -->
        <button type="submit" class="btn3 flex-c-m size18 txt11 trans-0-4 m-10">
            Valider
        </button>
    </form>
</div>



