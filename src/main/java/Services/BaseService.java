package Services;

import DTO.BaseDTO;
import DTO.UpdateUserDTO;
import Database.DBConnection;
import Model.IModel;
import Model.User;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.HandleCallback;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.Query;

import java.util.Optional;

public abstract class BaseService<M extends IModel> {
    protected Jdbi jdbi;
    protected String tableName;

    public BaseService(String tableName) {
        this.jdbi = DBConnection.jdbi;
        this.tableName = tableName;
    }

    public Optional<M> findById(String id, Class<M> classes) {
        try {
            Optional<M> data = this.jdbi.withHandle(new HandleCallback<Optional<M>, Exception>() {
                public Optional<M> withHandle(Handle handle) throws Exception{
                    return (Optional<M>) handle.createQuery(
                            "SELECT * FROM " + tableName + " WHERE id = ?")
                            .bind(0, id)
                            .mapToBean(classes).findFirst();
                }
            });

            return data;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public boolean  delete(String id, Class<M> classes) {
        Optional<M> data = this.findById(id, classes);

        if(data.isPresent()){
            this.jdbi.useHandle(handle -> {
                handle.createUpdate("DELETE FROM " + this.tableName + " WHERE id = ?").bind(0, id).execute();
            });
        }

        return data.isPresent();
    };

    protected abstract void create(M model);
    protected abstract boolean update(String id, BaseDTO model) throws Exception;

}
