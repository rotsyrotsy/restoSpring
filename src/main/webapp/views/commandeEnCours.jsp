 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="baseURL" value="${scheme}://${serverName}:${serverPort}"/>
	<!-- Title Page -->
	<section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-image: url(${baseURL}/views/images/bg-title-page-01.jpg);">
		<h2 class="tit6 t-center">
			Commande en cours
		</h2>
	</section>


	<section class="section-lunch bgwhite">
		<h1>Table ${sessionScope.sessionOrder.numero} le  ${sessionScope.sessionOrder.date} </h1>
		<div class="container">
			<div class="row p-t-108 p-b-70">
				<c:forEach items="${liste}" var ="plat">
					<div class="col-md-8 col-lg-6 m-l-r-auto">
					<!-- Block3 -->
						<div class="blo3 flex-w flex-col-l-sm m-b-30">
							<div class="pic-blo3 size20 bo-rad-10 hov-img-zoom m-r-28">
								<a href="#"><img src="${baseURL}/views/images/${plat.image}" alt="IMG-MENU"></a>
							</div>
	
							<div class="text-blo3 size21 flex-col-l-m">
								<a href="#" class="txt21 m-b-3">
									${plat.label}
								</a>
	
								<span class="txt22 m-t-20">
									${plat.montant}
								</span>
							</div>
                                                             
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>



