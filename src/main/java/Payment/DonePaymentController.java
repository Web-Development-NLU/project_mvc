package Payment;

import DTO.AuthorizationData;
import DTO.CartDTO;
import DTO.OrderDTO;
import Model.MailContent;
import Model.Order;
import Model.User;
import Services.MailService;
import Services.OrderService;
import Services.UserService;
import com.mailjet.client.errors.MailjetException;
import com.mailjet.client.errors.MailjetSocketTimeoutException;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Objects;

@WebServlet(name = "DonePayment", value = "/payment/done")
public class DonePaymentController extends HttpServlet {
    private UserService userService;
    private OrderService orderService;
    private MailService mailService;
    @Override
    public void init() throws ServletException {
        super.init();
        this.userService = new UserService("users");
        this.orderService = new OrderService("orders");
        this.mailService = new MailService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String responseCode = request.getParameter("vnp_ResponseCode");
        String transId = request.getParameter("vnp_TxnRef");
        String vnp_transId = request.getParameter("vnp_TransactionNo");
        if (Objects.equals(responseCode, "00")) {
            HttpSession session = request.getSession(true);
            AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("authorization");
            OrderDTO order = (OrderDTO) session.getAttribute("order");
            User user = null;
            if ((boolean) request.getAttribute("logged")) {
                user = (User) request.getAttribute("user");
                this.userService.removeAllCart(authorizationData.getId());
            } else {

                user = (User) session.getAttribute("user");
            }
            authorizationData.setCarts(new ArrayList<CartDTO>());
            Order orderSave = new Order(order.getName(), order.getPrice(), vnp_transId,
                    user.getFirstName() + " " + user.getLastName(), user.getCountry(),
                    user.getCity(), user.getDistrict(), user.getAddress(), user.getPhone(), order.getEmail());
            orderSave.setId(transId);
            orderService.create(orderSave);
            session.setAttribute("authorization", authorizationData);
            request.setAttribute("cartNumber", 0);
            session.removeAttribute("order");
            this.sendEmail(orderSave);
            request.setAttribute("order", orderSave);
            request.getRequestDispatcher("/jsp/client/payment/vnpay_return.jsp").forward(request, response);

        }else {
            response.sendRedirect("/cart");
            return;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void sendEmail(Order order) {
        try {
            this.mailService.send(order.getEmail(), new MailContent(
                    "FURNIURE | XÁC NHẬN ĐƠN HÀNG",
                    "Mã đơn hàng: " + order.getId() + "\n" +
                            "Thông tin đơn hàng: " + order.getInfo() +"\n" +
                            "Gía tiền: " + order.getPrice() +"\n" +
                            "Mã giao dịch VNPAY: " + order.getTransID() + "\n" +
                            "Tên khách hàng: " + order.getUsername() + "\n" +
                            "Quốc gia: " + order.getCountry() + "\n" +
                            "Thành phố: " + order.getCity() + "\n" +
                            "Quận/Huyện: " + order.getDistrict() + "\n" +
                            "Địa chỉ: " + order.getAddress() + "\n" +
                            "Số điện thoại: " + order.getPhone() + "\n" +
                            "Email: " + order.getEmail() + "\n"
            ));
        } catch (MailjetSocketTimeoutException e) {
            throw new RuntimeException(e);
        } catch (MailjetException e) {
            throw new RuntimeException(e);
        }
    }
}
