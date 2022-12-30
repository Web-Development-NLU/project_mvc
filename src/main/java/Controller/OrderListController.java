package Controller;

import DTO.OrderDTO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "oderList", value = "/orderList")
public class OrderListController extends HttpServlet {
    @Override
    public void init() throws ServletException {
        super.init();

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean logged = (boolean) request.getAttribute("logged");
        if(!logged) {
            response.sendRedirect("/");
        }else {
//            ArrayList<OrderDTO> orders = ;
            request.getRequestDispatcher("/jsp/client/orderList.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
