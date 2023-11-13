<%-- 
    Document   : sidebar
    Created on : Oct 25, 2023, 5:38:58 PM
    Author     : pasin
--%>

<%@page import="dto.UserData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    UserData userData = (UserData) session.getAttribute("user");
%>
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-light-olive elevation-4" style="background-color: #EAF9E7; ">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
        <img src="dist/img/logo.jpg" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text text-color" style="font-weight: bold">${BASE_URL}</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block text-color" style=" font-weight: bold"><%= userData.getFname()+" "+userData.getLname() %></a>
            </div>
        </div>

        <!-- SidebarSearch Form -->
        <div class="form-inline">
            <div class="input-group" data-widget="sidebar-search">
                <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                <div class="input-group-append">
                    <button class="btn btn-sidebar">
                        <i class="fas fa-search fa-fw"></i>
                    </button>
                </div>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
                     with font-awesome or any other icon font library -->
                <li class="nav-item ">
                    <a href="#" class="nav-link active">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Dashboard
                        </p>
                    </a>
                     
                </li>
                
                
               
               
                
                <li class="nav-item menu-open">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-shield-alt text-color"></i>
                        <p class="text-color">
                            System Users
                            <i class="fas fa-angle-left right text-color"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="addUser.jsp" class="nav-link">
                                <i class="fas fa-plus nav-icon text-color"></i>
                                <p  class="text-color">Add New</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="viewUsers.jsp" class="nav-link">
                                <i class="far fa-eye nav-icon text-color"></i>
                                <p  class="text-color">View All</p>
                            </a>
                        </li>
                        
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-th-large text-color"></i>
                        <p class="text-color">
                            Category & Brand
                            <i class="fas fa-angle-left right text-color"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="category.jsp" class="nav-link">
                                <i class="fas fa-tags nav-icon text-color"></i>
                                <p  class="text-color">Category</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="subCategory.jsp" class="nav-link">
                                <i class="fas fa-code-branch nav-icon text-color"></i>
                                <p  class="text-color">Brand / Sub Category</p>
                            </a>
                        </li>
                        
                    </ul>
                </li>
              
                
               
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>