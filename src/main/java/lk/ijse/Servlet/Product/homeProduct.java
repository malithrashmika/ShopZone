package lk.ijse.Servlet.Product;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.BO.BOFactory;
import lk.ijse.BO.ProductBO;
import lk.ijse.DTO.ProductDTO;

import java.io.IOException;
import java.util.List;


@WebServlet(name = "home_Product", value = "/homeProduct")
public class homeProduct extends HttpServlet {
    ProductBO productBO = (ProductBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Product);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*super.doGet(req, resp);*/
        try {
            List<ProductDTO> productDTOS = productBO.getAll();
            req.setAttribute("homeProducts", productDTOS);
            RequestDispatcher rd1  = req.getRequestDispatcher("home.jsp");
            rd1.forward(req, resp);

        } catch (Exception e) {
            req.setAttribute("alertType", "danger");
            req.setAttribute("alertMessage", "Error loading Products: " + e.getMessage());   }

    }
}
