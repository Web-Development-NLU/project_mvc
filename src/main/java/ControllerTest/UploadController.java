package ControllerTest;

import Services.UploadService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Collection;

@WebServlet(name = "UploadController", value = "/test/upload")
@MultipartConfig(
        fileSizeThreshold=1024*1024*10,
        maxFileSize=1024*1024*50,
        maxRequestSize=1024*1024*100
)
public class UploadController extends HttpServlet {

    private UploadService uploadService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.uploadService =  new UploadService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/client/test/upload.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            System.out.println(this.uploadService.handleFile(request.getServletContext().getRealPath("temp"), request.getParts(), "test"));
        }catch (RuntimeException exception){
            request.setAttribute("error", "file is wrong format");
            request.getRequestDispatcher("/jsp/client/test/upload.jsp").forward(request, response);
        }
    }


}
