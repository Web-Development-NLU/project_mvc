<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 02/12/2022
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="content-reviews" class="tab-pane fade" role="tabpanel" aria-labelledby="tab-reviews">
  <p class="review-note"></p>
  <form action="">
    <div class="review-point">
      <div class="radio-icon">
        <label>
          <input type="radio" name="point">
          <i class="fa-regular fa-star"></i>
        </label>
      </div>
      <div class="radio-icon">
        <label>
          <input type="radio" name="point">
          <i class="fa-regular fa-star"></i>
        </label>
      </div>
      <div class="radio-icon">
        <label>
          <input type="radio" name="point">
          <i class="fa-regular fa-star"></i>
        </label>
      </div>
      <div class="radio-icon">
        <label>
          <input type="radio" name="point">
          <i class="fa-regular fa-star"></i>
        </label>
      </div>
      <div class="radio-icon">
        <label>
          <input type="radio" name="point">
          <i class="fa-regular fa-star"></i>
        </label>
      </div>
      <div class="title monts">YOUR RATING*</div>
    </div>
    <br>
    <div class="review-box row">
      <div class="review-col-2 col-12 col-md">
        <div class="input-secondary">
          <label for="email">Your comment *</label>
          <textarea class="text-area" name="content"></textarea>
        </div>
      </div>
      <div class="review-col-1 col-12 col-md">
        <div class="input-secondary">
          <label for="ip_name">Your Name *</label>
          <input type="text" id="ip_name" name="name">
        </div>
        <br>
        <div class="input-secondary">
          <label for="email">Your Email *</label>
          <input type="email" id="email" name="email">
        </div>
        <div class="review-submit">
          <br>
          <a href="#"><button class="btn-text-lg bgr-black">SUBMIT</button></a>
        </div>
      </div>
    </div>
    <div class="review-options">
      <div class="checkbox">
        <br>
        <input type="checkbox" name="isSave" id="check_box">
        <label for="check_box">Save my name, email, and website in this browser for the next time I
          comment.</label>
      </div>
    </div>
  </form>
  <div class="reviews-list">
    <div class="reviews-list_title">Other Reviews</div>
    <div class="card-review">
      <div class="card-review-info">
        <img src="https://secure.gravatar.com/avatar/f5a3778cab66f714ab062b54743030aa?s=60&d=mm&r=g" alt=""
             class="avatar">
        <div class="cr-info_personal">
          <div class="info_personal-name monts">YASOU<span class="star-rate" data-rate="4"></span></div>
          <div class="info_personal-date monts">November 16, 2021</div>
        </div>
      </div>
      <div class="card-review-content">
        <p>Muy buena relación calidad precio. Queda muy elegante y moderno.el servicio excelente.</p>
      </div>
    </div>
    <div class="card-review">
      <div class="card-review-info">
        <img src="https://secure.gravatar.com/avatar/f5a3778cab66f714ab062b54743030aa?s=60&d=mm&r=g" alt=""
             class="avatar">
        <div class="cr-info_personal">
          <div class="info_personal-name monts">YASOU<span class="star-rate" data-rate="4"></span></div>
          <div class="info_personal-date monts">November 16, 2021</div>
        </div>
      </div>
      <div class="card-review-content">
        <p>Muy buena relación calidad precio. Queda muy elegante y moderno.el servicio excelente.</p>
      </div>
    </div>
    <div class="card-review">
      <div class="card-review-info">
        <img src="https://secure.gravatar.com/avatar/f5a3778cab66f714ab062b54743030aa?s=60&d=mm&r=g" alt=""
             class="avatar">
        <div class="cr-info_personal">
          <div class="info_personal-name monts">YASOU<span class="star-rate" data-rate="4"></span></div>
          <div class="info_personal-date monts">November 16, 2021</div>
        </div>
      </div>
      <div class="card-review-content">
        <p>Muy buena relación calidad precio. Queda muy elegante y moderno.el servicio excelente.</p>
      </div>
    </div>
  </div>
</div>