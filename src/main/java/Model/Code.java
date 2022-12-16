package Model;

import java.util.ArrayList;
import java.util.Random;

public class Code extends BaseModel{
    private ArrayList<Integer> validValue;
    private String value;
    private int categoryId;
    private String productId;

    public Code(String value, int categoryId, String productId) {
        this.value = value;
        this.categoryId = categoryId;
        this.productId = productId;
        this.validValue = createValidValue();
    }

    public Code(int categoryId, String productId) {
        this.categoryId = categoryId;
        this.productId = productId;
        this.validValue = createValidValue();
    }
    public Code(){
        this.validValue = createValidValue();
    }

    public ArrayList<Integer> createValidValue(){
        ArrayList<Integer> result = new ArrayList<>(createValueNumber());
        for(int i =0; i< 26;i++){
            result.add(65 + i);
            result.add(97 + i);
        }
        return result;
    }
    public ArrayList<Integer> createValueNumber(){
        ArrayList<Integer> result = new ArrayList<>();
        for(int i =0; i< 10;i++){
            result.add(48 + i);
        }
        return result;
    }

    public String createValue(){
        String result ="";
        Random random = new Random();
        char charCode;
        int intCode;
        while(result.length() < 6){
            intCode = validValue.get(random.nextInt(validValue.size()));
            if(validValue.contains(intCode)){
                charCode =(char) intCode;
                result += charCode;
            }
        }
        return result;
    }

    public boolean checkValidValue(String value){
        boolean result = true;
        for(int i=0; i < value.length(); i++){
            int c = value.charAt(i);
            if(!validValue.contains(c)) return false;
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
