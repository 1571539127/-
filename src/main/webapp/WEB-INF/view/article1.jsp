<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<body>
	<link rel="stylesheet"
		href="https://heerey525.github.io/layui-v2.4.3/layui-v2.4.4/css/layui.css">
	<script type="text/javascript"
		src="https://heerey525.github.io/layui-v2.4.3/layui-v2.4.4/layui.js" />
<!-- 	<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script> -->
<script type="text/javascript" src="/view/jquery-3.0.0/jquery-3.0.0.min.js"></script>

	<div id="passage_excelIn_box_body" class="col-sm-12" style="padding-left: 10px; padding-right: 10px;">
	   <span>1232133</span>
		<div>
			<c:forEach var="item" items="${list}">
			${item}
			</c:forEach>
		</div>
	</div>
</body>
</html>
