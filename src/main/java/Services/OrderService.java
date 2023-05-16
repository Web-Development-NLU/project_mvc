package Services;

import DTO.BaseDTO;
import Model.Order;
import Model.User;
import at.favre.lib.crypto.bcrypt.BCrypt;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.HandleCallback;

import java.util.ArrayList;

public class OrderService extends BaseService<Order> {

    public OrderService(String tableName) {
        super(tableName);
    }

    @Override
    public String create(Order model) {
        this.jdbi.useHandle(handle -> handle.createUpdate("INSERT INTO " + this.tableName + "(id, info, transID, username, country, city, district, address, phone, email, createdAt, price, userId,deliveryId, estimateDate) VALUES " + "(:id, :info, :transID, :username, :country, :city, :district, :address, :phone, :email, :createdAt, :price, :userId, :deliveryId,:estimateDate)").bindBean(model).execute());
        return model.getId();
    }

    @Override
    protected boolean update(String id, BaseDTO model) throws Exception {
        return false;
    }

    public ArrayList<Order> findOrdersUser(String id) {
        return (ArrayList<Order>) this.jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT * FROM " + this.tableName + " WHERE userId = ? order by createdAt desc ").bind(0, id).mapToBean(Order.class).list();
        });
    }

    public ArrayList<Order> findOrdersUserByDetail(String id, String detail) {
        String detailSearch = "%" + detail + "%";
        return (ArrayList<Order>) this.jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT * FROM " + this.tableName + " WHERE userId = ? and info like ?").bind(0, id).bind(1, detailSearch).mapToBean(Order.class).list();
        });
    }

    public Order findOrderUserById(String userId, String orderId) {
        if (orderId.isEmpty()) {
            return null;
        }
        try {
            Order data;
            data = this.jdbi.withHandle(new HandleCallback<Order, Exception>() {
                public Order withHandle(Handle handle) throws Exception {
                    try {
                        return handle.createQuery("SELECT * FROM " + tableName + " WHERE id = ? and userId = ?").bind(0, orderId).bind(1, userId).mapToBean(Order.class).first();
                    } catch (IllegalStateException exception) {
                        return null;
                    }

                }
            });

            return data;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Order> findOrdersPrepayment() {
        return (ArrayList<Order>) this.jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT * FROM " + this.tableName + " WHERE transID is not null and status < 3").mapToBean(Order.class).list();
        });
    }

    public ArrayList<Order> findOrdersPostPaid() {
        return (ArrayList<Order>) this.jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT * FROM " + this.tableName + " WHERE transID is null and status < 3").mapToBean(Order.class).list();
        });
    }

    public ArrayList<Order> findOrders(String infoSearch) {
        String infoSearchDetail = "%" + infoSearch + "%";
        return (ArrayList<Order>) this.jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT * FROM " + this.tableName + " WHERE id = ? or info like ?").bind(0, infoSearch).bind(1, infoSearchDetail).mapToBean(Order.class).list();
        });
    }

    public ArrayList<Order> findOrders(String infoSearch, int status) {
        String infoSearchDetail = "%" + infoSearch + "%";
        String condition;

        return (ArrayList<Order>) this.jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT * FROM " + this.tableName + " WHERE (id = ? or info like ?)and status=?").bind(0, infoSearch).bind(1, infoSearchDetail).bind(2, status).mapToBean(Order.class).list();
        });
    }

    public ArrayList<Order> findOrders(String infoSearch, boolean isPrepayment) {
        String infoSearchDetail = "%" + infoSearch + "%";
        String condition;
        if (isPrepayment) {
            condition = "is not null";
        } else {
            condition = "is null";
        }
        return (ArrayList<Order>) this.jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT * FROM " + this.tableName + " WHERE ( id = ? or info like ? ) and status <3 and transID " + condition).bind(0, infoSearch).bind(1, infoSearchDetail).mapToBean(Order.class).list();
        });
    }

    public ArrayList<Order> findOrdersCanceled() {
        return (ArrayList<Order>) this.jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT * FROM " + this.tableName + " WHERE status =3").mapToBean(Order.class).list();
        });
    }

    public boolean updateStatusOrder(String id, int amount) {
        Order order = this.findById(id, Order.class);
        if (order == null) return false;
        this.jdbi.useHandle(handle -> handle.createUpdate("UPDATE " + this.tableName + " SET status = :status WHERE id = :id").bind("status", amount).bind("id", id).execute());
        return true;
    }
}
