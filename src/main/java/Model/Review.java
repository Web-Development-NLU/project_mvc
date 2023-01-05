package Model;

public class Review extends BaseModel {

    private String userId;
    private String productId;
    private String name;
    private String email;
    private String comment;
    private int point;

    public Review(){}

    public Review(String userId, String productId, String comment, int point, String name, String email) {
        super();
        this.userId = userId;
        this.productId = productId;
        this.comment = comment;
        this.point = point;
        this.name = name;
        this.email = email;
    }

    public Review(String productId, String name, String email, String comment, int point) {
        super();
        this.productId = productId;
        this.name = name;
        this.email = email;
        this.comment = comment;
        this.point = point;
    }

    public String getUserId() {
        return userId;
    }

    public String getProductId() {
        return productId;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getComment() {
        return comment;
    }

    public int getPoint() {
        return point;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void setPoint(int point) {
        this.point = point;
    }
}
