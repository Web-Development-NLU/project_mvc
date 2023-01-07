package Controller;

import Model.TypeShop;
import Services.ShopService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminShop", value = "/admin/shop")
public class AdminShop extends HttpServlet {

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

        request.setAttribute("shops", this.shopService.findByType(Integer.parseInt(type)));
        request.setAttribute("type", type);
        request.getRequestDispatcher("/jsp/admin/shop.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
