
/**
 * Author: vishmee
 * Date: 1/16/25
 * Time: 2:48 AM
 * Description:
 */
package lk.ijse.Servlet.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.BO.BOFactory;
import lk.ijse.BO.UserBO;
import lk.ijse.BO.custom.UserBOImpl;
import lk.ijse.DTO.UserDTO;
import lk.ijse.Entity.User;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "UserSaveServlet", value = "/registerServlet")
public class User_Post extends HttpServlet {

    UserBO userBO = (UserBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.User);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        String role = "Customer";

        try {
            User user = userBO.searchByEmail(email);

            if (user != null) {
                req.setAttribute("error", "Email already exists.");
                req.getRequestDispatcher("UserRegister.jsp").forward(req, resp);
                return;
            }

            if (!password.equals(confirmPassword)) {
                req.setAttribute("error", "Passwords do not match.");
                req.getRequestDispatcher("UserRegister.jsp").forward(req, resp);
                return;
            }

            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
            UserDTO userDTO = new UserDTO(1, name, hashedPassword, email, role);

            userBO.save(userDTO);
            req.setAttribute("success", "User register Success.");
            req.getRequestDispatcher("index.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Failed to register user. Try again later.");
            req.getRequestDispatcher("UserRegister.jsp").forward(req, resp);
        }
    }

}
