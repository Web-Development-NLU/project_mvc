package Services;

import DTO.BaseDTO;
import Database.DBConnection;
import Model.IModel;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.HandleCallback;
import org.jdbi.v3.core.Jdbi;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

public abstract class BaseService<M extends IModel> {
    protected Jdbi jdbi;
    protected String tableName;

    public BaseService(String tableName) {
        this.jdbi = DBConnection.jdbi;
        this.tableName = tableName;
    }

    public ArrayList<M> findAll(Class<M> classes) {
        return (ArrayList<M>) this.jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT * FROM " + this.tableName)
                    .mapToBean(classes).list();
        });
    }

    public M findById(String id, Class<M> classes) {
        if(id == null || id.isEmpty()) {
            return null;
        }

        try {
            M data;
            data = this.jdbi.withHandle(new HandleCallback<M, Exception>() {
                public M withHandle(Handle handle) throws Exception{
                    try {
                        return handle.createQuery(
                                "SELECT * FROM " + tableName + " WHERE id = ?")
                                .bind(0, id)
                                .mapToBean(classes).first();
                    }catch (IllegalStateException exception) {
                        return null;
                    }

                }
            });

            return data;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public boolean  delete(String id, Class<M> classes) {
        M data = this.findById(id, classes);

        if(data != null){
            this.jdbi.useHandle(handle -> {
                handle.createUpdate("DELETE FROM " + this.tableName + " WHERE id = ?").bind(0, id).execute();
            });
        }

        return data != null;
    };

    protected abstract String create(M model);
    protected abstract boolean update(String id, BaseDTO model) throws Exception;

}
