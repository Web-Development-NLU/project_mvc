package Controller;

import DTO.AuthorizationData;
import DTO.CartDTO;
import Model.Logger;
import Services.LoggerService;
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
    private LoggerService loggerService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.userService = new UserService("users");
        this.loggerService = new LoggerService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("authorization");
        if ((boolean) request.getAttribute("logged")) {
            ArrayList<CartDTO> carts = authorizationData.getCarts();
            request.setAttribute("carts", carts);
        } else {
            if (authorizationData == null) {
                request.setAttribute("carts", new ArrayList<CartDTO>());
            } else {
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
        Logger logger = new Logger(
                request.getMethod(),
                request.getRequestURI(),
                null,
                request.getHeader("USER-AGENT")
        );
        AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("authorization");
        if (Objects.equals(action, "DELETE")) {
            logger.setData("Action="+ action + ",cardId=" + id);
            logger.setStatus(200);
            logger.setMessage("SUCCESSFULLY");
            if ((boolean) request.getAttribute("logged")) {
                this.userService.deleteCart(id);
                authorizationData.setCarts((ArrayList<CartDTO>) this.userService.getCart(authorizationData.getId()));
                logger.setUserId(authorizationData.getId());
            } else {
                authorizationData.removeCart(id);
            }
            this.loggerService.log(logger);

        } else {
            logger.setData("Action=UPDATE" + ",cardId=" + id);
            int amount = Integer.parseInt(request.getParameter("amount"));
            if (amount
                    < 1) {
                session.setAttribute("authorization", authorizationData);
                response.sendRedirect("/cart");
                logger.setStatus(400);
                logger.setMessage("AMOUNT_IS_LESS_THAN_1");
                this.loggerService.log(logger);
                return;
            }
            logger.setStatus(200);
            logger.setMessage("SUCCESSFULLY");
            if ((boolean) request.getAttribute("logged")) {
                this.userService.updateCart(id, amount);
                authorizationData.setCarts((ArrayList<CartDTO>) this.userService.getCart(authorizationData.getId()));
                logger.setUserId(authorizationData.getId());
            } else {
                authorizationData.updateCart(id, amount);
            }
            this.loggerService.log(logger);
        }

        session.setAttribute("authorization", authorizationData);

        response.sendRedirect("/cart");
    }
}
