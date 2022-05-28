<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="baseURL" value="${scheme}://${serverName}:${serverPort}"/>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Pato | Admin</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link rel="icon" type="image/png" href="${baseURL}/views/images/icons/favicon.png"/>
  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${baseURL}/views/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${baseURL}/views/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${baseURL}/views/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${baseURL}/views/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="${baseURL}/views/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="${baseURL}/views/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="${baseURL}/views/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${baseURL}/views/assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: NiceAdmin - v2.2.2
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="#" class="logo d-flex align-items-center">
        <img src="${baseURL}/views/images/icons/favicon.png" alt="">
        <span class="text-danger">Pato</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->

        

        
        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="${baseURL}/views/assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2"><c:out value="${sessionScope.sessionAdministrateur.login}" /></span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6><c:out value="${sessionScope.sessionAdministrateur.login}" /></h6>
              <span>Admin</span>
            </li>
            
            
            <li>
              <hr class="dropdown-divider">
            </li>

            

            <li>
              <a class="dropdown-item d-flex align-items-center" href="${baseURL }/admin/logout">
                <i class="bi bi-box-arrow-right"></i>
                <span>Se déconnecter</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-menu-button-wide"></i><span>Ingrédients</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${baseURL }/ingredients/choixDate">
              <i class="bi bi-circle"></i><span>Consommation</span>
            </a>
          </li>
         
          <li>
            <a href="${baseURL}/stock">
              <i class="bi bi-circle"></i><span>Stock</span>
            </a>
          </li>
        </ul>
      </li><!-- End Components Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i><span>Plats</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${baseURL }/plats/prix-plat-base">
              <i class="bi bi-circle"></i><span>Prix de revient</span>
            </a>
          </li>
          
        </ul>
      </li><!-- End Forms Nav -->
	
	<li class="nav-item">
        <a class="nav-link collapsed" href="${baseURL }/order/boAdditionNonPaye">
          <i class="bi bi-grid"></i>
          <span>Additions non payés</span>
        </a>
      </li>
      
		<li class="nav-item">
        <a class="nav-link collapsed" href="${baseURL}/detailsOrders/choixServeurPourboire">
          <i class="bi bi-grid"></i>
          <span>Pourboire des serveurs</span>
        </a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="${baseURL }/payement/select">
          <i class="bi bi-grid"></i>
          <span>Paiement</span>
        </a>
      </li>
      
        <li class="nav-item">
        <a class="nav-link collapsed" href="${baseURL }/detailsOrders/valider">
          <i class="bi bi-grid"></i>
          <span>Plats Valides</span>
        </a>
      </li>
      
        <li class="nav-item">
        <a class="nav-link collapsed" href="${baseURL }/detailsOrders/enPreparation">
          <i class="bi bi-grid"></i>
          <span>Plats en Preparation</span>
        </a>
      </li>
      
        <li class="nav-item">
        <a class="nav-link collapsed" href="${baseURL }/detailsOrders/prets">
          <i class="bi bi-grid"></i>
          <span>Plats Prets</span>
        </a>
      </li>
      
          <li class="nav-item">
        <a class="nav-link collapsed" href="${baseURL }/ingredients/formAchatIngredient">
          <i class="bi bi-grid"></i>
          <span>Acheter Ingredients</span>
        </a>
      </li>
      
      
      

    </ul>

  </aside><!-- End Sidebar-->

  <main id="main" class="main">
    <jsp:include page="${view}.jsp" />
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
      Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="${baseURL}/views/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="${baseURL}/views/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${baseURL}/views/assets/vendor/chart.js/chart.min.js"></script>
  <script src="${baseURL}/views/assets/vendor/echarts/echarts.min.js"></script>
  <script src="${baseURL}/views/assets/vendor/quill/quill.min.js"></script>
  <script src="${baseURL}/views/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="${baseURL}/views/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="${baseURL}/views/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${baseURL}/views/assets/js/main.js"></script>

</body>

</html>