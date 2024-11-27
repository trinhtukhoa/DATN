package WebProject.WebProject.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import WebProject.WebProject.entity.Order;
import WebProject.WebProject.entity.User;
@Repository
public interface UserRepository extends JpaRepository<User, String>{
	User findByEmail(String email);
    Optional<User> findById(String id); // Đảm bảo Optional được parameterized với User
	
    @Query(value = "SELECT * FROM user WHERE id = ?1 AND role = ?2", nativeQuery = true)
    Optional<User> findByIdAndRole(String id, String role);

    
    @Query("SELECT u FROM User u WHERE u.user_Name = :userName")
    User findByUsername(@Param("userName") String userName);
//	void deleteById(String id);
}
