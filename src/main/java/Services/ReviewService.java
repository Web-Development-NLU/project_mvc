package Services;

import DTO.BaseDTO;
import DTO.StatReview;
import Model.Review;

import java.util.ArrayList;

public class ReviewService extends BaseService<Review> {
    public ReviewService(String tableName) {
        super(tableName);
    }

    public StatReview getStat(String productId) {
        return this.jdbi.withHandle(handle -> handle.createQuery("SELECT AVG(point) as avg, COUNT(id) as sum  FROM " + this.tableName +
                " WHERE productId = ? GROUP BY productId").bind(0, productId).mapToBean(StatReview.class).first()
        );
    }

    public ArrayList<Review> findByProductId(String productId) {
        return (ArrayList<Review>) this.jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM " + this.tableName + " WHERE productId = :productId")
                .bind("productId", productId)
                .mapToBean(Review.class)
                .list()
        );
    }

    @Override
    public String create(Review model) {
        this.jdbi.useHandle(handle -> {
            handle.createUpdate("INSERT INTO " + this.tableName +
                            " (productId, userId, name, email, comment, point, createdAt) VALUES (:productId, :userId, :name, :email, :comment, :point, :createdAt)")
                    .bindBean(model).execute();
        });
        return model.getProductId();
    }

    @Override
    protected boolean update(String id, BaseDTO model) throws Exception {
        return false;
    }
}
