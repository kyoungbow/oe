<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<jsp:include page="../common/head.jsp"/>
	<style>
	
	</style>
</head>
   
<body>
    <jsp:include page="../common/nav.jsp"/>
    <div class="signup">
        <form method="post">
        <div class="signup-container">
            <div>
                <h1>New Fish(id, pw, check, name);</h1>
            </div>
            <div class="signup-content">
                <div >
                    <h3><label for="id">this.id = </label></h3>
                </div>
                <div>
                    <input id="id" type="text" name="id" placeholder = "scanner.nextLine(write your Id)">
                    <button type="button" id="btnId" style="border-radius:3px">중복체크</button>
                    <input type="hidden" value="1" id="chkId">
                </div>
                <div>
                    <h3><label for="password">this.password = </label></h3>
                </div>
                <div>
                    <input id="inputPasswordConfirm1" name="pw" type="password" placeholder="scanner.nextLine(write your password)">
                </div>
                <div>
                    <h3><label for="check">this.check =</label></h3>
                </div>
                <div>
                    <input id="inputPasswordConfirm" name="pw2" type="password"  placeholder="scanner.nextLine(check your password)">
                    <button type="button" id="btnpw" style="border-radius:3px">비밀번호 체크</button>
                    <input type="hidden" value="1" id="chkpw">
                </div>
                <div>
                    <h3><label for="name">this.name =</label></h3>
                </div>
                <div>
                    <input type="text" name="name" placeholder="scanner.nextLine(write your name)">
                </div>
                <div>
                    <h3><label for="name">this.email =</label></h3>
                </div>
                <div>
                    <input id="email" name="email" type="text" placeholder="scanner.nextLine(write your email)">
                    <button type="button" id="btnEmail" style="border-radius:3px">이메일인증</button>
                    <input type="hidden" value="1" id="chkEmail">
                </div>
                <div>
                    <h3><label for="name">this.address =</label></h3>
                </div>
                <button type="button" class="mb-3 btn btn-sm btn-secondary" id="btnSearchAddr">주소검색</button>
                    <div class="col-md-4">
                    	<input class="form-control" id="roadAddr" name="roadAddr" readonly />
                    </div>
	                <div class="mb-3">
	                    <input class="form-control" id="addrDetail" name="addrDetail"  readonly />
	                </div>
    			<input type="hidden" name="si" id="si">
				<input type="hidden" name="sgg" id="sgg">
				<input type="hidden" name="emd" id="emd">
				<input type="hidden" name="zipNo" id="zipNo">
				<input type="hidden" name="roadFullAddr" id="roadFullAddr">
				<input type="hidden" name="jibunAddr" id="jibunAddr">
                <div class="signup-button">
                    <button>Join</button>
                </div>
            </div>
            <div class="signup-side">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512"><!--! Font Awesome Pro 6.0.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M224 160c8.836 0 16-7.164 16-16C240 135.2 232.8 128 224 128S208 135.2 208 144C208 152.8 215.2 160 224 160zM96 128C87.16 128 80 135.2 80 144C80 152.8 87.16 160 96 160s16-7.164 16-16C112 135.2 104.8 128 96 128zM474.4 64.12C466.8 63.07 460 69.07 460 76.73c0 5.959 4.188 10.1 9.991 12.36C514.2 99.46 544 160 544 192v112c0 8.844-7.156 16-16 16S512 312.8 512 304V212c0-14.87-15.65-24.54-28.94-17.89c-28.96 14.48-47.83 42.99-50.51 74.88C403.7 285.6 384 316.3 384 352v32H224c17.67 0 32-14.33 32-32c0-17.67-14.33-32-32-32H132.4c-14.46 0-27.37-9.598-31.08-23.57C97.86 283.5 96 269.1 96 256V254.4C101.1 255.3 106.3 256 111.7 256c10.78 0 21.45-2.189 31.36-6.436L160 242.3l16.98 7.271C186.9 253.8 197.6 256 208.3 256c7.176 0 14.11-.9277 20.83-2.426C241.7 292 277.4 320 320 320l36.56-.0366C363.1 294.7 377.1 272.7 396.2 256H320c0-25.73 17.56-31.61 32.31-32C369.8 223.8 384 209.6 384 192c0-17.67-14.31-32-32-32c-15.09 0-32.99 4.086-49.28 13.06C303.3 168.9 304 164.7 304 160.3v-16c0-1.684-.4238-3.248-.4961-4.912C313.2 133.9 320 123.9 320 112C320 103.2 312.8 96 304 96H292.7C274.6 58.26 236.3 32 191.7 32H128.3C83.68 32 45.44 58.26 27.33 96H16C7.164 96 0 103.2 0 112c0 11.93 6.816 21.93 16.5 27.43C16.42 141.1 16 142.7 16 144.3v16c0 19.56 5.926 37.71 16 52.86V256c0 123.7 100.3 224 224 224h160c123.9-1.166 224-101.1 224-226.2C639.9 156.9 567.8 76.96 474.4 64.12zM64 160.3v-16C64 108.9 92.86 80 128.3 80h63.32C227.1 80 256 108.9 256 144.3v16C256 186.6 234.6 208 208.3 208c-4.309 0-8.502-.8608-12.46-2.558L162.1 191.4c2.586-.3066 5.207-.543 7.598-1.631l8.314-3.777C186.9 182.3 192 174.9 192 166.7V160c0-6.723-5.996-12.17-13.39-12.17H141.4C133.1 147.8 128 153.3 128 160v6.701c0 8.15 5.068 15.6 13.09 19.25l8.314 3.777c2.391 1.088 5.012 1.324 7.598 1.631l-32.88 14.08C120.2 207.1 115.1 208 111.7 208C85.38 208 64 186.6 64 160.3z"/></svg>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--! Font Awesome Pro 6.0.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M208 256c35.35 0 64-28.65 64-64c0-35.35-28.65-64-64-64s-64 28.65-64 64C144 227.3 172.7 256 208 256zM464 232h-96c-13.25 0-24 10.75-24 24s10.75 24 24 24h96c13.25 0 24-10.75 24-24S477.3 232 464 232zM240 288h-64C131.8 288 96 323.8 96 368C96 376.8 103.2 384 112 384h192c8.836 0 16-7.164 16-16C320 323.8 284.2 288 240 288zM464 152h-96c-13.25 0-24 10.75-24 24s10.75 24 24 24h96c13.25 0 24-10.75 24-24S477.3 152 464 152zM512 32H64C28.65 32 0 60.65 0 96v320c0 35.35 28.65 64 64 64h448c35.35 0 64-28.65 64-64V96C576 60.65 547.3 32 512 32zM528 416c0 8.822-7.178 16-16 16H64c-8.822 0-16-7.178-16-16V96c0-8.822 7.178-16 16-16h448c8.822 0 16 7.178 16 16V416z"/></svg>
            </div>
            <a class="already" href="${cp}member/login">are you already fish()?</a>
        </div>
        </form> 
    </div>
    <jsp:include page="../common/footer.jsp"/>
    <script type="text/javascript">
            $(function() {
            var cp = '${pageContext.request.contextPath}';
                $("#btnSearchAddr").click(function(){
                    var pop = window.open("${pageContext.request.contextPath}/juso","pop","width=570,height=420, scrollbars=yes, resizable=yes");
                });
                
                $('#btnpw').click(function() {
                	var p1 = document.getElementById('inputPasswordConfirm1').value;
                	var p2 = document.getElementById('inputPasswordConfirm').value;
                	if(p1.length < 4){
						alert("비밀번호는 4자리 이상입니다.")
						return false;                		
                	} 
                	if (p1 != p2){
						alert("비밀번호가 동일하지 않습니다.")
						return false;
						
					} else{
						alert("비밀번호가 동일합니다.")
						$("#chkpw").val("");
					}
				});
                
                
                
                $("#btnId").click(function () {
                	console.log("cliked!");
                	var id = {id : $("#id").val()}
					$.ajax(cp + "/member/findMember", {
						data : id,
						method : "get",
						success : function (data) {
							console.log(data);
							$("#chkId").val(data);
						}
					})
				});
                
                $("#id").change(function () {
                	$("#chkId").val(1);
    			});
                
                $("#btnEmail").click(function () {
                	console.log("cliked!");
                	var email = {email : $("#email").val()}
					$.ajax(cp + "/member/findMember", {
						data : email,
						method : "get",
						success : function (data) {
							console.log(data);
							$("#chkEmail").val(data);
						}
					})
				});
                
                $("#Email").change(function () {
                	$("#chkEmail").val(1);
    			});
                
                
                
                $("form").submit(function () {
                	if($("#chkId").val()) {
                		alert("ID 중복 체크를 해주세요")
                		return false;
                	}
                	if($("#chkpw").val()) {
                		alert("비밀번호 동일 여부를 확인해주세요")
                		return false;
                	}
                	
                	if($("#chkEmail").val()) {
                		alert("Email 중복 체크를 해주세요")
                		return false;
                	}
				})
            })	
            function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
                $("#si").val(siNm);
                $("#sgg").val(sggNm);
                $("#emd").val(emdNm);
                $("#roadAddr").val(roadAddrPart1);
                $("#addrDetail").val(addrDetail);
                $("#zipNo").val(zipNo);
                $("#roadFullAddr").val(roadFullAddr);
                $("#jibunAddr").val(jibunAddr);

                };
        </script>
	</body>
</html>