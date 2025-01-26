package lk.ijse.BO;

import lk.ijse.DTO.LoginDTO;

public interface LoginBO extends SuperBO{
    public boolean save(LoginDTO dto) throws Exception;

}
