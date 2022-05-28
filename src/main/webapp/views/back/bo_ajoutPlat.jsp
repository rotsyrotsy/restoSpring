<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="baseURL" value="${scheme}://${serverName}:${serverPort}"/>


    <div class="pagetitle">
      <h1>Ajouter un nouveau plat</h1>
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
              <h5 class="card-title">Formulaire d'ajout d'un plat</h5>

              <!-- General Form Elements -->
              <form action="${baseURL}/plats/ajout" method="post" enctype="multipart/form-data">
              
              <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">Catégorie</label>
                  <div class="col-sm-10">
                    <select name="idCategorie" class="form-select" aria-label="Default select example">
                      <option selected="">Choisir</option>
                      <c:forEach  items="${listCategorie}" var ="categorie">
							<option value="${categorie.id}">${categorie.label}</option>
						</c:forEach>
                      
                    </select>
                  </div>
                </div>
                
                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">Nom</label>
                  <div class="col-sm-10">
                    <input type="text" name="label" class="form-control">
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="inputNumber" class="col-sm-2 col-form-label">Prix</label>
                  <div class="col-sm-10">
                    <input type="number" name="price" class="form-control">
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="inputNumber" class="col-sm-2 col-form-label">Image</label>
                  <div class="col-sm-10">
                    <input class="form-control" type="file" name="photo" id="formFile" accept="image/png, image/jpeg, image/jpg">
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
