package Exceptions;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "NotFoundPage", value = "/NotFoundPage")
public class NotFoundPage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("statusCode", 404);
        request.setAttribute("messageTitle", "Oops! That page can't be found.");
        request.setAttribute("message", "Nothing was found at this location. Try searching or check out the links below");
        request.getRequestDispatcher("jsp/client/error.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
