 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="baseURL" value="${scheme}://${serverName}:${serverPort}"/>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Home</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="${baseURL}/views/images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${baseURL}/views/assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${baseURL}/views/assets/vendor/bootstrap-icons/bootstrap-icons.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${baseURL}/views/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${baseURL}/views/fonts/themify/themify-icons.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${baseURL}/views/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${baseURL}/views/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${baseURL}/views/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${baseURL}/views/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${baseURL}/views/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${baseURL}/views/vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${baseURL}/views/vendor/lightbox2/css/lightbox.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${baseURL}/views/css/util.css">
	<link rel="stylesheet" type="text/css" href="${baseURL}/views/css/main.css">
	
<!--===============================================================================================-->
</head>
<body class="animsition">

	<!-- Header -->
	<header>
		<!-- Header desktop -->
		<div class="wrap-menu-header gradient1 trans-0-4">
			<div class="container-fluid">
				<div class="wrap_header trans-0-3" style="margin-top:1%;">
					<!-- Logo -->
					<div class="logo" style="margin-top:1%;">
						<a href="#">
							<img src="${baseURL}/views/images/icons/logo.png" alt="IMG-LOGO" data-logofixed="${baseURL}/views/images/icons/logo2.png">
						</a>
					</div>

					<!-- Menu -->
					<div class="wrap_menu p-l-45 p-l-0-xl">
						<nav class="menu">
							<ul class="main_menu">
							
								
								<li>
									<a href="${baseURL}/plats">Menu</a>
								</li>
								
								<li>
									<a href="${baseURL}/tables">Prendre commande</a>
								</li>
								
								<li>
									<a href="${baseURL}/livrer">Se faire livr�</a>
								</li>
								
								<li>
									<a href="${baseURL }/order/additionNonPaye">Additions non payees</a>
								</li>
								
								<c:if test="${sessionScope.sessionOrder != null}">
									<li>
										<a href="${baseURL }/order/commandeEnCours">Commande en cours</a>
									</li>
									
								</c:if>
								
							</ul>
						</nav>
					</div>
				
            
            
					<!-- Social -->
					<div class="social flex-w flex-l-m p-r-20">

						<button class="btn-show-sidebar m-l-33 trans-0-4" style="margin-left:20%;"></button>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Sidebar -->
	<aside class="sidebar trans-0-4">
		<!-- Button Hide sidebar -->
		<button class="btn-hide-sidebar ti-close color0-hov trans-0-4"></button>

		<!-- - -->
		
		<!-- - -->
		<div class="gallery-sidebar t-center p-l-60 p-r-60 p-b-40">
			<!-- - -->
			<h4 class="txt20 m-b-33">
				OPTIONS
			</h4>
			<ul>
				<li>
					<a href="${baseURL}/plats">Menu</a>
				</li>
				<li>
					<a href="${baseURL}/tables">Prendre commande</a>
				</li>
				<li>
					<a href="${baseURL }/order/additionNonPaye">Additions non payees</a>
				</li>
				<c:if test="${sessionScope.sessionOrder != null}">
				<li>
					<a href="${baseURL }/order/commandeEnCours">Commande en cours</a>
				</li>
				</c:if>
			</ul>
			<!-- Gallery -->
			<div class="wrap-gallery-sidebar flex-w">
				
			</div>
		</div>
	</aside>

	
	<!-- Contenu -->
	
    <jsp:include page="${view}.jsp" />




	<!-- Footer -->
	<footer class="bg1">
		<div class="container p-t-40 p-b-70">
			<div class="row">
				<div class="col-sm-6 col-md-6 p-t-50">
					<!-- - -->
					<h4 class="txt13 m-b-33">
						Contactez-nous
					</h4>

					<ul class="m-b-70">
						<li class="txt14 m-b-14">
							<i class="fa fa-map-marker fs-16 dis-inline-block size19" aria-hidden="true"></i>
							Antananarivo 101, Andoharanofotsy
						</li>

						<li class="txt14 m-b-14">
							<i class="fa fa-phone fs-16 dis-inline-block size19" aria-hidden="true"></i>
							(+261) 00 000 00  
						</li>

						<li class="txt14 m-b-14">
							<i class="fa fa-envelope fs-13 dis-inline-block size19" aria-hidden="true"></i>
							pato@site.com
						</li>
					</ul>

					<!-- - -->
					<h4 class="txt13 m-b-32">
						Ouverture
					</h4>

					<ul>
						<li class="txt14">
							10:00 AM à 11:00 PM
						</li>

						<li class="txt14">
							Tous les jours
						</li>
					</ul>
				</div>

				

				<div class="col-sm-6 col-md-6 p-t-50">
					<!-- - -->
					<h4 class="txt13 m-b-38">
						Gallerie
					</h4>

					<!-- Gallery footer -->
					<div class="wrap-gallery-footer flex-w">
						<a class="item-gallery-footer wrap-pic-w" href="${baseURL}/views/images/photo-gallery-01.jpg" data-lightbox="gallery-footer">
							<img src="${baseURL}/views/images/photo-gallery-thumb-01.jpg" alt="GALLERY">
						</a>

						<a class="item-gallery-footer wrap-pic-w" href="${baseURL}/views/images/photo-gallery-02.jpg" data-lightbox="gallery-footer">
							<img src="${baseURL}/views/images/photo-gallery-thumb-02.jpg" alt="GALLERY">
						</a>

						<a class="item-gallery-footer wrap-pic-w" href="${baseURL}/views/images/photo-gallery-03.jpg" data-lightbox="gallery-footer">
							<img src="${baseURL}/views/images/photo-gallery-thumb-03.jpg" alt="GALLERY">
						</a>

						<a class="item-gallery-footer wrap-pic-w" href="${baseURL}/views/images/photo-gallery-04.jpg" data-lightbox="gallery-footer">
							<img src="${baseURL}/views/images/photo-gallery-thumb-04.jpg" alt="GALLERY">
						</a>

						<a class="item-gallery-footer wrap-pic-w" href="${baseURL}/views/images/photo-gallery-05.jpg" data-lightbox="gallery-footer">
							<img src="${baseURL}/views/images/photo-gallery-thumb-05.jpg" alt="GALLERY">
						</a>

						<a class="item-gallery-footer wrap-pic-w" href="${baseURL}/views/images/photo-gallery-06.jpg" data-lightbox="gallery-footer">
							<img src="${baseURL}/views/images/photo-gallery-thumb-06.jpg" alt="GALLERY">
						</a>

						<a class="item-gallery-footer wrap-pic-w" href="${baseURL}/views/images/photo-gallery-07.jpg" data-lightbox="gallery-footer">
							<img src="${baseURL}/views/images/photo-gallery-thumb-07.jpg" alt="GALLERY">
						</a>

						<a class="item-gallery-footer wrap-pic-w" href="${baseURL}/views/images/photo-gallery-08.jpg" data-lightbox="gallery-footer">
							<img src="${baseURL}/views/images/photo-gallery-thumb-08.jpg" alt="GALLERY">
						</a>

						<a class="item-gallery-footer wrap-pic-w" href="${baseURL}/views/images/photo-gallery-09.jpg" data-lightbox="gallery-footer">
							<img src="${baseURL}/views/images/photo-gallery-thumb-09.jpg" alt="GALLERY">
						</a>

						<a class="item-gallery-footer wrap-pic-w" href="${baseURL}/views/images/photo-gallery-10.jpg" data-lightbox="gallery-footer">
							<img src="${baseURL}/views/images/photo-gallery-thumb-10.jpg" alt="GALLERY">
						</a>

						<a class="item-gallery-footer wrap-pic-w" href="${baseURL}/views/images/photo-gallery-11.jpg" data-lightbox="gallery-footer">
							<img src="${baseURL}/views/images/photo-gallery-thumb-11.jpg" alt="GALLERY">
						</a>

						<a class="item-gallery-footer wrap-pic-w" href="${baseURL}/views/images/photo-gallery-12.jpg" data-lightbox="gallery-footer">
							<img src="${baseURL}/views/images/photo-gallery-thumb-12.jpg" alt="GALLERY">
						</a>
					</div>

				</div>
			</div>
		</div>

		<div class="end-footer bg2">
			<div class="container">
				<div class="flex-sb-m flex-w p-t-22 p-b-22">
					<div class="p-t-5 p-b-5">
						<a href="#" class="fs-15 c-white"><i class="fa fa-tripadvisor" aria-hidden="true"></i></a>
						<a href="#" class="fs-15 c-white"><i class="fa fa-facebook m-l-18" aria-hidden="true"></i></a>
						<a href="#" class="fs-15 c-white"><i class="fa fa-twitter m-l-18" aria-hidden="true"></i></a>
					</div>

					<div class="txt17 p-r-20 p-t-5 p-b-5">
						Copyright &copy; 2018 All rights reserved  |  This template is made with <i class="fa fa-heart"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
					</div>
				</div>
			</div>
		</div>
	</footer>


	<!-- Back to top -->
	<div class="btn-back-to-top bg0-hov" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
	</div>

	<!-- Container Selection1 -->
	<div id="dropDownSelect1"></div>

	<!-- Modal Video 01-->
	<div class="modal fade" id="modal-video-01" tabindex="-1" role="dialog" aria-hidden="true">

		<div class="modal-dialog" role="document" data-dismiss="modal">
			<div class="close-mo-video-01 trans-0-4" data-dismiss="modal" aria-label="Close">&times;</div>

			<div class="wrap-video-mo-01">
				<div class="w-full wrap-pic-w op-0-0"><img src="${baseURL}/views/images/icons/video-16-9.jpg" alt="IMG"></div>
				<div class="video-mo-01">
					<iframe src="https://www.youtube.com/embed/5k1hSu2gdKE?rel=0&amp;showinfo=0" allowfullscreen></iframe>
				</div>
			</div>
		</div>
	</div>



<!--===============================================================================================-->
	<script type="text/javascript" src="${baseURL}/views/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${baseURL}/views/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${baseURL}/views/vendor/bootstrap/js/popper.js"></script>
	<script type="text/javascript" src="${baseURL}/views/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${baseURL}/views/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${baseURL}/views/vendor/daterangepicker/moment.min.js"></script>
	<script type="text/javascript" src="${baseURL}/views/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${baseURL}/views/vendor/slick/slick.min.js"></script>
	<script type="text/javascript" src="${baseURL}/views/js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${baseURL}/views/vendor/parallax100/parallax100.js"></script>
	<script type="text/javascript">
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${baseURL}/views/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${baseURL}/views/vendor/lightbox2/js/lightbox.min.js"></script>
<!--===============================================================================================-->
	<script src="${baseURL}/views/js/main.js"></script>

</body>
</html>
