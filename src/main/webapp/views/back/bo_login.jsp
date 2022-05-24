
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="baseURL" value="${scheme}://${serverName}:${serverPort}"/>
<!DOCTYPE html>
<html lang="en" class="h-100">


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Pato | Admin</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${baseURL}/views/assets/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="${baseURL}/views/css/bo_style.css" rel="stylesheet">
    
</head>

<body class="h-100">
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <div class="login-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-md-5">
                    <div class="form-input-content">
                        <div class="card card-login">
                            <div class="card-header">
                                <div class="nav-header position-relative  text-center w-100">
                                    <div class="brand-logo">
                                        <a href="index.html">
                                            <b class="logo-abbr">P</b>
                                            <span class="brand-title"><b>Pato</b></span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center my-3">
                                <img class="rounded-circle" src="${baseURL}/views/assets/images/avatar/11.png" width="80" height="80" alt="">
                            </div>
                            <div class="card-body">
                                <form action="${baseURL}/admin/login" method="post">
                                    <div class="form-group mb-4">
                                        <input type="text" class="form-control rounded-0 bg-transparent" placeholder="Email" name="login">
                                    </div>
                                    <div class="form-group mb-4">
                                        <input type="password" class="form-control rounded-0 bg-transparent" placeholder="Mot de passe" name="mdp">
                                    </div>
                                    <button class="btn btn-primary btn-block border-0" type="submit">Se connecter</button>
                                </form>
                                <c:if test="${erreur != null}">
				                    <div class="alert alert-danger" role="alert">
									  ${erreur}
									</div>
								</c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- #/ container -->
    <!-- Common JS -->
    <script src="${baseURL}/views/assets/plugins/common/common.min.js"></script>
    <!-- Custom script -->
    <script src="${baseURL}/views/js/custom.min.js"></script>
    <script src="${baseURL}/views/js/settings.js"></script>
    <script src="${baseURL}/views/js/quixnav.js"></script>
</body>


</html>