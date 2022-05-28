
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="baseURL" value="${scheme}://${serverName}:${serverPort}"/>


    <div class="pagetitle">
      <h1>Prix de revient par plat</h1>
     
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row align-items-top">
          <!-- Default Card -->
          
         
<c:forEach  items="${prixDeRevientPlat}" var ="plat">
          <!-- Card with an image on top -->
          <div class="col-lg-4">
          
          <div class="card">
            <img src="${baseURL}/views/images/${plat.image}" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title">${plat.label} </h5>
              <p class="card-text">Prix vente: ${plat.prixVente} Ar</p>
              <p class="card-text">Prix de revient: ${plat.prixDeRevient} Ar</p>
              <p class="card-text">Pourcentage de revenue: ${plat.pourcentage} %</p>
            </div>
          </div>
          </div>
</c:forEach>
          
        
          

      </div>
    </section>
