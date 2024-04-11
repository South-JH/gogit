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
        url: "http://github.com/login/oauth/access_token",
        method: "post",
        headers: {
          accept: "application/json",
        },
        data: {
          client_id: "b04c2346160ad65c626a",
          client_secret: "72f93a74dd1b6b2506351c18cd04c03d4896617d",
          code: "${code}",
        },
        success: function (result) {
          console.log(result);
        },
      });
    </script>
  </body>
</html>
