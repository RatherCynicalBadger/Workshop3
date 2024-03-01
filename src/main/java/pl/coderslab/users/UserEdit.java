package pl.coderslab.users;

import pl.coderslab.entity.User;
import pl.coderslab.entity.UserDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(value = "/user/edit")
public class UserEdit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession();
        UserDAO dao = (UserDAO) session.getAttribute("userDAO");
        int userID = Integer.parseInt(request.getParameter("id"));
        User editedUser = dao.read(userID);

        session.setAttribute("user", editedUser);
        session.setAttribute("action", "edit");
        response.sendRedirect("/user/list");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession();
        UserDAO dao = (UserDAO) session.getAttribute("userDAO");

        User editedUser = (User) session.getAttribute("user");
        editedUser.setUsername(request.getParameter("username"));
        editedUser.setEmail(request.getParameter("email"));
        editedUser.setPassword(dao.hashPassword(request.getParameter("password")));
        dao.update(editedUser);
        response.sendRedirect("/user/list");
    }
}