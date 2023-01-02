<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Category" %>
<%@ page import="Model.Pattern" %>
<%@ page import="Model.Color" %>
<%@ page import="java.text.DecimalFormat" %><%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 01/12/2022
  Time: 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<%
  ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
  ArrayList<Pattern> patterns = (ArrayList<Pattern>) request.getAttribute("patterns");
  ArrayList<Color> colors = (ArrayList<Color>) request.getAttribute("colors");
  Double priceMin = (Double) request.getAttribute("priceMin");
  Double priceMax = (Double) request.getAttribute("priceMax");
  Category filterCat = (request.getAttribute("filterCat") == null ) ? null : (Category) request.getAttribute("filterCat");
  Color filterColor = (request.getAttribute("filterColor") == null) ? null : (Color) request.getAttribute("filterColor");
  Pattern filterPattern = (request.getAttribute("filterPattern") == null) ? null : (Pattern) request.getAttribute("filterPattern");
  String filterPrice = (request.getAttribute("filterPrice") == null) ? null : request.getAttribute("filterPrice").toString();
%>
<div class="filter-product container-fluid mt-3">
  <div class="filter-btn" data-toggle="collapse" data-target="#collapseExample">
    <button class="btn-icon bgr-red br-50 color-white"><i class="bi bi-funnel"></i></button>
    <button class="filter-btn_text color-black">BỘ LỌC</button>
  </div>

    <div class="filter-boards bgr-white collapse" id="collapseExample">
      <div class="filter-boards_close hover-text-red" data-toggle="collapse" data-target="#collapseExample">
        <i class="fa-solid fa-xmark"></i>
        Hide Filters
      </div>

      <div class="filter-boards_categories row">
        <div class="filter-boards_category col-12 col-lg">
          <div class="filter-boards_category-tittle">DANH MỤC</div>
          <div class="filter-boards_category-options btn-groups">
            <form action="${pageContext.request.contextPath}/products">
              <c:forEach items="<%=categories%>" var="category">
                <div class="options-item"><button name="category" value="${category.id}">${category.name}</button></div>
              </c:forEach>
            </form>
          </div>
        </div>
        <div class="filter-boards_category col-12 col-lg">
          <div class="filter-boards_category-tittle">MÀU SẮC</div>
          <div class="filter-boards_category-options">
            <div class="options-item">
              <form action="${pageContext.request.contextPath}/products">
                <c:forEach items="<%=colors%>" var="color">
                  <button name="color" value="${color.id}" class="button-color col" style="--color: ${color.value}"></button>
                </c:forEach>
              </form>
            </div>
          </div>
        </div>
        <div class="filter-boards_category col-12 col-lg">
          <div class="filter-boards_category-tittle">KIỂU DÁNG</div>
          <div class="filter-boards_category-options btn-groups">
            <form action="${pageContext.request.contextPath}/products">
              <c:forEach items="<%=patterns%>" var="pattern">
                <div class="options-item"><button name="pattern" value="${pattern.id}"><c:out value="${pattern.name}"/></button></div>
              </c:forEach>
            </form>
          </div>
        </div>
        <div class="filter-boards_category col-12 col-lg">
          <div class="filter-boards_category-tittle">GIÁ</div>
          <div class="filter-boards_category-options">
            <div class="options-item">
              <div class="filter-price-container">
                <div class="filter-bar-container">
                  <div class="slider-range" id="slider-range"></div>
                  <span class="state-filter-left" id="state-thumb-left"></span>
                  <span class="state-filter-right" id="state-thumb-right"></span>
                </div>
                <form action="${pageContext.request.contextPath}/products">
                  <div class="price-slider-amount">

                    <input id="range-min" type="range" name="price-min" min="<%=priceMin%>" max="<%=priceMax%>" value="<%=priceMin%>" step="100000">
                    <input id="range-max" type="range" name="price-max" min="<%=priceMin%>" max="<%=priceMax%>" value="<%=priceMax%>" step="100000">
                    <div class="price-slider-amount">
                      <div class="price-label monts">
                        Price:
                        <span class="from-price monts" id="min-price"><%=new DecimalFormat("#").format(priceMin)%> VNĐ</span>
                        -
                        <span class="toPrice monts" id="max-price"><%=new DecimalFormat("#").format(priceMax)%> VNĐ</span>
                      </div>
                      <button class="btn-text-lg bgr-black hover-bg-red">LỌC</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="filter-results mt-3 ml-2">
      <div id="clear-filter"><a href="${pageContext.request.contextPath}/products" class="color-black hover-text-red"><i class="fa-solid fa-xmark"></i>
        Xóa lọc</a></div>
      <div class="filter-result-item">
        <c:if test="<%=filterCat != null%>">
          <span class="result-item_type">Danh mục:</span>
          <button class="result-item_content btn-sm bgr-red hover-bg-black result-item_clear"><%=filterCat.getName()%></button>
        </c:if>
        <c:if test="<%=filterColor != null%>">
          <span class="result-item_type">Màu sắc:</span>
          <button class="result-item_content btn-sm bgr-red hover-bg-black result-item_clear"><%=filterColor.getName()%></button>
        </c:if>
        <c:if test="<%=filterPattern != null%>">
          <span class="result-item_type">Kiểu dáng:</span>
          <button class="result-item_content btn-sm bgr-red hover-bg-black result-item_clear"><%=filterPattern.getName()%></button>
        </c:if>
        <c:if test="<%=filterPrice != null%>">
          <span class="result-item_type">Gía:</span>
          <button class="result-item_content btn-sm bgr-red hover-bg-black result-item_clear"><%=filterPrice%> VNĐ</button>
        </c:if>
      </div>
    </div>
</div>