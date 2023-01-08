package Controller;

import Model.Shop;
import Services.ShopService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CreateShop", value = "/admin/createShop")
public class CreateShop extends HttpServlet {

    private ShopService shopService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.shopService = new ShopService("shop");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        if(type == null) {
            response.sendRedirect("/admin");
            return;
        }

        request.setAttribute("type", type);
        request.getRequestDispatcher("/jsp/admin/createShop.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");

        if(type == null) {
            response.sendRedirect("/admin");
            return;
        }
        Shop model = new Shop(
                request.getParameter("name"),
                request.getParameter("image"),
                request.getParameter("redirect"),
                Integer.parseInt(type)
        );

        this.shopService.create(model);

        response.sendRedirect("/admin/shop?type=" + type);

    }
}
