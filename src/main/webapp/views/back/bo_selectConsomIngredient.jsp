<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="baseURL" value="${scheme}://${serverName}:${serverPort}"/>


    <div class="pagetitle">
      <h1>Consommation des ingrédients</h1>
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
              <h5 class="card-title">Avoir la consommation entre deux dates</h5>

              <!-- General Form Elements -->
              <form action="${baseURL}/ingredients/resultDate" method="get">
                <div class="row mb-3">
                  <label for="inputDate" class="col-sm-2 col-form-label">Date minimum</label>
                  <div class="col-sm-10">
                    <input type="date" name="date1" class="form-control">
                  </div>
                </div>
                
                <div class="row mb-3">
                  <label for="inputDate" class="col-sm-2 col-form-label">Date maximum</label>
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
