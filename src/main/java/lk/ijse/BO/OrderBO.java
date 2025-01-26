package lk.ijse.BO;

import lk.ijse.DTO.OrderDTO;

public interface OrderBO extends SuperBO {
    boolean save(OrderDTO dto) throws Exception;

    OrderDTO getLastOrderId();
}
