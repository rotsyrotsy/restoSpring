<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="baseURL" value="${scheme}://${serverName}:${serverPort}"/>


    <div class="pagetitle">
      <h1>Acheter Ingredients</h1>
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
                
                   <c:if test="${message != null}">
		<div>
			<div class="alert alert-success" role="alert">
			  ${message }
			</div>
			
		</div>
                   </c:if>
                
                
              <h5 class="card-title">Entrer les informations concernant l'achat</h5>

              <!-- General Form Elements -->
              <form action="${baseURL}/ingredients/achat" method="get">
              
              <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">Nom Ingredient</label>
                  <div class="col-sm-10">
                    <select name="idIng" class="form-select" aria-label="Default select example">
                    
                      <option selected="">Choisir...</option>
                      
	                     <c:forEach  items="${listIng}" var ="ing">
	                      <option value="${ing.id}">${ing.label}</option>
                      	</c:forEach>
                     
                    </select>
                  </div>
                </div>
                
                <div class="row mb-3">
                  <label for="inputDate" class="col-sm-2 col-form-label">Quantité</label>
                  <div class="col-sm-10">
                    <input type="number" name="qte" class="form-control">
                  </div>
                </div>
                
                <div class="row mb-3">
                  <label for="inputDate" class="col-sm-2 col-form-label">Date</label>
                  <div class="col-sm-10">
                    <input type="date" name="date" class="form-control">
                  </div>
                </div>
                  
                  
                
                <div class="row mb-3">
                  <div class="col-sm-10">
                    <button type="submit" class="btn btn-success">Acheter</button>
                  </div>
                </div>

              </form><!-- End General Form Elements -->

            </div>
          </div>

        </div>

        
      </div>
    </section>
