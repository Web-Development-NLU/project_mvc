package Controller;

import DTO.AuthorizationData;
import DTO.CartDTO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        if((boolean) request.getAttribute("logged")) {
             ArrayList<CartDTO> carts = ((AuthorizationData) session.getAttribute("authorization")).getCarts();
             if(carts.isEmpty()) {

             }
        }else {
            AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("authorization");
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
        String id = request.getParameter("id");
        HttpSession session = request.getSession(true);
        AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("authorization");
        if(Objects.equals(action, "DELETE")) {
            authorizationData.removeCart(id);
        }else {
            int amount = Integer.parseInt(request.getParameter("amount"));
            authorizationData.updateCart(id, amount);
        }

        session.setAttribute("authorization", authorizationData);

        response.sendRedirect("/cart");
    }
}
