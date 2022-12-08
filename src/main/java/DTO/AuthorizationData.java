package DTO;

public class AuthorizationData {
    private String id;
    private int type;

    public AuthorizationData(String id, int type) {
        this.id = id;
        this.type = type;
    }

    public String getId() {
        return id;
    }

    public int getType() {
        return type;
    }
}
