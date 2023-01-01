package Services;

import DTO.BaseDTO;
import Model.Product;

import java.time.LocalDate;

public class ProductService extends BaseService<Product>{

    public ProductService(String tableName) {
        super(tableName);
    }

    @Override
    public String create(Product model) {
        return this.jdbi.withHandle(handle -> {
            String id = handle.createQuery("SELECT UUID()").mapTo(String.class).first();
            model.setId(id);
            handle.createUpdate(
                    "INSERT INTO " + this.tableName + " (id, name, price, shortDescription, size, status, description, dimensions, material, thumbnail, categoryId, createdAt) " +
                            "VALUES (:id, :name, :price, :shortDescription, :size, :status, :description, :dimensions, :material, :thumbnail, :categoryId, :createdAt)"
            ).bindBean(model).execute();

            return id;
        });
    }

    @Override
    protected boolean update(String id, BaseDTO model) throws Exception {
        return false;
    }

    public void linkToColor(String productId, int color) {
        this.jdbi.useHandle(handle -> {
            handle.createUpdate("INSERT INTO colorForProduct (idProduct, idColor, createdAt) VALUES (:idProduct, :idCorlor, :createdAt)")
                    .bind("idProduct", productId)
                    .bind("idColor", color)
                    .bind("createdAt", LocalDate.now())
                    .execute();
        });
    }

    public void linkToPattern(String productId, int pattern) {
        this.jdbi.useHandle(handle -> {
            handle.createUpdate("INSERT INTO patternForProduct (idProduct, idPattern, createdAt) VALUES (:idProduct, :idPattern, :createdAt)")
                    .bind("idProduct", productId)
                    .bind("idPattern", pattern)
                    .bind("createdAt", LocalDate.now())
                    .execute();
        });
    }
}
