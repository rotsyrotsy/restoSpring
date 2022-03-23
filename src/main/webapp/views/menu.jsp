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
											Sed fermentum eros vitae eros
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
			<div class="row p-t-108 p-b-70">
				<c:forEach begin="0" end="${(listPlat.size()/2)-1}" varStatus="i">
					<div class="col-md-8 col-lg-6 m-l-r-auto">
					<!-- Block3 -->
						<div class="blo3 flex-w flex-col-l-sm m-b-30">
							<div class="pic-blo3 size20 bo-rad-10 hov-img-zoom m-r-28">
								<a href="#"><img src="${baseURL}/views/images/lunch-01.jpg" alt="IMG-MENU"></a>
							</div>
	
							<div class="text-blo3 size21 flex-col-l-m">
								<a href="#" class="txt21 m-b-3">
									${listPlat[i.index].label}
								</a>
	
								<span class="txt23">
									${listPlat[i.index].categorie}
								</span>
	
								<span class="txt22 m-t-20">
									${listPlat[i.index].price}
								</span>
							</div>
						</div>
					</div>
				</c:forEach>
	
				
				<c:forEach begin="${listPlat.size()/2}" end="${listPlat.size()}" varStatus="i">
					<div class="col-md-8 col-lg-6 m-l-r-auto">
						<!-- Block3 -->
						<div class="blo3 flex-w flex-col-l-sm m-b-30">
							<div class="pic-blo3 size20 bo-rad-10 hov-img-zoom m-r-28">
								<a href="#"><img src="${baseURL}/views/images/lunch-02.jpg" alt="IMG-MENU"></a>
							</div>
	
							<div class="text-blo3 size21 flex-col-l-m">
								<a href="#" class="txt21 m-b-3">
									${listPlat[i.index].label}
								</a>
	
								<span class="txt23">
									${listPlat[i.index].categorie}
								</span>
	
								<span class="txt22 m-t-20">
									${listPlat[i.index].price}
								</span>
							</div>
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
				Tri par cat�gorie
			</span>

			<div class="wrap-input-signup size17 bo2 bo-rad-10 bgwhite pos-relative txt10 m-10">
				<select class="bo-rad-10 sizefull txt10 p-l-20" name="categorie">
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
