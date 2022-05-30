 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="baseURL" value="${scheme}://${serverName}:${serverPort}"/>

	<section class="section-slide">
		<div class="wrap-slick1">
			<div class="slick1">
				<div class="item-slick1 item1-slick1" style="background-image: url(${baseURL}/views/images/slide1-01.jpg);">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<c:if test="${sessionScope.sessionOrder == null }">
							<span class="caption1-slide1 txt1 t-center animated visible-false m-b-15" data-appear="fadeInDown">
								Bienvenue chez
							</span>
	
							<h2 class="caption2-slide1 tit1 t-center animated visible-false m-b-37" data-appear="fadeInUp">
								Pato 
							</h2>
	
							<div class="wrap-btn-slide1 animated visible-false" data-appear="zoomIn">
								<!-- Button1 -->
								<a href="#" class="btn1 flex-c-m size1 txt3 trans-0-4">
									 Menu
								</a>
							</div>
						</c:if>
						<c:if test="${sessionScope.sessionOrder != null && sessionScope.sessionOrder.lieuLivraison == null}">
							<span class="caption1-slide1 txt1 t-center animated visible-false m-b-15" data-appear="fadeInDown">
								Commande de la table ${sessionScope.sessionOrder.numero}
							</span>
							<p style="font-size: 20px; color:white;">
								Date et heure: ${sessionScope.sessionOrder.date}
							</p>
						</c:if>
						
						<c:if test="${sessionScope.sessionOrder != null && sessionScope.sessionOrder.lieuLivraison != null}">
							<span class="caption1-slide1 txt1 t-center animated visible-false m-b-15" data-appear="fadeInDown">
								Commande de la livraison numero ${sessionScope.sessionOrder.idOrder}
							</span>
							<p style="font-size: 20px; color:white;">
								Date et heure: ${sessionScope.sessionOrder.date}
							</p>
						</c:if>
					</div>
				</div>

				<div class="item-slick1 item2-slick1" style="background-image: url(${baseURL}/views/images/master-slides-02.jpg);">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<span class="caption1-slide1 txt1 t-center animated visible-false m-b-15" data-appear="rollIn">
							Bienvenue chez
						</span>

						<h2 class="caption2-slide1 tit1 t-center animated visible-false m-b-37" data-appear="lightSpeedIn">
							Pato 
						</h2>

						<div class="wrap-btn-slide1 animated visible-false" data-appear="slideInUp">
							<!-- Button1 -->
							<a href="#" class="btn1 flex-c-m size1 txt3 trans-0-4">
								 Menu
							</a>
						</div>
					</div>
				</div>

				<div class="item-slick1 item3-slick1" style="background-image: url(${baseURL}/views/images/master-slides-01.jpg);">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<span class="caption1-slide1 txt1 t-center animated visible-false m-b-15" data-appear="rotateInDownLeft">
							Bienvenue chez
						</span>

						<h2 class="caption2-slide1 tit1 t-center animated visible-false m-b-37" data-appear="rotateInUpRight">
							Pato 
						</h2>

						<div class="wrap-btn-slide1 animated visible-false" data-appear="rotateIn">
							<!-- Button1 -->
							<a href="#" class="btn1 flex-c-m size1 txt3 trans-0-4">
								Menu
							</a>
						</div>
					</div>
				</div>

			</div>

			<div class="wrap-slick1-dots"></div>
		</div>
	</section>



	<c:if test="${misyCat != null}">
	<!-- Main menu -->
	<section class="section-mainmenu p-t-110 p-b-70 bg1-pattern">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-lg-6 p-r-35 p-r-15-lg m-l-r-auto">
					<div class="wrap-item-mainmenu p-b-22">
							<h3 class="tit-mainmenu tit10 p-b-25">
								${listPlat[0].categorie}
							</h3>
								
								<c:forEach  items="${listPlat}" var ="plat">
									<div class="item-mainmenu m-b-36">
										<div class="flex-w flex-b m-b-3">
											<a href="#" class="name-item-mainmenu txt21">
												${plat.label}
											</a>
			
											<div class="line-item-mainmenu bg3-pattern"></div>
			
											<div class="price-item-mainmenu txt22">
												${plat.price} Ar
											</div>
										</div>
			
										<span class="info-item-mainmenu txt23">
											Goûtez nos meilleurs plats
										</span>
									</div>
								
							    </c:forEach>
						</div>
			    </div>
			</div>
		</div>
	</section>
	</c:if>
	<c:if test="${misyCat == null}">
	<section class="section-lunch bgwhite">

		<div class="container">
		
		<c:if test="${succes != null}">
		<div>
			<div class="alert alert-success" role="alert">
			  ${succes }
			</div>
			
		</div>
                 </c:if>
                        
                 <c:if test="${error != null}">
		<div>
			<div class="alert alert-danger" role="alert">
			  ${error }
			</div>
			
		</div>
                   </c:if>
			
		
		
			<div class="row p-t-108 p-b-70">
				<c:forEach items="${listPlat}" var ="plat">
					<div class="col-md-4 col-lg-4 ">
					<!-- Block3 -->
						<div class="blo3 flex-w flex-col-l-sm m-b-30">
							<div class="pic-blo3 size20 bo-rad-10 hov-img-zoom m-r-28">
								<a class="wrap-pic-w" href="${baseURL}/views/images/${plat.image}" data-lightbox="gallery-footer">
									<img src="${baseURL}/views/images/${plat.image}" alt="IMG-MENU">
								</a>
							</div>
	
							<div class="text-blo3 size21 flex-col-l-m">
								<a href="#" class="txt21 m-b-3">
									${plat.label}
								</a>
	
								<span class="txt23">
									${plat.categorie}
								</span>
	
								<span class="txt22 m-t-20">
									${plat.price} Ar
								</span>
								
								<c:if test="${plat.ruptureDeStock == 1}">
									<span class="txt21  m-b-3 text-danger font-weight-bold" >
										En rupture de stock
									</span>
								</c:if>
								
								
							</div>
							<c:if test="${sessionScope.sessionOrder != null}">
								<a href="${baseURL}/detailsOrders/insert?idPlat=${plat.id}"  class="btn3 flex-c-m size18 txt11 trans-0-4 m-10" >
	                                  Commander
	                            </a>
	                        </c:if>
                                                                
                             <a href="${baseURL}/plats/getPlatIngredient?idPlat=${plat.id}"  class="btn3 flex-c-m size18 txt11 trans-0-4 m-10">
                                  Voir Ingredient
                             </a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	</c:if>

	<!-- Sign up -->
	<div class="section-signup bg1-pattern p-t-85 p-b-85">
		<form class="flex-c-m flex-w flex-col-c-m-lg p-l-5 p-r-5" action="${baseURL}/plats">
			<span class="txt5 m-10">
				Tri par catégorie
			</span>

			<div class="wrap-input-signup size17 bo2 bo-rad-10 bgwhite pos-relative txt10 m-10">
				<select class="selection-1 select2-hidden-accessible" tabindex="-1" aria-hidden="true" name="categorie">
                    <option value="tous">Tous</option>
				<c:forEach  items="${listCategorie}" var ="categorie">
					<option value="${categorie.label}">${categorie.label}</option>
				</c:forEach>
				</select>
			</div>

			<!-- Button3 -->
			<button type="submit" class="btn3 flex-c-m size18 txt11 trans-0-4 m-10">
				Valider
			</button>
		</form>
	</div>

