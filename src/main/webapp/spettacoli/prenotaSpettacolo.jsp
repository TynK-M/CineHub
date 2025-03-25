<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../componenti/navbar.jsp" %>

<html>
<head>
  <title>Prenotazione - ${spettacolo.film.titolo}</title>
  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <style>
    .seat-grid {
      display: grid;
      grid-template-columns: repeat(20, 1fr); /* 20 colonne, 10 righe => 200 posti */
      gap: 5px;
      max-width: 800px;
      margin: auto;
    }
    .seat {
      width: 100%;
      padding-top: 100%; /* quadrato */
      position: relative;
      border: 1px solid #ccc;
      border-radius: 5px;
      text-align: center;
      background-color: #e0f7fa;
      cursor: pointer;
    }
    .seat.occupied {
      background-color: #aaa !important;
      cursor: not-allowed;
    }
    .seat input[type="radio"] {
      display: none;
    }
    .seat label {
      position: absolute;
      top: 50%; left: 50%;
      transform: translate(-50%, -50%);
      font-size: 12px;
      color: #000;
    }
    .seat input[type="radio"]:checked + label {
      background-color: #007bff;
      color: white;
      padding: 2px 4px;
      border-radius: 3px;
    }
  </style>
</head>
<body class="bg-dark text-light">

<div class="container mt-5">
  <h2 class="text-center">
    Prenota i posti per <strong>${spettacolo.film.titolo}</strong>
  </h2>

  <form action="ConfermaAcquistoServlet" method="post">
    <input type="hidden" name="idSpettacolo" value="${spettacolo.id}" />

    <div class="seat-grid mt-4 mb-4">
      <c:forEach var="p" items="${tuttiPosti}">
        <c:choose>
          <c:when test="${liberoMap[p.id]}">
            <!-- Posto libero -->
            <div class="seat">
              <!-- Un solo posto radio -->
              <input type="radio" name="posti" id="posto${p.id}" value="${p.id}" />
              <label for="posto${p.id}">${p.numero}</label>
            </div>
          </c:when>
          <c:otherwise>
            <!-- Posto occupato (disabilitato) -->
            <div class="seat occupied">
              <input type="radio" disabled />
              <label>${p.numero}</label>
            </div>
          </c:otherwise>
        </c:choose>
      </c:forEach>
    </div>

    <div class="text-center">
      <button type="submit" class="btn btn-primary">
        Conferma Acquisto
      </button>
    </div>
  </form>
</div>

<%@ include file="../componenti/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
