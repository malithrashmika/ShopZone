package lk.ijse.DAO;

import lk.ijse.Entity.Product;

import java.sql.SQLException;


public interface ProductDAO extends CrudDAO<Product> {
    Product searchByName(String name) throws SQLException, ClassNotFoundException;

    boolean updateQty(String id, int qty);
}
