<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<%@ include file="/WEB-INF/templates/1-head.jsp"%><%--<head> Head </head>--%>

<body id="page-top">

<div id="wrapper">
  <%@ include file="/WEB-INF/templates/2-sidebar.jsp"%><%-- Sidebar --%>

  <%-- ContentWrapper --%>
  <div id="content-wrapper" class="d-flex flex-column">
    <%-- Main Content --%>
    <div id="content">
      <%@ include file="/WEB-INF/templates/3-topbar.jsp"%><!-- Topbar -->

      <%-- Edit Here!! --%>
      <%-- Edit Here!! --%>
      <%-- Edit Here!! --%>
      <!-- Begin Page Content -->
      <div class="container-fluid">

        <div class="form-outline mb-4">
          <input type="search" class="form-control" id="datatable-search-input">
          <label class="form-label" for="datatable-search-input">Search</label>
        </div>
        <div id="datatable">
          <table class="table table-hover">
            <thead class="thead-dark">
            <tr>
              <th scope="col">#</th>
              <th scope="col">제목</th>
              <th scope="col">작성자</th>
              <th scope="col">작성일</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${posts.list}" var="post">
              <tr scope="row">
                <td>${post.pno}</td>
                <td>${post.title}</td>
                <td>${post.writer}</td>
                <td>${post.regDate}</td>
              </tr>
            </c:forEach>
            </tbody>
          </table>
        </div>
        ${pagination}
        <nav aria-label="Page navigation example">
          <ul class="pagination justify-content-center">
            <c:if test="${pagination.prev}">
              <li class="page-item"><a class="page-link" href="#">Previous</a></li>
            </c:if>

            <c:forEach begin="${pagination.start}" end="${pagination.end}" var="num">
            <li class="page-item"><a class="page-link" href="#"><c:out value="${num}"/></a></li>
            </c:forEach>

            <c:if test="${pagination.next}">
              <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </c:if>
          </ul>
        </nav>

      </div>
      <!-- /.container-fluid -->
      <%-- Edit Here!! --%>
      <%-- Edit Here!! --%>
      <%-- Edit Here!! --%>

    </div>
    <!-- End of Main Content -->


    <%@ include file="/WEB-INF/templates/4-footer.jsp"%><!-- Footer -->

  </div>
  <!-- End of Content Wrapper -->

</div>

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
  <i class="fas fa-angle-up"></i>
</a>

<%@ include file="/WEB-INF/templates/5-logoutModal.jsp"%><%--<div> Logout Modal</div>--%>
<%@ include file="/WEB-INF/templates/6-scripts.jsp"%><%--<script> Bootstrap scripts </script>--%>
</body>
</html>