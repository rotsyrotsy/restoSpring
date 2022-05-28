<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="baseURL" value="${scheme}://${serverName}:${serverPort}"/>


    <div class="pagetitle">
      <h1>Ajouter des ingrédients à un plat</h1>
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
              <h5 class="card-title">Formulaire d'ajout d'ingrédient</h5>

              <!-- General Form Elements -->
              <form action="${baseURL}/platIngredients" method="post" >
              
              <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">Plat</label>
                  <div class="col-sm-10">
                    <select name="idplat" class="form-select" aria-label="Default select example">
                      <option selected="">Choisir</option>
                      <c:forEach  items="${plats}" var ="plat">
							<option value="${plat.id}">${plat.label}</option>
						</c:forEach>
                      
                    </select>
                  </div>
                </div>
                
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">Ingrédient</label>
                  <div class="col-sm-10">
                    <select name="idingredient" class="form-select" aria-label="Default select example">
                      <option selected="">Choisir</option>
                      <c:forEach  items="${ingredients}" var ="ingredient">
							<option value="${ingredient.id}">${ingredient.label}</option>
						</c:forEach>
                    </select>
                  </div>
                </div>
                
                <div class="row mb-3">
                  <label for="inputNumber" class="col-sm-2 col-form-label">Quantité d'ingrédient</label>
                  <div class="col-sm-10">
                    <input type="text" name="quantity" class="form-control">
                  </div>
                </div>
                <div class="row mb-3">
                  <div class="col-sm-10">
                    <button type="submit" class="btn btn-success">Valider</button>
                  </div>
                </div>

              </form>
				<c:if test="${success != null}">
                    <div class="alert alert-success" role="alert">
					  ${success}
					</div>
				</c:if>
            </div>
          </div>

        </div>

        
      </div>
    </section>
