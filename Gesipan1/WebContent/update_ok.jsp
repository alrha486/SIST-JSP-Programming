<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<fmt:requestEncoding value="utf-8"/>
<jsp:useBean id="sc" class="com.example.libs.controller.SelectController" />
<jsp:useBean id="uc" class="com.example.libs.controller.UpdateController" />
<jsp:useBean id="util" class="com.example.libs.controller.Util" />
<jsp:useBean id="gesipan" class="com.example.libs.model.GesipanVO" />
<c:set var="dbpasswd" value="${sc.selectPasswd(param.p_idx)}" />
<!-- idx에 해당하는 String형 passwd를 가져옴 -->

<!-- 비밀번호가 일치하면 -->
<c:if test="${dbpasswd eq param.passwd }">
	<jsp:setProperty name="gesipan" property="email" value="${param.email}"/>
	<jsp:setProperty name="gesipan" property="title" value="${util.convert(param.title,false)}"/>
	<jsp:setProperty name="gesipan" property="contents" value="${util.convert(param.contents,true)}"/>
	<jsp:setProperty name="gesipan" property="idx" value="${param.p_idx}"/>
	<c:set var="row" value="${uc.update(gesipan)}" /> 
		
		<c:if test="${row eq 1}" >
			<script>
				location.href="view.jsp?idx=${param.p_idx}";
			</script>
		</c:if>
		
		<c:if test="${row ne 1}">
			<script>
				history.back();
			</script>
		</c:if>
</c:if>

<c:if test="${dbpasswd ne param.passwd }">
	<script>
		alert("비밀번호가 일치하지 않습니다. 확인 후 다시 입력해주세요.");
		history.back();
	</script>
</c:if>




