package Services;

import DTO.BaseDTO;
import DTO.FilterProduct;
import Model.Color;
import Model.Pattern;
import Model.Product;
import Model.StatusProduct;

import javax.management.Query;
import java.time.LocalDate;
import java.util.ArrayList;

public class ProductService extends BaseService<Product> {

    public ProductService(String tableName) {
        super(tableName);
    }
    public void setStatus(String id, int value) {
        this.jdbi.useHandle(handle -> {

            handle.createUpdate("UPDATE " + this.tableName +
                    " SET status = :status " +
                    "WHERE id = :id"
            ).bind("id", id).bind("status", value).execute();
        });
    }

    public ArrayList<Product> queryByBuilder(FilterProduct filter) {
        return (ArrayList<Product>) this.jdbi.withHandle(handle -> {
           String sql = "SELECT pd.id, pd.thumbnail, pd.name, pd.price, pd.createdAt, pd.status, AVG(r.point) avg FROM " + this.tableName + " pd";
            sql += " LEFT JOIN review r ON r.productId = pd.id";
           if(filter.pattern != null){
               sql += " INNER JOIN patternForProduct p ON pd.id = p.idProduct AND p.idPattern = " + filter.pattern;
           }

           if(filter.color != null) {
               sql += " INNER JOIN colorForProduct c ON pd.id = c.idProduct AND c.idColor = " + filter.color;
           }
           if(filter.category != null) {
               sql += " WHERE pd.categoryId = " + filter.category;
           }

           if(filter.maxFilter != null) {
               if(sql.contains("WHERE")){
                   sql += " AND pd.price <= " + filter.maxFilter;
               }else {
                   sql += " WHERE pd.price <= " + filter.maxFilter;
               }
           }

           if(filter.minFilter != null) {
               if(sql.contains("WHERE")){
                   sql += " AND pd.price >= " + filter.minFilter;
               }else {
                   sql += " WHERE pd.price >= " + filter.minFilter;
               }
           }
           sql += " GROUP BY pd.id ORDER BY pd.createdAt DESC";

           return handle.createQuery(sql).mapToBean(Product.class).list();
        });
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
    public boolean update(String id, BaseDTO model) {
        Product product = this.findById(id, Product.class);

        if (product != null) {
            this.jdbi.useHandle(handle -> {

                handle.createUpdate("UPDATE " + this.tableName +
                        " SET " +
                        "name = :name, " +
                        "price = :price, " +
                        "shortDescription = :shortDescription, " +
                        "size = :size, " +
                        "status = :status," +
                        "description = :description, " +
                        "dimensions = :dimensions, " +
                        "material = :material, " +
                        "thumbnail = :thumbnail, " +
                        "categoryId = :categoryId, " +
                        "updatedAt = :updatedAt " +
                        "WHERE id = :id"
                ).bind("id", id).bindBean(model).execute();
            });
        }

        return product != null;
    }

    public void linkToColor(String productId, int color) {
        this.jdbi.useHandle(handle -> {
            handle.createUpdate("INSERT INTO colorForProduct (idProduct, idColor, createdAt) VALUES (:idProduct, :idColor, :createdAt)")
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

    public ArrayList<Color> getColors(String idProduct) {
        return (ArrayList<Color>) this.jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT c.id, c.name, c.value , c.createdAt FROM colorForProduct cp " +
                            "RIGHT JOIN color c ON cp.idColor = c.id " +
                            "WHERE cp.idProduct = :idProduct")
                    .bind("idProduct", idProduct)
                    .mapToBean(Color.class)
                    .list();
        });
    }

    public ArrayList<Pattern> getPatterns(String idProduct) {
        return (ArrayList<Pattern>) this.jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT p.id, p.name ,p.createdAt FROM patternForProduct pp " +
                            "RIGHT JOIN pattern p ON pp.idPattern = p.id " +
                            "WHERE pp.idProduct = :idProduct")
                    .bind("idProduct", idProduct)
                    .mapToBean(Pattern.class)
                    .list();
        });
    }

    public void deletePattern(String idProduct) {
        this.jdbi.useHandle(handle -> handle.createUpdate("DELETE FROM patternForProduct WHERE idProduct = :idProduct").bind("idProduct", idProduct).execute());
    }

    public void deleteColor(String idProduct) {
        this.jdbi.useHandle(handle -> handle.createUpdate("DELETE FROM colorForProduct WHERE idProduct = :idProduct").bind("idProduct", idProduct).execute());
    }
}
