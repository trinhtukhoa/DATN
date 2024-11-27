package WebProject.WebProject.service.impl;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import WebProject.WebProject.entity.User;
import WebProject.WebProject.repository.UserRepository;
import WebProject.WebProject.service.UserService;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public List<User> getAllUser() {
        return userRepository.findAll();
    }

    @Override
    public User saveUser(User user) {
        return userRepository.save(user); // Sử dụng cho cả lưu và cập nhật
    }

    @Override
    public User updateUser(User user) {
        Optional<User> existingUser = userRepository.findById(user.getId());
        if (existingUser.isPresent()) {
            return userRepository.save(user); // Cập nhật nếu tồn tại
        } else {
            throw new RuntimeException("Không tìm thấy User với ID: " + user.getId());
        }
    }
    @Override
    public void deleteUserById(String id) {
        if (userRepository.existsById(id)) {
            userRepository.deleteById(id);
        } else {
            throw new RuntimeException("Không tìm thấy User với ID: " + id);
        }
    }

    @Override
    public User GetUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public User findByIdAndRole(String id, String role) {
        Optional<User> userOptional = userRepository.findByIdAndRole(id, role);

        // Kiểm tra nếu không tìm thấy người dùng và ném ra ngoại lệ
        return userOptional.orElseThrow(() -> new EntityNotFoundException("Không tìm thấy người dùng với ID: " + id + " và vai trò: " + role));
    }

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public User getUserById(String id) {
        return userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy User với ID: " + id));
    }
}

