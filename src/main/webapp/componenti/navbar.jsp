<nav class="navbar navbar-expand-lg bg-dark navbar-dark" data-bs-theme="dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/HomeServlet">CineHub</a>
        <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- Menu di navigazione -->
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/ListaSpettacoliServlet">
                        Spettacoli
                    </a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/ListaSpettacoliServlet">
                        Spettacoli
                    </a>
                </li>
            </ul>

            <!-- Sezione utente -->
            <ul class="navbar-nav mb-2 mb-lg-0">
                <c:choose>
                    <c:when test="${not empty sessionScope.utente and not empty sessionScope.utente.nome and sessionScope.utente.nome != ''}">
                    <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false">
                                Ciao, ${sessionScope.utente.nome}!
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-dark" aria-labelledby="userDropdown">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/ProfiloServlet">Profilo</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/MieiAcquistiServlet">Biglietti Acquistati</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/WatchlistServlet">Watchlist</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/LogoutServlet">Logout</a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item d-flex gap-2">
                            <!-- Link assoluto con contextPath -->
                            <a class="btn btn-outline-success"
                               href="${pageContext.request.contextPath}/autenticazione/login.jsp">
                                Accedi
                            </a>
                            <a class="btn btn-outline-primary"
                               href="${pageContext.request.contextPath}/autenticazione/register.jsp">
                                Registrati
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>