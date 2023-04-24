package Services;

import DTO.BaseDTO;
import Database.DBConnection;
import Model.Logger;
import Model.User;
import com.mysql.cj.log.Log;
import org.jdbi.v3.core.Jdbi;

public class LoggerService{
    private Jdbi jdbi;

    public LoggerService() {
        this.jdbi = DBConnection.jdbi;
    }

    public void create(Logger model) {
        this.jdbi.useHandle(handle -> {
            handle.createUpdate(
                    "INSERT INTO logger (id, method, request, userId, createdAt, agent, data, status, message) " +
                            "VALUES (:id, :method, :request, :userId, :createdAt, :agent, :data, :status, :message) "
            ).bindBean(model).execute();
        });
    }

    public void log(Logger logger) {
        this.create(logger);
        System.out.println(
                "[ " + logger.getId() + " ] " +
                        logger.getMethod() + "-" +
                        logger.getRequest() + " - " +
                        logger.getStatus() + " - " +
                        logger.getAgent() +
                        ((logger.getUserId() != null) ? " - " + logger.getUserId() : "")
        );
    }
}
