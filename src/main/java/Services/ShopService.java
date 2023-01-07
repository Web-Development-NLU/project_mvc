package Services;

import DTO.BaseDTO;
import Model.Shop;
import Model.Slide;

import java.util.ArrayList;

public class ShopService extends BaseService<Shop>{
    public ShopService(String tableName) {
        super(tableName);
    }

    public ArrayList<Shop> findByType(int type) {
        return (ArrayList<Shop>) this.jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM " + this.tableName + " WHERE type = " + type).mapToBean(Shop.class).list());
    }

    @Override
    public String create(Shop model) {

        this.jdbi.useHandle(handle -> {
            handle.createUpdate("INSERT INTO " + this.tableName + " (name, redirect, image, type, createdAt) VALUES " +
                    "(:name, :redirect, :image, :type, :createdAt)").bindBean(model).execute();
        });

        return model.getName();
    }

    @Override
    public boolean update(String id, BaseDTO model) throws Exception {
        Shop shop = this.findById(id, Shop.class);
        if(shop != null) {
            this.jdbi.useHandle(handle -> {

                handle.createUpdate("UPDATE " + this.tableName +
                        " SET name = :name, " +
                        "redirect = :redirect, " +
                        "updatedAt = :updatedAt, " +
                        "image = :image " +
                        "WHERE id = :id "
                ).bind("id", id).bindBean(model).execute();
            });
        }
        return shop != null;
    }
}
