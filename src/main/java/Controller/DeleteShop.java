package Controller;

import Model.Shop;
import Services.ShopService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteShop", value = "/admin/deleteShop")
public class DeleteShop extends HttpServlet {
    private ShopService shopService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.shopService = new ShopService("shop");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String type = request.getParameter("type");
        if(type == null) {
            response.sendRedirect("/admin");
            return;
        }
        if(id == null) {
            response.sendRedirect("/admin/shop?type=" + type);
            return;
        }

        this.shopService.delete(id, Shop.class);

        response.sendRedirect("/admin/shop?type=" + type);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
