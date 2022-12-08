package DTO;

import java.util.ArrayList;
import java.util.Objects;

public class AuthorizationData {
    private String id;
    private int type;

    private ArrayList<CartDTO> carts;

    public AuthorizationData(String id, int type) {
        this.id = id;
        this.type = type;
        this.carts = new ArrayList<>();
    }

    public String getId() {
        return id;
    }

    public int getType() {
        return type;
    }

    public void addToCart(CartDTO cart){
        this.carts.add(cart);
    }

    public void removeCart(String id) {
        for(CartDTO cart : this.carts) {
            if(Objects.equals(id, cart.getId())) {
                this.carts.remove(cart);
                break;
            }
        }
    }

    public void updateCart(int amount) {
        for(CartDTO cart : this.carts) {
            if(Objects.equals(id, cart.getId())) {
                cart.setAmount(amount);
                break;
            }
        }
    }
}
