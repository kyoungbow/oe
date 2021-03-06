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
    <div class="index">
        <div class="index-container">
            <div class="index-content">
                <div class="news-top"></div>
                <div class="fish-news">
                    <div class="kyoungbow"></div>
                    <div class="news-content">
                        <div><h1>Fish<span> News</span></h1></div>
                        <div><p>김경보 관리자께서 3미터 짜리 잉어를 낚으셨습니다. 세상에 마상에 한강에서 3미터 잉어라니 이건 거의 기적에 가깝지 않나요?? 블라브라
                            너무너무 신나는 날이에요 모두 박수 칩시다 짝짝짝 모두 잉어회를 먹으러 갑시다. 잉어잉어 잉어킹 갸라도스로 진화~~~~~~~~~~~~~  하지만 아무일도 일어나지 않았다.
                            김경보 관리자는 이제 낚시꾼이 아닌 포켓몬 마스터입니다. 두둥탁~!
                        </p></div>
                    </div>
                </div>
                <h2>Fish Advertisement</h2>    
                <div>
                    <div class="fish-ad">
                        <div class="first-ad">
                            <a href="${pageContext.request.contextPath}/board/list?category=3&amount=6"><div class="first-img"></div></a>
                            <div class="first-content">
                                <h4> - 감성돔 선상 낚시 공고 - </h4>
                                <p>감성돔 낚시 시즌입니다</p>
                                <p>거문도행 선상 종일권</p>
                                <p>- 성인 100,000원 -</p>
                                <p>- 청소년 80,000원 -</p>
                            </div>
                        </div>
                        <div class="second-ad">
                             <a href="${pageContext.request.contextPath}/board/list?category=3&amount=6"><div class="second-img"></div></a>
                            <div class="second-content">
                                <h4> - 쭈꾸미 선상 낚시 공고 - </h4>
                                <p>쭈꾸미 시즌이 곧입니다</p>
                                <p>인천 선상 종일권</p>
                                <p>- 성인 80,000원 -</p>
                                <p>- 청소년 60,000원 -</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hot-fish"><h3><span>Hot </span>Fish Video</h3></div>
                <div>
                    <div class="video">
                        <div class= "video-tv"><iframe src="https://www.youtube.com/embed/AbuMBLTL2jM" frameborder="0" ></iframe></div>
                        <div class= "video-content">
                            <h3>힛뜨 Tv</h3>
                            <p>요즘 유명하는 통발 및 낚시 유튜버 힛뜨 Tv 입니다. 주로 거문도에서 낚시를 하며 주로 통발을 통해 생물을 잡은 뒤 
                                시식하는 유튜버 입니다. 주로 콜리님의 배를 타고 나가서 거문도 포인트에 있는 바다 물고기를 낚시로 잡아 먹습니다.
                            </p>
                        </div>
                    </div>
                    <div class="video">
                        <div class= "video-tv"><iframe src="https://www.youtube.com/embed/t9pCHuZyzuU" frameborder="0" ></iframe></div>
                        <div class= "video-content">
                            <h3>진석기 시대</h3>
                            <p>자급자족 낚시 유튜버 진석기시대 입니다. 최근 대동어지도등 전국을 돌며 낚시를 하며 잡은 물고기를 직접 손질하여 먹는 모습까지
                                보여주는 유튜버 입니다. 베스요리가 주 메뉴였으며 강준치 수제 어묵, 황어 회덮밥, 참돔 라면피자 등 기괴한 음식도 잘 먹습니다.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="index-sidebar">
                <div class="sidebar-image"></div>
                <div>
                    <h3>Can u join us?</h3>
                </div>
                <div class="sign">
<%--                     <div class="sign-in"><a href="${cp}member/login">Login</a></div> --%>
<%--                     <div class="sign-up"><a href="${cp}member/contract">Sign-up</a></div> --%>
                    <c:if test="${not empty member}">
                     <div class="sign-in"><a  href="${cp}member/logout">Log-out</a></div>
                     <div class="sign-up"><a  href="${cp}member/myPage">MyPage</a></div>
                     </c:if>
                     <c:if test="${empty member}">
                     <div class="sign-in"><a  href="${cp}member/login">Login</a></div>
                     <div class="sign-up"><a  href="${cp}member/contract">Sign-up</a></div>
                     </c:if>
                </div>
                
                <div class="find">
                    <h4><a href="${cp}member/findid">아이디</a>/<a href="${cp}member/findPassword">비밀번호</a> 찾기</h4>
                </div>
                <div class="etc">
                    <div>
                        <li>오늘의 점심 추천</li>
                        <p>오징어볶음</p>
                        <p>장조림</p>
                        <p>흑미밥</p>
                        <p>멸치 볶음</p>
                        <p>된장찌개</p>
                    </div>
                    <hr>
                    <div>
                        <li>오늘의 장비 추천</li>
                        <p>시마노 스티레SS pg</p>
                        <p>듀엘 엑스와이어 X8 합사</p>
                        <p>타이라바</p>
                        <p>시마노 염월 엔게츠 BB</p>
                    </div>
                    <hr>
                    <div>
                        <li>게시물 작성 요령</li>
                        <p>비속어 사용 금지</p>
                        <p>남을 비하하는 발언 금지</p>
                        <p>허가받지 않은 모임 금지</p>
                        <p>사이트 홍보 금지</p>
                    </div>
                    <hr>
                    <div>
                        <li>블랙 리스트</li>
                        <p>박xx "idsalk1****"</p>
                        <p>김xx "dsak12****"</p>
                        <p>김xx "gode5515****"</p>
                        <p>이xx "human1****"</p>
                    </div>
                </div>
            </div>
            <div class="new-fish"></div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>