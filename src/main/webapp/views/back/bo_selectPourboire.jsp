<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="baseURL" value="${scheme}://${serverName}:${serverPort}"/>


    <div class="pagetitle">
      <h1>Pourboire des serveurs</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">Formulaire</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">La liste des pourboires entre deux dates</h5>

              <!-- General Form Elements -->
              <form action="${baseURL}/detailsOrders/choixServeurBase" method="get">
              
              <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">Serveur</label>
                  <div class="col-sm-10">
                    <select name="serveur" class="form-select" aria-label="Default select example">
                    
                      <option selected="">Choisir...</option>
                      
	                     <c:forEach  items="${listServeur}" var ="serveur">
	                      <option value="${serveur.id}">${serveur.nom}</option>
                      	</c:forEach>
                     
                    </select>
                  </div>
                </div>
                
                <div class="row mb-3">
                  <label for="inputDate" class="col-sm-2 col-form-label">Date de début</label>
                  <div class="col-sm-10">
                    <input type="date" name="date1" class="form-control">
                  </div>
                </div>
                
                <div class="row mb-3">
                  <label for="inputDate" class="col-sm-2 col-form-label">Date de fin</label>
                  <div class="col-sm-10">
                    <input type="date" name="date2" class="form-control">
                  </div>
                </div>
                
                <div class="row mb-3">
                  <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">Valider</button>
                  </div>
                </div>

              </form><!-- End General Form Elements -->

            </div>
          </div>

        </div>

        
      </div>
    </section>
