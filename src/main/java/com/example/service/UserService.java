package com.example.service;
import com.example.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import java.util.List;
@Service
public class UserService {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    public List<User> getAllUsers() {
        return jdbcTemplate.query("SELECT * FROM users", new BeanPropertyRowMapper<>(User.class));
    }
    public void saveUser(User user) {
        if (user.getId() > 0) {
            jdbcTemplate.update("UPDATE users SET name=?, email=? WHERE id=?", user.getName(), user.getEmail(), user.getId());
        } else {
            jdbcTemplate.update("INSERT INTO users (name, email) VALUES (?, ?)", user.getName(), user.getEmail());
        }
    }
    public User getUserById(int id) {
        return jdbcTemplate.queryForObject("SELECT * FROM users WHERE id=?", new BeanPropertyRowMapper<>(User.class), id);
    }
    public void deleteUser(int id) {
        jdbcTemplate.update("DELETE FROM users WHERE id=?", id);
    }
}