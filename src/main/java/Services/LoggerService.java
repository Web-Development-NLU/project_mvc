package Services;

import DTO.BaseDTO;
import Database.DBConnection;
import Model.Logger;
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
                    "INSERT INTO logger (id, method, request, userId, createdAt, agent) " +
                            "VALUES (:id, :method, :request, :userId, :createdAt, :agent) "
            ).bindBean(model).execute();
        });
    }
}
