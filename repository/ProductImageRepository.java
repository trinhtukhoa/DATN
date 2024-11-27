package WebProject.WebProject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import WebProject.WebProject.entity.ProductImage;

public interface ProductImageRepository extends JpaRepository<ProductImage,Integer>{
	@Modifying
	@Query("DELETE FROM ProductImage pi WHERE pi.id = :id")
	void deleteProductImageById(@Param("id") int id);

}
