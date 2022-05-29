<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="baseURL" value="${scheme}://${serverName}:${serverPort}"/>


<!-- Title Page -->
<section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-image: url(${baseURL}/views/images/bg-title-page-03.jpg);">
    <h2 class="tit6 t-center">
        Reglement des factures
    </h2>
</section>
<div class="section-signup bg1-pattern p-t-85 p-b-85">
	<div class="t-center">
		<span class="tit2 t-center">
			Additions non encore payées
		</span>
	</div>
	<div class="container">
	<div class="row">
	    <div class="col-lg-12 p-b-30">
		    <table class="table">
		        <thead>
		            <tr>
		                <th>#</th>
		                <th>Destination</th>
		                <th>Date</th>
		                <th>Montant total (Ar)</th>
		                <th>Déja payé (Ar)</th>
		                <th>Restant (Ar)</th>
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
    	</div>
    </div>
    </div>
</div>

<c:if test="${sessionScope.sessionOrder != null}">

<c:if test="${addition.size()==0}">
	<div class="alert alert-success" role="alert">
	  Vous avez payer la totalité de votre commande, nous vous remercions.
	</div>
</c:if>

<c:if test="${addition.size()>0}">
<div class="container">
			<div class="row">
				<div class="col-lg-12 p-b-30">
					<div class="t-center">
						<span class="tit2 t-center">
							Paiement
						</span>

						<h3 class="tit3 t-center m-b-35 m-t-2">
							<p>Montant total :${addition[0].total} Ar</p>
							<p>Restant à payer :${addition[0].restant} Ar</p>
						</h3>
					</div>

					<form class="wrap-form-reservation size22 m-l-r-auto" action="${baseURL }/payement/insert" method="post">
						<div class="row">

							<div class="col-md-12">
								<!-- Time -->
								<span class="txt9">
									Mode de paie
								</span>

								<div class="wrap-inputtime size12 bo2 bo-rad-10 m-t-3 m-b-23">
									<!-- Select2 -->
									<select class="selection-1 select2-hidden-accessible" name="type" tabindex="-1" aria-hidden="true">
										<option value="espece">espece</option>
										<option value="cheque">cheque</option>
									</select>
								</div>
							</div>

						</div>

						<div class="row">
							<div class="col-md-12">
								<!-- Name -->
								<span class="txt9">
									Valeur
								</span>

								<div class="wrap-inputname size12 bo2 bo-rad-10 m-t-3 m-b-23">
									<input class="bo-rad-10 sizefull txt10 p-l-20" type="number" name="valeur" placeholder="Valeur">
								</div>
							</div>

						
						</div>

						<div class="wrap-btn-booking flex-c-m m-t-6">
							<!-- Button3 -->
							<button type="submit" class="btn3 flex-c-m size13 txt11 trans-0-4">
								Payer
							</button>
						</div>
					</form>
				</div>
			</div>

		</div>
</c:if>
</c:if>

