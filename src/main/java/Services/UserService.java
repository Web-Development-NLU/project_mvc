package Services;

import DTO.BaseDTO;
import DTO.CartDTO;
import Model.Cart;
import Model.User;
import at.favre.lib.crypto.bcrypt.BCrypt;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.HandleCallback;

import java.time.LocalDate;
import java.util.List;

public class UserService extends BaseService<User> {
    public UserService(String tableName) {
        super(tableName);
    }

    public void resetPassword(String id, String password) {
        String hashPassword = BCrypt.withDefaults().hashToString(8, password.toCharArray());

        this.jdbi.useHandle(handle -> handle.createUpdate(
                        "UPDATE " + this.tableName +
                                " SET password = :password," +
                                " updatedAt = :updatedAt" +
                                " WHERE id = :id "
                ).bind("id", id)
                .bind("updatedAt", LocalDate.now())
                .bind("password", hashPassword).execute());
    }

    @Override
    public String create(User model) {
        return this.jdbi.withHandle(handle -> {
            String id = handle.createQuery("SELECT UUID()").mapTo(String.class).first();
            model.setId(id);
            handle.createUpdate(
                    "INSERT INTO " + this.tableName + " (id, email, password, status, type, createdAt) " +
                            "VALUES (:id, :email, :password, :status, :type, :createdAt)"
            ).bindBean(model).execute();

            return id;
        });
    }

    @Override
    public boolean update(String id, BaseDTO model) {
        User user = this.findById(id, User.class);

        if (user != null) {
            this.jdbi.useHandle(handle -> {

                handle.createUpdate("UPDATE " + this.tableName +
                        " SET firstName = :firstName, " +
                        "lastName = :lastName, " +
                        "phone = :phone, " +
                        "country = :country, " +
                        "city = :city, " +
                        "district = :district, " +
                        "address = :address, " +
                        "status = :status" + " WHERE id = :id "
                ).bind("id", id).bindBean(model).execute();
            });
        }

        return user != null;
    }

    public User findByEmail(String email) {
        try {
            return this.jdbi.withHandle(new HandleCallback<User, Exception>() {
                public User withHandle(Handle handle) throws Exception {
                    try {
                        return handle.createQuery(
                                        "SELECT * FROM " + tableName + " WHERE email = ?")
                                .bind(0, email)
                                .mapToBean(User.class).first();
                    } catch (IllegalStateException exception) {
                        return null;
                    }

                }
            });
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public List<CartDTO> getCart(String idUser) {
        return this.jdbi.withHandle(handle -> handle.createQuery(
                "SELECT c.id, c.amount, c.idProduct, p.name, p.price, p.categoryId, c.pattern, c.color " +
                        "FROM cart as c " +
                        "RIGHT JOIN product as p ON p.id = c.idProduct " +
                        "WHERE c.idUser = :idUser"
        ).bind("idUser", idUser).mapToBean(CartDTO.class).list());
    }

    public void setCart(String idUser, Cart cart) {
        CartDTO exist = null;
        try {
            exist = this.jdbi.withHandle(handle -> handle.createQuery(
                            "SELECT id, amount FROM cart WHERE " +
                                    "idUser = :idUser AND " +
                                    "idProduct = :idProduct AND " +
                                    "color = :color AND " +
                                    "pattern = :pattern"
                    ).bind("idUser", idUser)
                    .bind("idProduct", cart.getIdProduct())
                    .bind("color", cart.getColor())
                    .bind("pattern", cart.getPattern())
                    .mapToBean(CartDTO.class).first());
        } catch (IllegalStateException exception) {
            exist = null;
        }

        if (exist != null) {
            this.updateCart(exist.getId(), cart.getAmount() + exist.getAmount());
        } else {
            this.createCart(idUser, cart);
        }
    }

    private void createCart(String idUser, Cart cart) {
        this.jdbi.useHandle(handle -> {
            handle.createUpdate(
                            "INSERT INTO cart (idUser, idProduct, createdAt, amount, color, pattern) " +
                                    "VALUES (:idUser, :idProduct, :createdAt, :amount, :color, :pattern)")
                    .bind("idUser", idUser)
                    .bind("idProduct", cart.getIdProduct())
                    .bind("createdAt", LocalDate.now())
                    .bind("amount", cart.getAmount())
                    .bind("color", cart.getColor())
                    .bind("pattern", cart.getPattern())
                    .execute();
        });
    }

    public void updateCart(int id, int amount) {
        this.jdbi.useHandle(handle -> {
            handle.createUpdate("UPDATE cart " +
                            "SET amount = :amount, " +
                            "updatedAt = :updatedAt " +
                            "WHERE id = :id")
                    .bind("id", id)
                    .bind("updatedAt", LocalDate.now())
                    .bind("amount", amount)
                    .execute();
        });
    }

    public void deleteCart(int id) {
        this.jdbi.useHandle(handle -> {
            handle.createUpdate("DELETE FROM cart WHERE id = :id")
                    .bind("id", id)
                    .execute();
        });
    }
    public void removeAllCart(String idUser) {
        this.jdbi.useHandle(handle ->
            handle.createUpdate("DELETE FROM cart WHERE idUser = :idUser").bind("idUser", idUser).execute());
    }
}
