package Services;

import DTO.ProductOrderDTO;
import Database.DBConnection;
import Model.ProductOrder;
import org.jdbi.v3.core.Jdbi;

import java.util.ArrayList;

public class ProductOrderService {
    private Jdbi jdbi;

    public ProductOrderService() {
        this.jdbi = DBConnection.jdbi;
    }

    public ArrayList<ProductOrderDTO> getByOrderId(String orderId) {
        ArrayList<ProductOrderDTO> list = (ArrayList<ProductOrderDTO>) this.jdbi.withHandle(handle -> {
            return handle.createQuery((
                    "SELECT po.id, po.orderId, po.productId, p.name, p.thumbnail as image ,po.pattern, po.color, po.amount, p.price FROM productOrder as po" +
                            " INNER JOIN product as p on p.id = po.productId" +
                            " WHERE po.orderId = ?"
                    )).bind(0, orderId).mapToBean(ProductOrderDTO.class).list();
        });
        list.forEach(productOrderDTO -> {
            String[] images = productOrderDTO.getImage().split(",");
            productOrderDTO.setImage(images[0]);
        });
        return list;
    }
    public void create(ProductOrder model) {
        this.jdbi.useHandle(handle -> {
            handle.createUpdate(
                    "INSERT INTO productOrder (orderId, productId, pattern, color, amount) " +
                            "VALUES (:orderId, :productId, :pattern, :color, :amount) "
            ).bindBean(model).execute();
        });
    }
}
