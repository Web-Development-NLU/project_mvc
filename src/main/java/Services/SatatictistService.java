package Services;

import DTO.BaseDTO;
import Model.Order;
import Model.Satatictis;
import Model.User;

public class SatatictistService extends BaseService<Satatictis>{
    public SatatictistService(String tableName) {
        super(tableName);
    }

    @Override
    protected String create(Satatictis model) {
            return this.jdbi.withHandle(handle -> {
                String id = handle.createQuery("SELECT UUID()").mapTo(String.class).first();
                model.setId(id);
                handle.createUpdate(
                        "INSERT INTO " + this.tableName + " (totalOrder, totalOrderByDate, totalSales, totalSalesByDate) " +
                                "VALUES (:totalOrder, :totalOrderByDate, :totalSales, :totalSalesByDate)"
                ).bindBean(model).execute();

                return id;
            });
        }


    @Override
    protected boolean update(String id, BaseDTO model) throws Exception {
        return false;
    }


}
