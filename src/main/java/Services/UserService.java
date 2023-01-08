package Services;

import DTO.BaseDTO;
import DTO.CartDTO;
import Model.Cart;
import Model.StatusAccount;
import Model.TypeAccount;
import Model.User;
import at.favre.lib.crypto.bcrypt.BCrypt;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.HandleCallback;

import java.lang.reflect.Type;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class UserService extends BaseService<User> {
    public UserService(String tableName) {
        super(tableName);
    }

    public boolean changeStatusAdmin(String id) {
        User user = this.findById(id, User.class);
        if((user == null) || (user.getType() < TypeAccount.ADMIN.ordinal())) {
            return false;
        }
        int newStatus = (user.getStatus() == StatusAccount.ACTIVE.ordinal()) ? StatusAccount.DISABLE.ordinal() : StatusAccount.ACTIVE.ordinal();

        this.jdbi.useHandle(handle -> handle.createUpdate("UPDATE " + this.tableName + " SET status = :status WHERE id = :id")
                .bind("status", newStatus)
                .bind("id", id).execute());

        return true;
    }

    public boolean changePassword(String id, String oldPassword, String newPassword) {
        User user = this.findById(id, User.class);

        if(!BCrypt.verifyer().verify(oldPassword.toCharArray(), user.getPassword()).verified) {
            return false;
        }

        this.jdbi.useHandle(handle -> handle.createUpdate("UPDATE " + this.tableName + " SET password = :password WHERE id = :id")
                .bind("password", BCrypt.withDefaults().hashToString(8, newPassword.toCharArray()))
                .bind("id", id).execute());

        return true;
    }
    public ArrayList<User> findUser(TypeAccount type) {
        if(type == TypeAccount.ADMIN) {
            return (ArrayList<User>) this.jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM " + this.tableName
                    + " WHERE type = ?").bind(0, type.ordinal()).mapToBean(User.class).list());
        }else {
            return (ArrayList<User>) this.jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM " + this.tableName
                    + " WHERE type = ?").bind(0, type.ordinal()).mapToBean(User.class).list());
        }
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
                "SELECT c.id, c.amount, c.idProduct, p.name, p.price, p.categoryId, c.pattern, c.color, c.image " +
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
                                    "idProduct = :idProduct " +
                                    ((cart.getColor() != null) ? ("AND color = '" + cart.getColor()) + "'" : "") +
                                    ((cart.getPattern() != null) ? (" AND pattern = '" +  cart.getPattern()) +"'" : "")
                    ).bind("idUser", idUser)
                    .bind("idProduct", cart.getIdProduct())
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
                            "INSERT INTO cart (idUser, idProduct, createdAt, amount, color, pattern, image) " +
                                    "VALUES (:idUser, :idProduct, :createdAt, :amount, :color, :pattern, :image)")
                    .bind("idUser", idUser)
                    .bind("idProduct", cart.getIdProduct())
                    .bind("createdAt", LocalDate.now())
                    .bind("amount", cart.getAmount())
                    .bind("color", cart.getColor())
                    .bind("pattern", cart.getPattern())
                    .bind("image", cart.getImage())
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
