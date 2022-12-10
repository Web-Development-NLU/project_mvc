package Services;

import DTO.BaseDTO;
import Model.Product;

public class ProductService extends BaseService<Product>{

    public ProductService(String tableName) {
        super(tableName);
    }

    @Override
    protected String create(Product model) {
        return null;
    }

    @Override
    protected boolean update(String id, BaseDTO model) throws Exception {
        return false;
    }
}
