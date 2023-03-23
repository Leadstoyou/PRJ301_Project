<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Header Section Begin -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__left">
                        <ul>
                            <c:if test="${sessionScope.acc != null}">
                                <li><i class="fa fa-home fa-fw"></i> ${sessionScope.acc.name}</li>
                                <li>(,,◕　⋏　◕,,)| ┬─┬(◕‿◕♡)  ( ◑‿◑)ɔ┏🍟--🍔┑٩(^◡^ )</li>
                                </c:if>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">
                            <a href="https://www.facebook.com/vaycanh.thien/"><i class="fa fa-facebook" ></i></a>
                            <a href="https://www.facebook.com/vaycanh.thien/"><i class="fa fa-twitter"></i></a>
                            <a href="https://www.facebook.com/vaycanh.thien/"><i class="fa fa-linkedin"></i></a>
                            <a href="https://www.facebook.com/vaycanh.thien/"><i class="fa fa-pinterest-p"></i></a>
                        </div>
                        <c:if test="${sessionScope.acc.role == 'admin'}">
                            <div class="header__top__right__language">
                                <img src="Image/admin_logo.png" alt="">
                                <div>${sessionScope.acc.role}</div>
                                <span class="arrow_carrot-down"></span>
                                <ul>
                                    <li><a href="manager?index=1">Food</a></li>
                                    <li><a href="managerblog?index=1">Blog</a></li>
                                    <li><a href="managerbill">Bill</a></li>
                                    <li><a href="managerorder">Order</a></li>
                                    <li><a href="managerpayment">Payment</a></li>

                                </ul>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.acc.role == 'customer'}">
                            <div class="header__top__right__language">
                                <img src="Image/admin_logo.png" alt="">
                                <div>${sessionScope.acc.role}</div>
                                <span class="arrow_carrot-down"></span>
                                <ul>
                                    <li><a href="managerbill">Bill</a></li>
                                    <li><a href="managerorder">Order</a></li>
                                    <li><a href="managerpayment" >Payment</a></li>
                                </ul>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.acc != null}">
                            <div class="header__top__right__auth">
                                <a href="logout"><i class="fa fa-user"></i> Logout</a>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.acc == null}">
                            <div class="header__top__right__auth">
                                <a href="login.jsp"><i class="fa fa-user"></i> Login</a>
                            </div>
                        </c:if>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="list"><img src="Image/genshin_logo.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <li class="active"><a href="list">Home</a></li>
                        <li><a href="ShopGrid?cid=1">Shop</a></li>
                        <li><a href="#">Pages</a>
                            <ul class="header__menu__dropdown">
                                <c:if test="${sessionScope.acc != null}">
                                    <li><a href="detail?fid=1">Shop Details</a></li>
                                    <li><a href="shoppingcart">Shoping Cart</a></li>

                                </c:if>
                                <li><a href="blog?bid=7">Blog Details</a></li>
                            </ul>
                        </li>
                        <li><a href="allblog2">Blog</a></li>
                        <li><a href="Contact.jsp">Contact</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <c:if test="${sessionScope.acc != null}">
                    <div class="header__cart">
                        <ul>
                            <li><a href="ShopGridLiked"><i class="fa fa-heart"></i> <span>${sessionScope.icon.countLiked}</span></a></li>
                            <li><a href="shoppingcart"><i class="fa fa-shopping-bag"></i> <span>${sessionScope.icon.countAddCart}</span></a></li>
                        </ul>
                        <div class="header__cart__price">Value: <span>${sessionScope.icon.currentMoney}</span></div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</header>
<!-- Header Section End -->
