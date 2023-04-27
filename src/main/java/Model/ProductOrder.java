package Model;

public class ProductOrder {
    private int id;
    private String orderId;
    private String productId;
    private String pattern;
    private String color;
    private int amount;

    public ProductOrder(String orderId, String productId, String pattern, String color, int amount) {
        this.orderId = orderId;
        this.productId = productId;
        this.pattern = pattern;
        this.color = color;
        this.amount = amount;
    }

    public int getId() {
        return id;
    }

    public String getOrderId() {
        return orderId;
    }

    public String getProductId() {
        return productId;
    }

    public String getPattern() {
        return pattern;
    }

    public String getColor() {
        return color;
    }

    public int getAmount() {
        return amount;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public void setPattern(String pattern) {
        this.pattern = pattern;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
