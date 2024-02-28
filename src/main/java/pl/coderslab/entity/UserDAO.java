package pl.coderslab.entity;

import org.mindrot.jbcrypt.BCrypt;
import pl.coderslab.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO {

    private static final String Q_CREATE_USER = "INSERT INTO users VALUES (DEFAULT, ?, ?, ?);";
    private static final String Q_DELETE_USER = "DELETE FROM users WHERE id = ?;";
    private static final String Q_READ_USER = "SELECT * FROM users WHERE id = ?;";
    private static final String Q_UPDATE_USER = "UPDATE users SET email = ?, username = ?, password = ? WHERE id = ?;";
    private static final String Q_FIND_ALL_USERS = "SELECT * FROM users;";

    public String hashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }

    public User create(User user) {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement createUser = conn.prepareStatement(Q_CREATE_USER, PreparedStatement.RETURN_GENERATED_KEYS)) {

            createUser.setString(1, user.getEmail());
            createUser.setString(2, user.getUsername());
            createUser.setString(3, this.hashPassword(user.getPassword()));
            createUser.executeUpdate();

            ResultSet rs = createUser.getGeneratedKeys();
            if (rs.next()) {
                user.setId(rs.getInt(1));
            }
            return user;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public User read(int userID) {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement readUser = conn.prepareStatement(Q_READ_USER)) {

            readUser.setInt(1, userID);
            readUser.executeQuery();
            ResultSet rs = readUser.getResultSet();
            User u = new User();

            if (rs.next()) {
                u.setId(rs.getInt(1));
                u.setEmail(rs.getString(2));
                u.setUsername(rs.getString(3));
                u.setPassword(rs.getString(4));
                return u;
            } else {
                System.out.println("User with id: " + userID + " doesn't exist.");
                return null;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public void update(User user) {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement updateUser = conn.prepareStatement(Q_UPDATE_USER)) {

            updateUser.setString(1, user.getEmail());
            updateUser.setString(2, user.getUsername());
            updateUser.setString(3, user.getPassword());
            updateUser.setInt(4, user.getId());
            updateUser.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }

    public void delete(int userID) {

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement deleteUser = conn.prepareStatement(Q_DELETE_USER)) {

            deleteUser.setInt(1, userID);
            deleteUser.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<User> findAll() {

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement allUsers = conn.prepareStatement(Q_FIND_ALL_USERS)) {

            allUsers.executeQuery();
            ResultSet rs = allUsers.getResultSet();
            ArrayList<User> wholeDB = new ArrayList<>();

            while (rs.next()) {
                wholeDB.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }
            return wholeDB;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
}
