package lk.ijse.DAO;

import lk.ijse.Entity.Cart;

import java.util.List;


public interface CartDAO extends CrudDAO<Cart> {
    List<Cart> getCartsByUserId(int userId);

    boolean deleteUserID(int ID);
}
