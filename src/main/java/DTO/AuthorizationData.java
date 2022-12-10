package DTO;

import java.util.ArrayList;
import java.util.Objects;

public class AuthorizationData {
    private String id = "";
    private int type = 0;

    private ArrayList<CartDTO> carts;

    public AuthorizationData() {
        this.carts = new ArrayList<>();
    }

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

    public void setCarts(ArrayList<CartDTO> carts) {
        this.carts = carts;
    }

    public ArrayList<CartDTO> getCarts() {
        return carts;
    }

    public void addToCart(CartDTO newCart){
        for(CartDTO cart : this.carts) {
            if(Objects.equals(newCart.getId(), cart.getId())) {
                cart.setAmount(cart.getAmount() + newCart.getAmount());
                return;
            }
        }
        this.carts.add(newCart);
    }

    public void removeCart(String id) {
        for(CartDTO cart : this.carts) {
            if(Objects.equals(id, cart.getId())) {
                this.carts.remove(cart);
                break;
            }
        }
    }

    public void updateCart(String id, int amount) {
        for(CartDTO cart : this.carts) {
            if(Objects.equals(id, cart.getId())) {
                cart.setAmount(amount);
                break;
            }
        }
    }
}
