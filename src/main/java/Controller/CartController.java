package Controller;

import DTO.AuthorizationData;
import DTO.CartDTO;
import Services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.userService = new UserService("users");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("authorization");
        if((boolean) request.getAttribute("logged")) {
             ArrayList<CartDTO> carts = authorizationData.getCarts();
            request.setAttribute("carts", carts);
        }else {
            if(authorizationData == null) {
                request.setAttribute("carts", new ArrayList<CartDTO>());
            }else {
                request.setAttribute("carts", authorizationData.getCarts());
            }
        }

        request.getRequestDispatcher("/jsp/client/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession(true);
        AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("authorization");
        if(Objects.equals(action, "DELETE")) {
            if((boolean) request.getAttribute("logged")) {
                this.userService.deleteCart(id);
                authorizationData.setCarts((ArrayList<CartDTO>) this.userService.getCart(authorizationData.getId()));
            }else {
                authorizationData.removeCart(id);
            }
        }else {
            int amount = Integer.parseInt(request.getParameter("amount"));
            if((boolean) request.getAttribute("logged")) {
                this.userService.updateCart(id, amount);
                authorizationData.setCarts((ArrayList<CartDTO>) this.userService.getCart(authorizationData.getId()));
            }else {
                authorizationData.updateCart(id, amount);
            }
        }

        session.setAttribute("authorization", authorizationData);

        response.sendRedirect("/cart");
    }
}
