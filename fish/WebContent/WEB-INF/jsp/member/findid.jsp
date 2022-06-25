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
    <div class="signin">
        <div class="main-container">
            <div class="signin-container-find">
                <div class="signin-content">
                    <h1>fish.find()</h1>
                    <div>
                        <h3><label for="id" >fish.name</label></h3> 
                    </div>
                    <div>
                        <input type="text" placeholder="Write your name !" id="name" name="name">
                    </div>
                    <div>
                        <h3><label for="email" >fish.email</label></h3>
                    </div>
                    <div>
                        <input type="text" placeholder="Write your email !" id="email" name="email">
                    </div>
                    <div class="signin-button">
                        <a id="find" href="${cp}index" onclick="alert('메일이 발송 되었습니다.')">Find</a>
                    </div>
                </div>
    
                <div class="signin-side">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--! Font Awesome Pro 6.0.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M180.5 141.5C219.7 108.5 272.6 80 336 80C399.4 80 452.3 108.5 491.5 141.5C530.5 174.5 558.3 213.1 572.4 241.3C577.2 250.5 577.2 261.5 572.4 270.7C558.3 298 530.5 337.5 491.5 370.5C452.3 403.5 399.4 432 336 432C272.6 432 219.7 403.5 180.5 370.5C164.3 356.7 150 341.9 137.8 327.3L48.12 379.6C35.61 386.9 19.76 384.9 9.474 374.7C-.8133 364.5-2.97 348.7 4.216 336.1L50 256L4.216 175.9C-2.97 163.3-.8133 147.5 9.474 137.3C19.76 127.1 35.61 125.1 48.12 132.4L137.8 184.7C150 170.1 164.3 155.3 180.5 141.5L180.5 141.5zM416 224C398.3 224 384 238.3 384 256C384 273.7 398.3 288 416 288C433.7 288 448 273.7 448 256C448 238.3 433.7 224 416 224z"/></svg>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.0.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M352 128C352 198.7 294.7 256 224 256C153.3 256 96 198.7 96 128C96 57.31 153.3 0 224 0C294.7 0 352 57.31 352 128zM209.1 359.2L176 304H272L238.9 359.2L272.2 483.1L311.7 321.9C388.9 333.9 448 400.7 448 481.3C448 498.2 434.2 512 417.3 512H30.72C13.75 512 0 498.2 0 481.3C0 400.7 59.09 333.9 136.3 321.9L175.8 483.1L209.1 359.2z"/></svg>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
    <script type="text/javascript">
    $(function() {
        var cp = '${pageContext.request.contextPath}';
        
	   /*  $('#find').click(function() {
	    	var p1 = document.getElementById('name').value;
	    	var p2 = document.getElementById('email').value;
	    	if(p1.length < 4){
				alert("비밀번호는 4자리 이상입니다.")
	    	} 
	    	if (p1 != p2){
				alert("비밀번호가 동일하지 않습니다.")
				return false;
				
			} else{
				alert("비밀번호가 동일합니다.")
				$("#chkpw").val("");
			}
		}); */
	    
	    $("#find").click(function () {
        	var $find = $(this);
        	console.log("cliked!");
        	var data = {name : $("#name").val(), email : $("#email").val()}
			$.ajax(cp + "/member/memberAuth", {
				data : data,
				method : "get",
				success : function(data) {
					$btnEmail.prop("disabled", false).html("이메일 발송 완료")	
					console.log(data);
				}
			})
		});
	    
	    $("form").submit(function () {
        	if($("#find").val()) {
        		alert("비밀번호 동일 여부를 확인해주세요")
        		return false;
        	}
        	
		})
        
    })	
    </script>
</body>
</html>