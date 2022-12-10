package Controller;

import DTO.AuthorizationData;
import DTO.CartDTO;
import Model.Product;
import Model.User;
import Services.ProductService;
import Services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AddToCartController", value = "/addToCart")
public class AddToCartController extends HttpServlet {

    private ProductService productService;
    private UserService userService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.productService = new ProductService("product");
        this.userService = new UserService("users");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        Product product = this.productService.findById(id, Product.class);

        HttpSession session = request.getSession(true);
        AuthorizationData authorizationData = (session.getAttribute("authorization") == null)
                ? new AuthorizationData() : (AuthorizationData) session.getAttribute("authorization");
        if((boolean) request.getAttribute("logged")) {
            CartDTO cart = new CartDTO(product.getName(), product.getId(), product.getPrice());
            authorizationData.addToCart(cart);
            this.userService.setCart(authorizationData.getId(), cart.getId(), cart.getAmount());
        }else {
            authorizationData.addToCart(new CartDTO(product.getName(), product.getId(), product.getPrice()));

        }
        session.setAttribute("authorization", authorizationData);
        response.sendRedirect("/products");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
