<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 26/11/2022
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<menu class="head_top">
  <div class="container-fluid container_menu">
    <div class="row">
      <div id="menu_btn-responsive" class="menu_btn-responsive col"><i class="fa-solid fa-bars"></i></div>
      <ul class="menu_list col">
        <li class="menu_list_item menu_list-search hidden_item">
          <form action="">
            <div class="input-line">
              <input type="email" placeholder="Search your keywords">
              <button type="submit">
                <i class="fa-solid fa-magnifying-glass"></i>
              </button>
            </div>
          </form>
        </li>
        <li class="menu_list_item"><a href="#">Home</a></li>
        <li class="menu_list_item"><a href="#">Products</a></li>
        <li class="menu_list_item"><a href="#">About Us</a> </li>
        <li class="menu_list_item"><a href="#">Contact</a></li>
        <li class="menu_list_item hidden_item"><a href="#">
          <i class="fa-regular fa-user action-icon color-red"></i>
          <span class="btn-content poppins">Login</span>
        </a></li>
      </ul>
      <div class="menu_logo col">
        <h2><a class="poppins" href="#">FURNITURE</a></h2>
      </div>
      <ul class="menu_action col">
        <li class="menu_search menu_action_item">
          <a href="#">
            <button class="btn-icon bgr-red br-50 color-white" id="triggerSearchBar"><i
                    class="fa-solid fa-magnifying-glass"></i></button>
          </a>
        </li>

        <li class="menu_login menu_action_item">
          <button class="btn-icon-cb-text bd-white-02 rounded-pill">
            <a href="#" class="color-white">
              <i class="fa-regular fa-user action-icon"></i>
              <span class="btn-content poppins">Login</span>
            </a>
          </button>
        </li>

        <li class="menu_cart menu_action_item">
          <button class="btn-badge">
            <a href="#" class="color-white">
              <i class="bi bi-bag"></i>
              <span class="badge">4</span>
            </a>
          </button>
        </li>
      </ul>
    </div>
  </div>
</menu>
