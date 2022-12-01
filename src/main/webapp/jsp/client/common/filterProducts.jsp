<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 01/12/2022
  Time: 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="filter-product container-fluid mt-3">
  <div class="filter-btn" data-toggle="collapse" data-target="#collapseExample">
    <button class="btn-icon bgr-red br-50 color-white"><i class="bi bi-funnel"></i></button>
    <button class="filter-btn_text color-black">FILTER</button>
  </div>
  <form action="">
    <div class="filter-boards bgr-white collapse" id="collapseExample">
      <div class="filter-boards_close hover-text-red" data-toggle="collapse" data-target="#collapseExample">
        <i class="fa-solid fa-xmark"></i>
        Hide Filters
      </div>

      <div class="filter-boards_categories row">
        <div class="filter-boards_category col-12 col-lg">
          <div class="filter-boards_category-tittle">CATEGORIES</div>
          <div class="filter-boards_category-options btn-groups">
            <div class="options-item"><button>Bedroom <span>(4)</span></button></div>
            <div class="options-item"><button>Chair <span>(10)</span></button></div>
            <div class="options-item"><button>Desk <span>(6)</span></button></div>
            <div class="options-item"><button>Homewares <span>(15)</span></button></div>
            <div class="options-item"><button>Lighting <span>(6)</span></button></div>
            <div class="options-item"><button>Storage <span>(5)</span></button></div>
          </div>
        </div>
        <div class="filter-boards_category col-12 col-lg">
          <div class="filter-boards_category-tittle">COLOR</div>
          <div class="filter-boards_category-options">
            <div class="options-item">
              <button class="button-color col" style="--color: red"></button>
              <button class="button-color col" style="--color: red"></button>
              <button class="button-color col" style="--color: red"></button>
              <button class="button-color col" style="--color: red"></button>
              <button class="button-color col" style="--color: red"></button>
              <button class="button-color col" style="--color: red"></button>
              <button class="button-color col" style="--color: red"></button>
              <button class="button-color col" style="--color: red"></button>
            </div>
          </div>
        </div>
        <div class="filter-boards_category col-12 col-lg">
          <div class="filter-boards_category-tittle">PATTERN</div>
          <div class="filter-boards_category-options btn-groups">
            <div class="options-item"><button name="pattern">Plastic <span>(6)</span></button></div>
            <div class="options-item"><button name="pattern">Plastic <span>(6)</span></button></div>
            <div class="options-item"><button name="pattern">Plastic <span>(6)</span></button></div>
            <div class="options-item"><button name="pattern">Plywood <span>(15)</span></button></div>
            <div class="options-item"><button name="pattern">Wood <span>(6)</span></button></div>
          </div>
        </div>
        <div class="filter-boards_category col-12 col-lg">
          <div class="filter-boards_category-tittle">TAGS</div>
          <div class="filter-boards_category-options btn-groups">
            <div class="options-item"><button>Fabic <span>(4)</span></button></div>
            <div class="options-item"><button>Leather <span>(10)</span></button></div>
            <div class="options-item"><button>Plastic <span>(6)</span></button></div>
            <div class="options-item"><button>Plywood <span>(15)</span></button></div>
            <div class="options-item"><button>Wood <span>(6)</span></button></div>
          </div>
        </div>
        <div class="filter-boards_category col-12 col-lg">
          <div class="filter-boards_category-tittle">FILTER BY PRICE</div>
          <div class="filter-boards_category-options">
            <div class="options-item">
              <div class="filter-price-container">
                <div class="filter-bar-container">
                  <div class="slider-range" id="slider-range"></div>
                  <span class="state-filter-left" id="state-thumb-left"></span>
                  <span class="state-filter-right" id="state-thumb-right"></span>
                </div>
                <div class="price-slider-amount">
                  <input id="range-min" type="range" min="140" max="969" value="140">
                  <input id="range-max" type="range" min="140" max="969" value="969">
                  <div class="price-slider-amount">
                    <div class="price-label poppins">
                      Price:
                      <span class="from-price poppins" id="min-price">140.00$</span>
                      -
                      <span class="toPrice poppins" id="max-price">969.00$</span>
                    </div>
                    <a href="#"><button class="btn-text-lg bgr-black hover-bg-red">FILTER</button></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="filter-results mt-3 ml-2">
      <div id="clear-filter"><a href="#" class="color-black hover-text-red"><i class="fa-solid fa-xmark"></i>
        clear</a></div>
      <div class="filter-result-item">
        <span class="result-item_type">Category:</span>
        <button class="result-item_content btn-sm bgr-red hover-bg-black result-item_clear">Bedroom <i
                class="fa-solid fa-xmark"></i></button>
      </div>
    </div>
  </form>
</div>