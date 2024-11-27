package WebProject.WebProject.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import WebProject.WebProject.entity.Product;
/**
 * @author HOAN HAO
 *
 */
@Repository
public interface ProductRepository extends JpaRepository<Product,Integer>{
	
	@Query(value = "SELECT * FROM product p WHERE p.product_name LIKE CONCAT('%', :name, '%')", nativeQuery = true)
	List<Product> findByProduct_NameContaining(@Param("name") String name);

	
	@Query(value="Select * From product p ORDER BY p.quantity DESC LIMIT 12;",nativeQuery = true)
	List<Product> findTop12ProductBestSellers();
	
	@Query(value="Select * From product p ORDER BY p.created_at DESC LIMIT 12;",nativeQuery = true)
	List<Product> findTop12ProductNewArrivals();
	
	Page<Product> findAllByCategory_id(int id, Pageable pageable);
	
	Product findById(int id);
	
	@Query(value = "SELECT * FROM `fashionstore1`.product p WHERE p.product_name LIKE CONCAT('%', ?1, '%') AND p.category_id = ?2", nativeQuery = true)
	Page<Product> findByProduct_NameAndCategory_idContaining(String name, int category_id, Pageable pageable);

	
	@Query(value = "SELECT * FROM `fashionstore1`.product p WHERE p.product_name LIKE CONCAT('%', ?1, '%')", nativeQuery = true)
	Page<Product> findByProduct_NameContaining(String name, Pageable pageable);

	
	@Query(value="select * from product p where p.category_id = ?1 ORDER BY p.sold DESC LIMIT 4;",nativeQuery = true)
	List<Product> findTop4ProductByCategory_id(int id);
	
//	@Query(value="SELECT * FROM product p ORDER BY p.price ASC", nativeQuery = true)
//	List<Product> findTop12ProductByPriceAsc();
//
//	@Query(value="SELECT * FROM product p ORDER BY p.price DESC", nativeQuery = true)
//	List<Product> findTop12ProductByPriceDesc();

}
