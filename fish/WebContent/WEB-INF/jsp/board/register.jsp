<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<jsp:include page="../common/head.jsp"/>
	<style>
	
	</style>
</head>
   
<body>
    <jsp:include page="../common/nav.jsp"/>
    
    <form method="post" enctype="multipart/form-data">
    <div class="write">
        <div class="write-content" >
            <div class="fisher"></div>
            <div class="write-head">
            	<input type="text" id="title" name="title" placeholder=" Write your title !" value="${board.title}">
            </div>
            <div class="text-write">
                <textarea id="content" name="content" placeholder=" Write your contents ! ">${board.content}</textarea>
            </div>
            <div class="write-attach">
            	<input type="file" id="file" name="file" multiple>
            </div>
            <input type="hidden" id="writer" name="writer" value="${member.id}">
            <input type="hidden" name="amount" value="${cri.amount}">
		    <input type="hidden" name="category" value="${cri.category}">
			<input type="hidden" name="pageNum" value="${cri.pageNum}">
            <div class="write-button">
                <button>Write</button>
                <a href="${pageContext.request.contextPath}/board/list?category=${cri.category}">Cancel</a>
            </div>
        </div>
    </div>
    </form>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>