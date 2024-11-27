package WebProject.WebProject.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import WebProject.WebProject.entity.Category;

public interface CategoryRepository extends JpaRepository<Category,Integer> {
	
	Category getById(int id);

}
