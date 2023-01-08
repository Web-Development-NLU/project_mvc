package Services;

import DTO.BaseDTO;
import Model.InfoCustomer;

public class CustomerService extends BaseService<InfoCustomer>{
    public CustomerService(String tableName) {
        super(tableName);
    }

    @Override
    public String create(InfoCustomer model) {

        this.jdbi.useHandle(handle -> handle.createUpdate("INSERT INTO " + this.tableName + "(name, email, message, createdAt) VALUES (" +
                ":name, :email, :message, :createdAt)").bindBean(model).execute());

        return model.getEmail();
    }

    @Override
    protected boolean update(String id, BaseDTO model) throws Exception {
        return false;
    }
}
