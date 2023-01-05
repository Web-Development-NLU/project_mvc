package Controller;

import Model.Review;
import Model.User;
import Services.ReviewService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ReviewController", value = "/review")
public class ReviewController extends HttpServlet {

    private ReviewService reviewService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.reviewService = new ReviewService("review");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getAttribute("user");
        String productId = request.getParameter("product");
        int point = Integer.parseInt(request.getParameter("point"));
        String comment = request.getParameter("comment");
        Review review;

        if(user != null) {
             review = new Review(user.getId(), productId, comment, point, user.getFirstName() + user.getLastName(), user.getEmail());
        }else {
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            review = new Review(productId, name, email, comment, point);
        }

        this.reviewService.create(review);

        response.sendRedirect("/product?id=" + productId);
    }
}
