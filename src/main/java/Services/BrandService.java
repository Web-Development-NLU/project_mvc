package Services;

import DTO.BaseDTO;
import Model.Brand;

public class BrandService extends BaseService<Brand>{
        public BrandService(String tableName){
            super(tableName);
        }
        @Override
        public String create(Brand model) {
            return this.jdbi.withHandle(handle -> {
                handle.createUpdate(
                        "INSERT INTO " + this.tableName + " (name,createdAt) " +
                                "VALUES (:name, :createdAt) "
                ).bindBean(model).execute();

                return model.getName();
            });
        }
        public boolean update(String id, BaseDTO model){
            Brand brand = this.findById(id, Brand.class);

            if(brand != null) {
                this.jdbi.useHandle(handle -> {
                    handle.createUpdate("UPDATE " + this.tableName +
                            " SET  name = :name, " +
                            "updatedAt = :updatedAt "+
                            " WHERE id = :id "
                    ).bind("id", id).bindBean(model).execute();
                });
            }

            return brand != null;
        }
}
