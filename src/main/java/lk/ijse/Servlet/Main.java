package lk.ijse.Servlet;

import lk.ijse.BO.BOFactory;
import lk.ijse.BO.CartBO;


public class Main {
    static CartBO cartBO = (CartBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Cart);

    public static void main(String[] args) throws Exception {
         int id = 32;
         boolean isdelete = cartBO.delete(String.valueOf(id));
         if(isdelete){
             System.out.println("Deleted Successfully");
         }else{
             System.out.println("Failed to delete");
         }



    }
}
