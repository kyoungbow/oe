<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="../common/head.jsp"/>

    <style>
        .map_wrap {position:relative;width:100%;height:350px;}
        .title {font-weight:bold;display:block;}
        .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
        #centerAddr {display:block;margin-top:2px;font-weight: normal;}
        .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
    </style>
</head>

<body>
    <jsp:include page="../common/nav.jsp"/>

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">Join</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Account Register Area -->
    <div class="account-login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
                    <div class="register-form mt-5">
                        <div class="title">
                            <h3>Join</h3>

                        </div>
                        <form method="post">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="id">ID</label>
                                    <input class="form-control" type="text" name="id" required>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input class="form-control" type="password" name="password" required>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="passwordCheck">Confirm Password</label>
                                    <input class="form-control" type="password" required>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="nickname">NickName</label>
                                    <input class="form-control" type="text" name="nickname" required>
                                </div>
                            </div>
                            <hr>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input class="form-control" type="text" name="name" required>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="resident">Resident Number</label>
                                    <input class="form-control" type="text" name="resident" required>
                                </div>
                            </div>
                            <hr>
                            <button type="button" id="btnAddr" class="mb-3 btn btn-sm btn-secondary">주소검색</button>

                            <div class="row mb-3">
                                <div class="col-md-4">
                                    <div class="mb-3 mb-md-0">
                                        <input class="form-control" type="text" id="zipcode" name="zipcode" placeholder="zipcode"/>
                                    </div>
                                </div>

                                <div class="col-md-8">
                                    <div class="mb-3 mb-md-0">
                                        <input class="form-control" type="text" id="roadAddress" name="roadAddress" placeholder="roadAddress"/>
                                    </div>
                                </div>

                                <div class="col-md-12 mt-2">
                                    <div class="mb-3 mb-md-0">
                                        <input class="form-control" type="text" id="address" name="address" placeholder="address"/>
                                    </div>
                                </div>

                                <div class="col-md-12 mt-2">
                                    <div class="mb-3 mb-md-0">
                                        <input class="form-control" type="text" id="detailAddress" name="detailAddress" placeholder="detailAddress"/>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="mb-3 mb-md-0">
                                        <input class="form-control" type="hidden" id="latitude" name="latitude" placeholder="lat"/>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="mb-3 mb-md-0">
                                        <input class="form-control" type="hidden" id="longitude" name="longitude" placeholder="long"/>
                                    </div>
                                </div>

                            </div>

                            <div id="map" style="width:500px;height:350px;margin:0 auto; border:1px solid; display:none"></div> <!-- 지도틀 -->

                            <hr>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="account">Account</label>
                                    <input class="form-control" type="text" name="account" required>
	                                <button class="btn btn-sm btn-secondary mt-2" type="button">인증</button>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="phone">Phone Number</label>
                                    <input class="form-control" type="text" name="phone" required>
	                                <button class="btn btn-sm btn-secondary mt-2" type="button">인증</button>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input class="form-control" type="text" name="email" required>
	                                <button class="btn btn-sm btn-secondary mt-2" type="button">인증</button>
                                </div>
                            </div>
                            <hr>
                            <div class="button">
                                <button class="btn" type="submit">Register</button>
                            </div>
                            <p class="outer-link">Already have an account? <a href="/member/login">Login Now</a>
                            </p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Account Register Area -->

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=53c384805130c9bc4f683d53b2fe930a&libraries=services"></script>

    <script>
        $("#btnAddr").click(function() {
            new daum.Postcode({
                oncomplete: function(data) {
                    
                    new kakao.maps.services.Geocoder().addressSearch(data.roadAddress, function(result, status){
                        if(status === kakao.maps.services.Status.OK) {
                            $("#roadAddress").val(data.roadAddress);
                            $("#address").val(data.jibunAddress);
                            $("#zipcode").val(data.zonecode);
                            $("#latitude").val(result[0].y);	            		
                            $("#longitude").val(result[0].x);	
                                                        
                           $("#map").slideDown(200, function() {
                              var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                                mapOption = {
                                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                                    level: 3 // 지도의 확대 레벨
                                };  
                                var map = new kakao.maps.Map(mapContainer, mapOption);
                                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    
                               // 결과값으로 받은 위치를 마커로 표시합니다
                               var marker = new kakao.maps.Marker({
                                   map: map,
                                   position: coords
                               });
    
                               // 인포윈도우로 장소에 대한 설명을 표시합니다
                               var infowindow = new kakao.maps.InfoWindow({
                                   content: '<div style="width:150px;text-align:center;padding:6px 0;">'+ data.roadAddress +'</div>'
                               });
                               infowindow.open(map, marker);
    
                               // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                               map.setCenter(coords);
    
                               var geocoder = new kakao.maps.services.Geocoder();
                            
                               kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
                                    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
                                        if (status === kakao.maps.services.Status.OK) {
                                            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
                                            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
                                            
                                            var content = '<div class="bAddr">' +
                                                            '<span class="title">법정동 주소정보</span>' + 
                                                            detailAddr + 
                                                        '</div>';
    
                                            // 마커를 클릭한 위치에 표시합니다 
                                            marker.setPosition(mouseEvent.latLng);
                                            marker.setMap(map);
    
                                            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                                            infowindow.setContent(content);
                                            infowindow.open(map, marker);
                                            data.roadAddress = result[0].road_address;
                                                var coords = new kakao.maps.Coords(mouseEvent.latLng.La, mouseEvent.latLng.Ma);
                                                if(result[0].road_address) {
                                                    $("#roadAddress").val(result[0].road_address.address_name);
                                                    $("#zipcode").val(result[0].road_address.zone_no);
                                                    
                                                } else {
                                                    $("#roadAddress").val("");
                                                    $("#zipcode").val("");
                                                }
    
                                                 $("#address").val(result[0].address.address_name);
                                                    $("#latitude").val(coords.Ma);	            		
                                                    $("#longitude").val(coords.La);	
                                        }   
                                    });
                                });
    
                                function searchAddrFromCoords(coords, callback) {
                                    // 좌표로 행정동 주소 정보를 요청합니다
                                    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
                                }
    
                                function searchDetailAddrFromCoords(coords, callback) {
                                    // 좌표로 법정동 상세 주소 정보를 요청합니다
                                    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
                                }
                           }); // 맵 관련 끝
                           
                        }
                    })
                }
            }).open();
    
        })
    </script>

    <script>
        // 유효성 검사
        
    </script>

    <jsp:include page="../common/footer.jsp"/>
</body>

</html>