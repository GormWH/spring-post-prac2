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

        <!-- Search Box -->
        <form class="post-search
        d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
          <div class="input-group">
            <select class="custom-select custom-select-sm">
              <option value="t">제목</option>
              <option value="tc">제목+내용</option>
              <option value="tcw">제목+내용+작가</option>
            </select>
            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." value="${pagination.searchParam.keyword}"
                   aria-label="Search" aria-describedby="basic-addon2">
            <div class="input-group-append">
              <button class="btn btn-primary" type="button">
                <i class="fas fa-search fa-sm"></i>
              </button>
            </div>
          </div>
        </form>
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
            <tbody class="posts">
            <c:forEach items="${posts.list}" var="post">
              <tr scope="row" data-pno="${post.pno}">
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
              <li class="page-item"><a class="page-link" data-page="${pagination.start - 1}">Previous</a></li>
            </c:if>

            <c:forEach begin="${pagination.start}" end="${pagination.end}" var="num">
              <li class="page-item ${num == pagination.page ? "active" : ""}">
                <a class="page-link" data-page="${num}" ><c:out value="${num}"/></a>
              </li>
            </c:forEach>

            <c:if test="${pagination.next}">
              <li class="page-item"><a class="page-link" data-page="${pagination.end + 1}">Next</a></li>
            </c:if>
          </ul>
        </nav>

        <form method="get" class="action-form">
          <input type="hidden" name="page" value="${pagination.page}">
          <input type="hidden" name="size" value="${pagination.size}">
          <input type="hidden" name="type" value="${pagination.searchParam.type}">
          <input type="hidden" name="keyword" value="${pagination.searchParam.keyword}">
        </form>
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

<script>
  const searchForm = {
    type: document.querySelector(".post-search select"),
    keyword: document.querySelector(".post-search input")
  };
  const actionForm = {
    form: document.querySelector('.action-form'),
    page: document.querySelector('.action-form input[name="page"]'),
    size: document.querySelector('.action-form input[name="size"]'),
    type: document.querySelector('.action-form input[name="type"]'),
    keyword: document.querySelector('.action-form input[name="keyword"]'),
    getSearchURL: function() {
      return `/post/list?\${parseInt(this.page.value)}
      &\${parseInt(this.size.value)}
      &\${this.type.value}
      &\${this.keyword.value}`
    }
  };

  document.querySelector(".post-search button").addEventListener("click", () => {
    actionForm.page.value = 1;
    actionForm.type.value = searchForm.type.value;
    actionForm.keyword.value = searchForm.keyword.value;
    actionForm.form.setAttribute("action", actionForm.getSearchURL());
    actionForm.form.submit();
  }, false);

  // Pagination link
  document.querySelector(".pagination").addEventListener("click", (e) => {
    console.log(e.target.tagName)
    if (e.target.tagName != "A") return;
    const target = e.target;
    actionForm.page.value = target.dataset.page;
    actionForm.form.submit();
  }, false);
</script>
</body>
</html>