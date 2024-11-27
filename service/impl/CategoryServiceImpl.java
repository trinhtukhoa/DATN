package WebProject.WebProject.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import WebProject.WebProject.entity.Category;
import WebProject.WebProject.repository.CategoryRepository;
import WebProject.WebProject.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    CategoryRepository categoryRepository;
    
    @Override
    public Category saveCategory(Category category) {
        return categoryRepository.save(category); // Save the category to the database
    }

    @Override
    public Category getCategoryById(int id) {
        Optional<Category> category = categoryRepository.findById(id); // Use Optional to avoid NullPointerException
        return category.orElse(null); // Return the category or null if not found
    }

    @Override
    public Category updateCategory(Category category) {
        if (categoryRepository.existsById(category.getId())) { // Check if the category exists
            return categoryRepository.save(category); // Save updated category
        } else {
            return null; // Category not found
        }
    }

    @Override
    public void deleteCategoryId(int id) {
        if (categoryRepository.existsById(id)) { // Check if the category exists
            categoryRepository.deleteById(id); // Delete the category
        }
    }

    @Override
    public List<Category> findAll() {
        return categoryRepository.findAll(); // Retrieve all categories
    }
}
