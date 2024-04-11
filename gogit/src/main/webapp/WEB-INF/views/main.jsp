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

        <div>${ userInfo }</div>
      </div>
    </div>

    <script>
      $(function () {
        $.ajax({
          url: "http://github.com/login/oauth/access_token",
          method: "post",
          headers: {
            accept: "application/json",
          },
          data: {
            client_id: "71855b2ce527504bb9cf",
            client_secret: "6156f1b3157995ef400a9f3442104e92908d6d5d",
            code: "${code}",
          },
          success: function (result) {
            console.log(result);
          },
        });
      });
    </script>
  </body>
</html>
