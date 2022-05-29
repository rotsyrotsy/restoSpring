<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="baseURL" value="${scheme}://${serverName}:${serverPort}"/>


    <div class="pagetitle">
      <h1>Liste des additions non payées</h1>
      
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Les commandes non encore payées</h5>

              <!-- Table with stripped rows -->
              <div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
              <div class="dataTable-top">
              <div class="dataTable-dropdown"><label>
              <select class="dataTable-selector">
              <option value="5">5</option><option value="10" selected="">10</option>
              <option value="15">15</option><option value="20">20</option><option value="25">25</option>
              </select> entries per page</label></div><div class="dataTable-search">
              <input class="dataTable-input" placeholder="Search..." type="text"></div></div>
              <div class="dataTable-container">
              
              <table class="table datatable dataTable-table">
                <thead>
                  <tr>
	                  <th scope="col" data-sortable="" style="width: 10%;">
	                  <a href="#" class="dataTable-sorter">#</a></th>
	                  <th scope="col" data-sortable="" style="width: 18%;">
	                  <a href="#" class="dataTable-sorter">Destination</a></th>
	                  <th scope="col" data-sortable="" style="width: 18%;">
	                  <a href="#" class="dataTable-sorter">Date</a></th>
	                  <th scope="col" data-sortable="" style="width: 18%;">
	                  <a href="#" class="dataTable-sorter">A payer</a></th>
	                  <th scope="col" data-sortable="" style="width: 18%;">
	                  <a href="#" class="dataTable-sorter">Payé</a></th>
	                  <th scope="col" data-sortable="" style="width: 18%;">
	                  <a href="#" class="dataTable-sorter">Restant</a></th>
                  </tr>
                </thead>
                <tbody>
                 <c:forEach  items="${addition}" var="ad" varStatus="i">
	                <tr>
		                <th scope="row">${i.index+1}</th>
		                <td>${ad.numero}</td>
		                <td>${ad.date}</td>
		                <td>${ad.total}</td>
		                <td>${ad.dejapayer}</td>
		                <td>${ad.restant}</td>
	                <tr>
	             </c:forEach>
	            
                </tbody>
              </table></div><div class="dataTable-bottom"><div class="dataTable-info">Voir 1 à 5 sur 5 entrées</div><nav class="dataTable-pagination"><ul class="dataTable-pagination-list"></ul></nav></div></div>
              <!-- End Table with stripped rows -->

            </div>
          </div>

        </div>
      </div>
    </section>
