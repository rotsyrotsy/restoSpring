 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="baseURL" value="${scheme}://${serverName}:${serverPort}"/>
	<!-- Title Page -->
	<section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-image: url(${baseURL}/views/images/bg-title-page-02.jpg);">
		<c:if test="${sessionScope.sessionOrder != null && sessionScope.sessionOrder.lieuLivraison == null}">
			<h2 class="tit6 t-center">Table ${sessionScope.sessionOrder.numero} le  ${sessionScope.sessionOrder.date} </h2>
		</c:if>
		<c:if test="${sessionScope.sessionOrder != null && sessionScope.sessionOrder.lieuLivraison != null}">
			<h2 class="tit6 t-center">Livraison numero ${sessionScope.sessionOrder.idOrder} le  ${sessionScope.sessionOrder.date} </h2>
		</c:if>
	</section>


	<section class="section-lunch bgwhite">
		
		
		<div class="container">
			<div class="row">
			
				<c:forEach items="${nonvalide}" var ="plat" varStatus="i">
				<c:if test="${i.index == 0}">
					<div class="t-center">
						<span class="tit2 t-center">
							Commandes non encore validées
						</span>
					</div>
				</c:if>
					<div class="col-md-4 col-lg-4 ">
					<!-- Block3 -->
						<div class="blo3 flex-w flex-col-l-sm m-b-30">
							<div class="pic-blo3 size20 bo-rad-10 hov-img-zoom m-r-28">
								<a href="#"><img src="${baseURL}/views/images/${plat.image}" alt="IMG-MENU"></a>
							</div>
	
							<div class="text-blo3 size21 flex-col-l-m">
								<span class="txt21 m-b-3">
									${plat.label}
								</span>
	
								<span class="txt22 m-t-20">
									${plat.montant}
								</span>
								
								<a href="${baseURL }/detailsOrders/annuler/${plat.idDetailsOrder}" class="btn btn-danger">
									Annuler
								</a>
							</div>                           
						</div>
					</div>
				</c:forEach>
			</div>
				<c:if test="${nonvalide.size()>0}">
				<div>
					<a href="${baseURL}/order/validerCommande"  class="btn3 flex-c-m size30 txt11 trans-0-4 m-10">
	                  Valider la commande
	            	</a>
				</div>
					
            	</c:if>
			
				</hr>
			
			<div class="row">
				<c:forEach items="${valide}" var ="plat" varStatus="i">
				<c:if test="${i.index == 0}">
					<div class="t-center">
						<span class="tit2 t-center">
							Commandes validées et en attente de livraison
						</span>
					</div>
				</c:if>
					<div class="col-md-8 col-lg-6 m-l-r-auto">
					<!-- Block3 -->
						<div class="blo3 flex-w flex-col-l-sm m-b-30">
							<div class="pic-blo3 size20 bo-rad-10 hov-img-zoom m-r-28">
								<a href="#"><img src="${baseURL}/views/images/${plat.image}" alt="IMG-MENU"></a>
							</div>
	
							<div class="text-blo3 size21 flex-col-l-m">
								<span class="txt21 m-b-3">
									${plat.label}
								</span>
	
								<span class="txt22 m-t-20">
									${plat.montant}
								</span>
								
							</div>                           
						</div>
					</div>
				</c:forEach>
			</div>
			</hr>
			<div class="row">
			
				<c:forEach items="${pret}" var ="plat" varStatus="i">
				<c:if test="${i.index == 0}">
					<div class="t-center">
						<span class="tit2 t-center">
							Commandes prêtes à être livrées
						</span>
					</div>
				</c:if>
					<div class="col-md-8 col-lg-6 m-l-r-auto">
					<!-- Block3 -->
						<div class="blo3 flex-w flex-col-l-sm m-b-30">
							<div class="pic-blo3 size20 bo-rad-10 hov-img-zoom m-r-28">
								<a href="#"><img src="${baseURL}/views/images/${plat.image}" alt="IMG-MENU"></a>
							</div>
	
							<div class="text-blo3 size21 flex-col-l-m">
								<span class="txt21 m-b-3">
									${plat.label}
								</span>
	
								<span class="txt22 m-t-20">
									${plat.montant}
								</span>
								
							</div>                           
						</div>
					</div>
				</c:forEach>
				
			</div>
			<c:if test="${pret.size()>0}">
			<div>
					<a href="${baseURL }/order/additionNonPaye" class="btn3 flex-c-m size18 txt11 trans-0-4 m-10">
						Payer
					</a>
			</div>
			</c:if>
		</div>
	</section>



