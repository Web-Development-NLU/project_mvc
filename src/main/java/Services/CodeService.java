package Services;

import DTO.BaseDTO;
import DTO.UpdateCodeDTO;
import Model.Category;
import Model.Code;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.HandleCallback;

public class CodeService extends BaseService<Code>{
    public CodeService(String tableName) {
        super(tableName);
    }

    @Override
    public String create(Code model) {
        if(model.getCategoryId() != 0) {
            return this.jdbi.withHandle(handle -> {
                handle.createUpdate("INSERT INTO " + this.tableName + " ( value, categoryId, productId, createdAt) "
                        + "VALUES ( :value, :categoryId , :productId, :createdAt)").bindBean(model).execute();
                Code newCode = findByCode(model.getValue());
                return newCode.getId()+"";
            });
        }else {
            return this.jdbi.withHandle(handle -> {
                handle.createUpdate("INSERT INTO " + this.tableName + " ( value, productId, createdAt) "
                        + "VALUES ( :value , :productId, :createdAt)").bindBean(model).execute();
                Code newCode = findByCode(model.getValue());
                return newCode.getId()+"";
            });
        }
    }

    @Override
    public boolean update(String id, BaseDTO model){
        Code code = this.findById(id, Code.class);
        UpdateCodeDTO updateModel = (UpdateCodeDTO) model;
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
                                        "SELECT * FROM " + tableName + " WHERE value = ?" + " order by id desc ")
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
    public Code findByCode(String id,String code) {
        try {
            return this.jdbi.withHandle(new HandleCallback<Code, Exception>() {
                public Code withHandle(Handle handle) throws Exception{
                    try {
                        return handle.createQuery(
                                        "SELECT * FROM " + tableName + " WHERE value = ? and id != ?" + " order by id desc ")
                                .bind(0, code).bind(1,id)
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
