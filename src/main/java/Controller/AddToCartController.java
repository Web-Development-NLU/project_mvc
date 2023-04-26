package Controller;

import DTO.AuthorizationData;
import DTO.CartDTO;
import Model.Cart;
import Model.Product;
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

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProduct = request.getParameter("id");
        String pattern = request.getParameter("pattern");
        String color = request.getParameter("color");
        HttpSession session = request.getSession(true);
        session.removeAttribute("error" + idProduct);
        Product product = this.productService.findById(idProduct, Product.class);
        boolean hasPattern = this.productService.getPatterns(product.getId()).size() > 0;
        boolean hasColor = this.productService.getColors(product.getId()).size() > 0;
        if (hasPattern && hasColor) {
            if (pattern == null || color == null) {
                session.setAttribute("error" + idProduct, "Vui lòng chọn mẫu và màu sắc!");
                response.sendRedirect("/product?id=" + idProduct);
                return;
            }
        } else if (hasPattern) {
            if (pattern == null) {

                session.setAttribute("error" + idProduct, "Vui lòng chọn mẫu!");

                response.sendRedirect("/product?id=" + idProduct);
                return;
            }
        } else if (hasColor) {
            if (color == null) {
                session.setAttribute("error" + idProduct, "Vui lòng chọn màu sắc!");
                response.sendRedirect("/product?id=" + idProduct);
                return;
            }
        }

        int amount = request.getParameter("amount") != null ? Integer.parseInt(request.getParameter("amount")) : 0;
        if (amount <= 0) response.sendRedirect("/product?id=" + idProduct);

        AuthorizationData authorizationData = (session.getAttribute("authorization") == null)
                ? new AuthorizationData() : (AuthorizationData) session.getAttribute("authorization");
        String image = product.getThumbnail().split(",")[0];
        if ((boolean) request.getAttribute("logged")) {
            Cart cart = new Cart(
                    authorizationData.getId(),
                    product.getId(),
                    pattern,
                    color,
                    amount,
                    image
            );

            this.userService.setCart(authorizationData.getId(), cart);
            authorizationData.setCarts((ArrayList<CartDTO>) this.userService.getCart(authorizationData.getId()));
        } else {
            authorizationData.addToCart(new CartDTO(
                    product.getName(),
                    amount,
                    product.getId(),
                    product.getPrice(),
                    product.getCategoryId(),
                    color,
                    pattern,
                    image
            ));
        }
        session.setAttribute("authorization", authorizationData);
        response.sendRedirect("/product?id=" + idProduct);
    }
}
