package Services;

import DTO.BaseDTO;
import Model.Code;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.HandleCallback;

public class CodeService extends BaseService<Code>{
    public CodeService(String tableName) {
        super(tableName);
    }

    @Override
    public String create(Code model) {
        return this.jdbi.withHandle(handle -> {
            handle.createUpdate("INSERT INTO "+ this.tableName + " ( value, categoryId, productId, createdAt) "
            + "VALUES ( :value, :categoryId, :productId, :createdAt)").bindBean(model).execute();
            return model.getValue();
        });
    }

    @Override
    public boolean update(String id, BaseDTO model){
        Code code = this.findById(id, Code.class);
        if(code != null){
            this.jdbi.useHandle(handle -> {
                handle.createUpdate("UPDATE " + this.tableName +
                        " SET value = :value," +
                        "categoryId = :categoryId," +
                        "productId = :productId," +
                        "updatedAt = :updatedAt " +
                        "WHERE id = :id").bind("id",id).bindBean(model).execute();
            });
        }
        return code != null;
    }

    public Code findByCode(String code) {
        try {
            return this.jdbi.withHandle(new HandleCallback<Code, Exception>() {
                public Code withHandle(Handle handle) throws Exception{
                    try {
                        return handle.createQuery(
                                        "SELECT * FROM " + tableName + " WHERE value = ?")
                                .bind(0, code)
                                .mapToBean(Code.class).first();
                    }catch (IllegalStateException exception) {
                        return null;
                    }

                }
            });
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
