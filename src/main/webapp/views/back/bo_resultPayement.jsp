<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="baseURL" value="${scheme}://${serverName}:${serverPort}"/>


    <div class="pagetitle">
      <h1>Total des montants gagnés</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${baseURL }/payement">Formulaire</a></li>
          <li class="breadcrumb-item">Résultats</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

	<div>
		<p>${message }</p>
	    <h1>Payement entre ${date1 } et ${date2 }</h1>
	</div>
	
    <section class="section">
      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Payement par chèque : ${sumCheque } Ar</h5>

                
              <table class="table">
                <thead>
                  <tr>
	                  <th scope="col">#</th>
	                  <th scope="col">Valeur (Ar)</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach  items="${cheque}" var="che" varStatus="i">
	                <tr>
		                <th scope="row">${i.index+1}</th>
		                <td>${che.idOrder}</td>
	                <tr>
	             </c:forEach>
	             <tr>
	                <td>Somme</td>
	                <td>${sumCheque}</td>
	             </tr>
                </tbody>
              </table>
            </div>
          </div>

        </div>
      </div>
      
    	<div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Payement par espèce :  ${sumEspece } Ar</h5>

              
              <table class="table">
                <thead>
                  <tr>
	                  <th scope="col">#</th>
	                  <th scope="col">Valeur (Ar)</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach  items="${espece}" var="esp" varStatus="i">
	                <tr>
		                <th scope="row">${i.index+1}</th>
		                <td>${esp.idOrder}</td>
	                <tr>
	             </c:forEach>
	             <tr>
	                <td>Somme</td>
	                <td>${sumEspece}</td>
	             </tr>
                </tbody>
              </table>
            </div>
          </div>

        </div>
      </div>  
      <h2>Somme total des payements: ${sumTotal} Ar</h2>
    </section>
	
	