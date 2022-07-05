<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <!-- Sidebar - Brand -->
        	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="index">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">HoneyBee</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="index">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                관리페이지
            </div>

            <!-- Member -->
            <li class="nav-item">
                <a class="nav-link" href="${appRoot }/admin/member">
                    <i class="fas fa-fw fa-user"></i>
                    <span>회원관리</span></a>
            </li>

            <!-- Board -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-clipboard"></i>
                    <span>게시판관리</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">게시판:</h6>
                        <a class="collapse-item" href="${appRoot }/admin/donation">기부게시판</a>
                        <a class="collapse-item" href="${appRoot }/admin/talent">재능판매게시판</a>
                        <a class="collapse-item" href="${appRoot }/admin/meeting">모임게시판</a>
                        <a class="collapse-item" href="${appRoot }/admin/market">기부마켓</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                고객센터
            </div>

            <!-- FAQ -->
            <li class="nav-item">
                <a class="nav-link" href="${appRoot }/admin/faq">
                    <i class="fas fa-fw fa-q"></i>
                    <span>1:1문의</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->