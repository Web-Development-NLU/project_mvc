package Model;

import java.util.ArrayList;
import java.util.Random;

public class Code extends BaseModel{
    private ArrayList<Integer> validValue;
    private String value;
    private int categoryId;
    private String productId;

    public Code(String value) {
        this.value = value;
    }
    public Code(){}

    public String getValue() {
        return value;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
