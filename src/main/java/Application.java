import Database.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebListener
public class Application implements ServletContextListener{

    public Application() {

    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        new DBConnection();
        System.out.println("MySQL is connected");

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
