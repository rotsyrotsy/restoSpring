

    <div class="pagetitle">
      <h1>Consommation des ingrédients</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${baseURL }/ingredients/choixDate">Formulaire</a></li>
          <li class="breadcrumb-item">Résultats</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Consommation des ingrédients entre ${date1 } et ${date2 }</h5>

              <!-- Table with stripped rows -->
              <div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns"><div class="dataTable-top"><div class="dataTable-dropdown"><label><select class="dataTable-selector"><option value="5">5</option><option value="10" selected="">10</option><option value="15">15</option><option value="20">20</option><option value="25">25</option></select> entries per page</label></div><div class="dataTable-search"><input class="dataTable-input" placeholder="Search..." type="text"></div></div><div class="dataTable-container"><table class="table datatable dataTable-table">
                <thead>
                  <tr>
                
	                  <th scope="col" data-sortable="" style="width: 5.6902%;">
	                  <a href="#" class="dataTable-sorter">#</a>
	                  </th>
	                  <th scope="col" data-sortable="" style="width: 28.0295%;">
	                  <a href="#" class="dataTable-sorter">Ingrédient</a>
	                  </th>
	                  <th scope="col" data-sortable="" style="width: 37.7239%;">
	                  <a href="#" class="dataTable-sorter">Quantité</a>
	                  </th>
	                  <th scope="col" data-sortable="" style="width: 9.27292%;">
	                  <a href="#" class="dataTable-sorter">Prix (Ar)</a>
	                  </th>
	                  <th scope="col" data-sortable="" style="width: 19.2835%;">
	                  <a href="#" class="dataTable-sorter">Montant (Ar)</a>
	                  </th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach  items="${listIngredient}" var="ing" varStatus="i">
	                <tr>
		                <th scope="row">${i.index+1}</th>
		                <td>${ing.label}</td>
		                <td>${ing.quantite} ${ing.unite}</td>
		                <td>${ing.pu}</td>
		                <td>${ing.prixTotal}</td>
	                <tr>
	             </c:forEach>
	             <tr>
	                <td></td>
	                <td></td>
	                <td></td>
	                <td>TOTAL</td>
	                <td>${sumPrix}</td>
	            </tr>
                </tbody>
              </table></div><div class="dataTable-bottom"><div class="dataTable-info">Voir 1 à 5 sur 5 entrées</div><nav class="dataTable-pagination"><ul class="dataTable-pagination-list"></ul></nav></div></div>
              <!-- End Table with stripped rows -->

            </div>
          </div>

        </div>
      </div>
    </section>
