package lk.ijse.BO;

import lk.ijse.DTO.CheckOutDTO;

public interface CheckOutBO extends SuperBO{
    boolean saveData(CheckOutDTO checkOutDTO) throws Exception;
}
