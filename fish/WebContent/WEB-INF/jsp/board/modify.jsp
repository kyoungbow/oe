<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<jsp:include page="../common/head.jsp"/>
</head>
   
<body>
    <jsp:include page="../common/nav.jsp"/>
    <form method="post">
    <div class="detail">
        <div class="detail-content">
            <div class="fisher"></div>
            <div class="notice-detail">
                <h3 class="bno" >[${board.bno}]</h3>
                <h3 class="title"><input style="border:0; font-size:14px; height:20px" type="text" id="title" name="title" value="${board.title}"></h3>
                <h3 class="date">${board.regDate}</h3>
                <h3 class="name">${empty board.writer ? '(탈주피쉬)' : board.writer}</h3> 
            </div>
            <div class="text-contents">
                <textarea id="content" name="content">${board.content}</textarea>                
            </div>
            
            
		    <input type="hidden" id="bno" name="bno" value="${board.bno}" >
		    <input type="hidden" id="title" name="title" value="${board.title}">
		    <input type="hidden" id="regDate" name="regDate" value="${board.regDate}" >
            <input type="hidden" id="writer" name="writer" value="${board.writer}" >
            <input type="hidden" name="amount" value="${cri.amount}">
			<input type="hidden" name="category" value="${cri.category}">
			<input type="hidden" name="pageNum" value="${cri.pageNum}">
            <div class="detail-button">
                <button class="modify-button" >modify</button>
                <a href="${pageContext.request.contextPath}/board/list?category=${cri.category}">List</a>
            </div>
        </div>
    </div>
	</form>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>