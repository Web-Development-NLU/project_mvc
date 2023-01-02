package Services;

import DTO.BaseDTO;
import DTO.UpdateCodeDTO;
import Model.Code;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.HandleCallback;

public class CodeService extends BaseService<Code>{
    public CodeService(String tableName) {
        super(tableName);
    }

    @Override
    public String create(Code model) {
        Code code = this.findByCode(model.getValue());
        Code codeExisted = this.findByCode(model.getValue());
        if(code != null || codeExisted != null) return null;
        if(model.getCategoryId() != 0) {
            return this.jdbi.withHandle(handle -> {
                handle.createUpdate("INSERT INTO " + this.tableName + " ( value, categoryId, productId, createdAt) "
                        + "VALUES ( :value, :categoryId , :productId, :createdAt)").bindBean(model).execute();
                return model.getValue();
            });
        }else {
            return this.jdbi.withHandle(handle -> {
                handle.createUpdate("INSERT INTO " + this.tableName + " ( value, productId, createdAt) "
                        + "VALUES ( :value , :productId, :createdAt)").bindBean(model).execute();
                return model.getValue();
            });
        }
    }

    @Override
    public boolean update(String id, BaseDTO model){
        Code code = this.findById(id, Code.class);
        UpdateCodeDTO updateModel = (UpdateCodeDTO) model;
        Code codeExisted = this.findByCode(updateModel.getValue());
        if(codeExisted != null) return false;
        if(code != null){
            if(updateModel.getCategoryId() != 0){
                this.jdbi.useHandle(handle -> {
                    handle.createUpdate("UPDATE " + this.tableName +
                            " SET value = :value," +
                            "categoryId = :categoryId," +
                            "productId = null," +
                            "updatedAt = :updatedAt " +
                            "WHERE id = :id").bind("id",id).bindBean(model).execute();
                });
            }else{
                this.jdbi.useHandle(handle -> {
                    handle.createUpdate("UPDATE " + this.tableName +
                            " SET value = :value," +
                            "categoryId = null," +
                            "productId = :productId," +
                            "updatedAt = :updatedAt " +
                            "WHERE id = :id").bind("id",id).bindBean(model).execute();
                });
            }
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
