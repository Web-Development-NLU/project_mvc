package Services;

import Database.DBConnection;
import Model.IModel;
import org.jdbi.v3.core.Jdbi;

public abstract class BaseService<M extends IModel> {
    protected Jdbi jdbi;
    protected String tableName;

    public BaseService(String tableName) {
        this.jdbi = DBConnection.jdbi;
        this.tableName = tableName;
    }

    protected void create(M model) {

    }
}
