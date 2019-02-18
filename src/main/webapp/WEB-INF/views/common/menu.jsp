<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="/main">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fab fa-cloudversify"></i>
		</div>
		<div class="sidebar-brand-text mx-3">Web-Cloud</div>
	</a>
	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<li class="nav-item active">
		<a class="nav-link" href="/main">
			<i class="far fa-hdd"></i> <span>Storage</span>
		</a>
	</li>

	<!-- Divider -->
	<hr class="sidebar-divider">
	
	<!-- Heading -->
	<div class="sidebar-heading">Board</div>
	
	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item">
		<a class="nav-link collapsed"
			 href="#" 
			 data-toggle="collapse" 
			 data-target="#collapseTwo" 
			 aria-expanded="true"
			 aria-controls="collapseTwo"> 
			<i class="fas fa-fw fa-calendar-check"></i> <span>Board</span>
		</a>
		<div id="collapseTwo"
				 class="collapse" 
				 aria-labelledby="headingTwo"
				 data-parent="#accordionSidebar">
			<div class="bg-gray-200 py-2 collapse-inner rounded">
				<h6 class="collapse-header">Custom Components:</h6>
				<a class="collapse-item" href="/board/notice/list">Notice</a> 
				<a class="collapse-item" href="/board/qna/list">Q&A</a>
			</div>
		</div>
	</li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">Config</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<!-- Nav Item - Charts -->
	<sec:authorize access="hasRole('ROLE_USER')">
		<li class="nav-item">
			<a class="nav-link" href="/mypage">
				<i class="fas fa-fw fa-user-cog"></i> <span>Mypage</span>
			</a>
		</li>
	</sec:authorize>

	<!-- Nav Item - Tables -->
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<li class="nav-item">
			<a class="nav-link" href="/manage"> 
				<i class="fas fa-fw fa-cog"></i> <span>Manage</span>
			</a>
		</li>
	</sec:authorize>
	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">
	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>
</ul>
<!-- End of Sidebar -->

