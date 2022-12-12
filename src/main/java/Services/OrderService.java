package Services;

import DTO.BaseDTO;
import Model.Order;

public class OrderService extends BaseService<Order>{

    public OrderService(String tableName) {
        super(tableName);
    }

    @Override
    public String create(Order model) {
        this.jdbi.useHandle(handle ->
                handle.createUpdate("INSERT INTO " + this.tableName + "(id, info, transID, username, country, city, district, address, phone, email, createdAt, price, userId) VALUES " +
                        "(:id, :info, :transID, :username, :country, :city, :district, :address, :phone, :email, :createdAt, :price, :userId)")
                        .bindBean(model).execute()
        );
        return model.getId();
    }

    @Override
    protected boolean update(String id, BaseDTO model) throws Exception {
        return false;
    }
}
