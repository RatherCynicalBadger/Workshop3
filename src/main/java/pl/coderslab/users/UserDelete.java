package pl.coderslab.users;

import pl.coderslab.entity.UserDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(value = "/user/delete")
public class UserDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession();
        UserDAO dao = (UserDAO) session.getAttribute("userDAO");
        int userID = Integer.parseInt(request.getParameter("id"));
        dao.delete(userID);
        response.sendRedirect("/user/list");
    }
}