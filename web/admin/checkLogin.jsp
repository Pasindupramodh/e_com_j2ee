<%-- 
    Document   : checkLogin
    Created on : Oct 27, 2023, 10:26:20 AM
    Author     : pasin
--%>

<%

    if (session.getAttribute("user") == null) {
        response.sendRedirect("index.jsp");
    }

%>