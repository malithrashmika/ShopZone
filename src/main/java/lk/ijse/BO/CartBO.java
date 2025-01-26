package lk.ijse.BO;

import lk.ijse.DTO.CartDTO;

import java.sql.SQLException;
import java.util.List;


public interface CartBO extends SuperBO{
    boolean save(CartDTO entity) throws Exception;

    boolean update(CartDTO entity) throws Exception;

    boolean delete(String ID) throws Exception;

    boolean deleteUserID(String ID) throws Exception;

    List<CartDTO> getAll() throws SQLException, ClassNotFoundException;

    List<CartDTO> getCartsByUserId(int userId);
}
