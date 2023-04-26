package Controller;

import DTO.AuthorizationData;
import DTO.OrderDTO;
import DTO.UpdateUserDTO;
import Model.User;
import Services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "OrderController", value = "/order")
public class OrderController extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.userService = new UserService("users");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cartNumber = (int) request.getAttribute("cartNumber");
        if (cartNumber == 0) {
            response.sendRedirect("/cart");
            return;
        }

        if(request.getParameter("error") != null) {
            request.setAttribute("error", "Hãy nhập đủ thông tin");
        }

        HttpSession session = request.getSession(true);
        AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("authorization");
        request.setAttribute("carts", authorizationData.getCarts());
        if(!((boolean) request.getAttribute("logged"))) {
            request.setAttribute("user", session.getAttribute("user"));
        }

        request.getRequestDispatcher("/jsp/client/order.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String country = request.getParameter("country");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        HttpSession session = request.getSession(true);
        System.out.print(city);
        AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("authorization");
        if (firstName.isEmpty() || lastName.isEmpty() || country.isEmpty() || city.isEmpty() || district.isEmpty() || address.isEmpty() || phone.isEmpty() || email.isEmpty()) {
            response.sendRedirect("/order?error=emptyInfo");
            return;
        }

        if((boolean) request.getAttribute("logged")) {

            User user = (User) request.getAttribute("user");
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setCountry(country);
            user.setCity(city);
            user.setDistrict(district);
            user.setAddress(address);
            user.setPhone(phone);

            this.userService.update(authorizationData.getId(), new UpdateUserDTO(user));
        }else {
            User user = new User();
            if(session.getAttribute("user") != null) {
                user = (User) session.getAttribute("user");
            }
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setCountry(country);
            user.setCity(city);
            user.setDistrict(district);
            user.setAddress(address);
            user.setPhone(phone);
            session.setAttribute("user", user);
        }

        OrderDTO order = new OrderDTO();
        order.setEmail(email);
        session.setAttribute("order", order);


        response.sendRedirect("/payment");
    }
}
