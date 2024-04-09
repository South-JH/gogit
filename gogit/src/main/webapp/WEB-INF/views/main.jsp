<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
    <!--  Body Wrapper -->
    <div
      class="page-wrapper"
      id="main-wrapper"
      data-layout="vertical"
      data-navbarbg="skin6"
      data-sidebartype="full"
      data-sidebar-position="fixed"
      data-header-position="fixed"
    >
      <jsp:include page="common/sideBar.jsp" />

      <!--  Main wrapper -->
      <div class="body-wrapper">
        <jsp:include page="common/header.jsp" />

        <jsp:include page="common/content.jsp" />
      </div>
    </div>

    <script>
      $.ajax({
        url: "https://github.com/login/oauth/access_token",
        method: "post",
        headers: {
          accept: "application/json",
        },
        data: {
          client_id: "4f2d7f7f95a1e0e30876",
          client_secret: "d8462479d413236a3dd755b54a8b4c119080ddaf",
          code: "${code}",
        },
        success: function (result) {
          console.log(result);
        },
      });
    </script>
  </body>
</html>
