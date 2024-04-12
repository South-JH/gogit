<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/dist/tabler-icons.min.css" />
<style>
.repo-hover {
  border-radius: 7px;
  height: 45px;
  cursor: pointer;
}
</style>
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
      data-header-position="fixed">

      <!-- Sidebar Start -->
      <aside class="left-sidebar">
        <!-- Sidebar scroll-->
        <div>
          <div
            class="brand-logo d-flex align-items-center justify-content-between"
          >
            <a href="main" class="text-nowrap logo-img">
              <img
                src="resources/images/gogit-logo.png"
                width="180"
                alt=""
              />
            </a>
            <div
              class="close-btn d-xl-none d-block sidebartoggler cursor-pointer"
              id="sidebarCollapse"
            >
              <i class="ti ti-x fs-8"></i>
            </div>
          </div>
          <!-- Sidebar navigation-->
          <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
            <ul id="sidebarnav">
              <li class="nav-small-cap">
                <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                <span class="hide-menu">Home</span>
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link"
                  href="./index.html"
                  aria-expanded="false"
                >
                  <span>
                    <i class="ti ti-layout-dashboard"></i>
                  </span>
                  <span class="hide-menu">Dashboard</span>
                </a>
              </li>
              <li class="nav-small-cap">
                <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                <span class="hide-menu">PROJECT</span>
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link"
                  href="list.pr"
                  aria-expanded="false"
                >
                  <span>
                    <i class="ti ti-brand-github"></i>
                  </span>
                  <span class="hide-menu">Recruit</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link"
                  href="./ui-alerts.html"
                  aria-expanded="false"
                >
                  <span>
                    <i class="ti ti-calendar-month"></i>
                  </span>
                  <span class="hide-menu">Calendar</span>
                </a>
              </li>
              
              <%-- 
              <li class="sidebar-item">
                <a
                  class="sidebar-link"
                  href="./ui-card.html"
                  aria-expanded="false"
                >
                  <span>
                    <i class="ti ti-cards"></i>
                  </span>
                  <span class="hide-menu">추가할거있으면 여기에</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link"
                  href="./ui-forms.html"
                  aria-expanded="false"
                >
                  <span>
                    <i class="ti ti-file-description"></i>
                  </span>
                  <span class="hide-menu">추가할거있으면 여기에</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link"
                  href="./ui-typography.html"
                  aria-expanded="false"
                >
                  <span>
                    <i class="ti ti-typography"></i>
                  </span>
                  <span class="hide-menu">추가할거있으면 여기에</span>
                </a>
              </li>
              --%>
               
              <li class="nav-small-cap repo-hover">
              	<a href="List.rp" style="color: inherit;">
	                <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
	                <span class="hide-menu" style="line-height: 40px;">REPOSITORY</span>
                </a>
              </li>
              
              <%--
              <li class="sidebar-item">
                <a
                  class="sidebar-link"
                  href="./authentication-register.html"
                  aria-expanded="false"
                >
                  <span>
                    <i class="ti ti-user-plus"></i>
                  </span>
                  <span class="hide-menu">Register</span>
                </a>
              </li>
              --%>
              <li class="nav-small-cap">
                <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                <span class="hide-menu">COMMUNITY</span>
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link"
                  href="./icon-tabler.html"
                  aria-expanded="false"
                >
                  <span>
                    <i class="ti ti-mood-happy"></i>
                  </span>
                  <span class="hide-menu">Personal &nbsp; PR</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link"
                  href="./sample-page.html"
                  aria-expanded="false"
                >
                  <span>
                    <i class="ti ti-brand-finder"></i>
                  </span>
                  <span class="hide-menu">Friend</span>
                </a>
              </li>
            </ul>
            <%-- 
            <div
              class="unlimited-access hide-menu bg-light-primary position-relative mb-7 mt-5 rounded"
            >
              <div class="d-flex">
                <div class="unlimited-access-title me-3">
                  <h6 class="fw-semibold fs-4 mb-6 text-dark w-85">
                    Upgrade to pro
                  </h6>
                  <a
                    href="https://adminmart.com/product/modernize-bootstrap-5-admin-template/"
                    target="_blank"
                    class="btn btn-primary fs-2 fw-semibold lh-sm"
                    >Buy Pro</a
                  >
                </div>
                <div class="unlimited-access-img">
                  <img
                    src="resources/images/backgrounds/rocket.png"
                    alt=""
                    class="img-fluid"
                  />
                </div>
              </div>
            </div>
            --%>
          </nav>
          <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
      </aside>
      <!--  Sidebar End -->
      
   </div>
</body>
</html>