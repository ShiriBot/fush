<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="col-md-3 left_col">
	<div class="left_col scroll-view">
		<div class="navbar nav_title">
			<a class="site_title" href="manage_index.jsp">
				<i class="fa fa-paw"> <!-- ::before --> </i> 
				<span> MANAGEMENT </span>
			</a>
		</div>
		<div class="clearfix"> <!-- ::after --> </div>
		<div class="profile clearfix">
			<div class="profile_pic">
				<img class="img-circle profile_img" src="assets/images/profile_sample.png" alt="">
			</div>
			<div class="profile_info">
				<span> Welcome, </span>
				<h2>MANAGER_NAME</h2>
			</div>
		</div>
		<br>
		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
			<div class="menu_section active">
				<h3>
					관리메뉴
				</h3>
				<ul class="nav side-menu">
					<li>
						<a href="manage_main.jsp">
							<i class="fa fa-house"></i>
							HOME
							<!-- 이 이하 주석은 사이드 메뉴가 필요할 경우 쓸 것들 -->
	<!-- 						<span class="fa fa-chevron-down"></span> -->
						</a>
	<!--					<ul class="nav child_menu">
							<li>
								<a href="#">하위메뉴이름</a>
							</li>
						</ul> -->
					</li>
					<li>
						<a href="#">
							<i class="fa fa-users"></i>
							Member
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fa fa-paintbrush"></i>
							Arts
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fa fa-hashtag"></i>
							Tags
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fa fa-bars-progress"></i>
							Category
						</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="sidebar-footer hidden-small">
			<a data-toggle="tooltip" data-placement="top" data-origin-title="Settings">
				<span class="glyphicon glyphicon-cog"> </span>
			</a>
			<a data-toggle="tooltip" data-placement="top" data-origin-title="FullScreen">
				<span class="glyphicon glyphicon-fullscreen"> </span>
			</a>
			<a data-toggle="tooltip" data-placement="top" data-origin-title="Lock">
				<span class="glyphicon glyphicon-eye-close"> </span>
			</a>
			<a data-toggle="tooltip" data-placement="top" href="#" data-origin-title="Logout">
				<span class="glyphicon glyphicon-off"> </span>
			</a>
		</div>
	</div>
</div>