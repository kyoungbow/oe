<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<jsp:include page="../common/head.jsp"/>
	<style>
	
	</style>
</head>
   
<body>
    <jsp:include page="../common/nav.jsp"/>
    <form>
    <div class="detail">
        <div class="detail-content">
            <div class="fisher"></div>
            <div class="notice-detail">
                <h3 class="bno" >[${board.bno}]</h3>
                <h3 class="title">${board.title}</h3>
                <h3 class="date">${board.regDate}</h3>
                <h3 class="name">${empty board.writer ? '(탈주피쉬)' : board.writer}</h3> 
            </div>
            <div class="text-contents">
            	<c:if test="${cri.category==3}">
					<div>
			    	<c:forEach items="${board.attachs}" var="attach">
		    		<c:if test="${attach.image}">
		    		<div >
	    			<img style="width: 700px; height: auto;"src="${pageContext.request.contextPath}/display?uuid=${attach.uuid}&path=${attach.path}" alt="${attach.origin}">
		    		</div>
		    		</c:if>
			    	</c:forEach>
				    </div>
			    </c:if>
                <textarea>${board.content}</textarea>                
            </div>
            <div>
				<h3 class="attach">첨부파일</h3>
				<div class="attachs">
					<c:forEach items="${board.attachs}" var="attach">
						<li><a href="${pageContext.request.contextPath}/download${attach.params}">${attach.origin}</a></li>
					</c:forEach>
				</div>
		  	</div>
		  	
            <div class="replies1">
				<h3>댓글</h3> <button class="reply-button" id="btnReplyReg" type="button">댓글쓰기</button>
				<div class="replies1">
				<input style="width: 92%; height: 25px; margin : 10px 0 0 0; border-radius: 3px;" id="replyContent">
				</div>
		  	</div>
		  	<div class="replies">
		  		<div></div>
		  	</div>
		  	
            <div class="detail-button">
            	<c:if test="${not empty member && member.id == board.writer}">
                <a href="modify${cri.params2}&bno=${board.bno}" >modify</a>
				<a href="remove${cri.params2}&bno=${board.bno}" onclick="return confirm('삭제하시겠습니까?')">remove</a>
				</c:if>
                <a href="${pageContext.request.contextPath}/board/list?category=${cri.category}">List</a>
            </div>
        </div>
    </div>
    </form>
    
    
    <jsp:include page="../common/footer.jsp"/>
    <script>
			const cp = '${pageContext.request.contextPath}';

			
			$(function () {
				const bno = '${board.bno}';
				showList();

				function showList(){
					replyService.list(bno, function(data) {
						console.log(data);
						var str = "";
						for(var i in data){
						
							str+='<li style="list-style: none;" data-rno = "' + data[i].rno +'">'
							str+='<div  style="width: 623px; margin: 0 10px 0 30px; height: 40px; border: 1px solid;" ">'
							str+='<span>' + data[i].writer +'</span>'
							str+='<span style="margin: 0 0 0 400px; font-size: 11px;" >' + data[i].regDate +'</span>'
							str+='<span class="btnReplyRemove"> <i class="fas fa-minus-circle" style="cursor:pointer; font-size:11px"></i></i></span>'
							str+='</div>'
							str+='<div" ><p style="width: 623px; margin: 0 10px 5px 30px; height: 60px; border: 1px solid; font-size: 14px; font-weight: bold; ">' + data[i].content +'</p></div>'
							str+='</li>'
						}
						$(".replies").html(str);
					}, cp);
				}

				// 댓글 삭제
				$(".replies").on("click", ".btnReplyRemove", function(){
					var rno = $(this).closest("li").data("rno");
					var reply = {"rno":rno};
					replyService.remove(reply,function(data){
						alert("댓글이 삭제되었습니다")
						showList();
					}, cp);
				});
				
				// 댓글 등록 버튼 클릭 이벤트
				$("#btnReplyReg").click(function(){
					var reply = {bno:bno, content:$("#replyContent").val(), writer: '${member.id}'};
					replyService.add(reply,function(data) {
						showList();
						$("#replyContent").val("");
						alert("댓글 등록완료")
					},cp);
				});

			});
		</script>
		<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>