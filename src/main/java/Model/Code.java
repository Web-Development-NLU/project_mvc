package Model;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.HandleCallback;

import java.util.ArrayList;
import java.util.Random;

public class Code extends BaseModel{
    private ArrayList<Integer> valueExclude;
    private String value;
    private int categoryId;
    private String productId;

    public Code(String value, int categoryId, String productId) {
        this.value = value;
        this.categoryId = categoryId;
        this.productId = productId;
        this.valueExclude = createValueExclude();
    }

    public Code(int categoryId, String productId) {
        this.value = createValue();
        this.categoryId = categoryId;
        this.productId = productId;
        this.valueExclude = createValueExclude();
    }
    public Code(){
        this.valueExclude = createValueExclude();
    }

    public ArrayList<Integer> createValueExclude(){
        ArrayList<Integer> result = new ArrayList<>();
        for(int i =0; i< 6;i++){
            result.add(58 + i);
            result.add(91 + i);
        }
        result.add(64);
        return result;
    }

    public String createValue(){
        String result ="";
        Random random = new Random();
        char charCode;
        int intCode;
        while(result.length() < 7){
            intCode = 48 + random.nextInt(75);
            if(!valueExclude.contains(intCode)){
                charCode =(char) intCode;
                result += charCode;
            }
        }
        return result;
    }

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
