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
    <div class="free">
        <div class="free-content">
            <div class="board"><address><h1>Gallery</h1></address></div>
            	<div class="gallery" >
               		<c:forEach items="${boards}" var="board" >
               		<div class="gallery-hold">
                		<a href="get${page.cri.params2}&bno=${board.bno}">
	              		<div>
		  				<img onerror="this.src='${pageContext.request.contextPath}/images/noimage.png'" src="${pageContext.request.contextPath}/display?uuid=s_${board.attachs[0].uuid}&path=${board.attachs[0].path}" alt="${board.attachs[0].origin}">
	  					<div>
	    				<h4 >${board.title}</h4>
	    				<p>
						<span style="font-weight: bold;" ${empty board.writer ? 'class="text-muted small"' : ''}>${empty board.writer ? '(탈주피쉬)' : board.writer}</span>
			    		<span style="font-size: 11px;" >${board.regDate}</span>
			    		</p>
					  	</div>
						</div>
                		</a>
               		</div>
               		</c:forEach>
               	</div>
            <div class="button" >
                <a href="register${page.cri.params2}">Writing</a>
            </div>
            <div class="page">
                <div>
                	<c:if test="${page.prev}">
                    <a href="list${page.cri.params}&pageNum=${page.cri.pageNum-1}">prev</a>
                    </c:if>
                    <c:forEach begin="${page.start}" end="${page.end}" var="p">
                    	<a href="list${page.cri.params}&pageNum=${p}">${p}</a>
                    </c:forEach>
                    <c:if test="${page.next}">
                    <a href="list${page.cri.params}&pageNum=${page.cri.pageNum+1}">next</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
    <script>
        $(function () {
	        $(".form-amount").change(function () {
				location.href = 'list?amount=' + $(this).val() + "&category=${page.cri.category}&pageNum=${page.cri.pageNum}"
			});	
		})
    </script>
</body>
</html>