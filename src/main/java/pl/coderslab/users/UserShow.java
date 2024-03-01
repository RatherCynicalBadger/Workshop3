package pl.coderslab.users;

import pl.coderslab.entity.User;
import pl.coderslab.entity.UserDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(value = "/user/show")
public class UserShow extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession();

        UserDAO dao = (UserDAO) session.getAttribute("userDAO");
        int id = Integer.parseInt(request.getParameter("id"));

        User user = dao.read(id);

        if (user == null) {
            System.out.println("Something went wrong");
            response.sendRedirect("/user/list");
            return;
        }

        session.setAttribute("user", user);
        session.setAttribute("action", "show");
        response.sendRedirect("/user/list");
    }
}