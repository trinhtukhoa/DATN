package WebProject.WebProject.service.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import WebProject.WebProject.entity.ProductImage;
import WebProject.WebProject.repository.ProductImageRepository;
import WebProject.WebProject.service.ProductImageService;

@Service

public class ProductImageServiceImpl implements ProductImageService{
	@Autowired
	ProductImageRepository productImageRepository;

	@Override
	public void save(ProductImage productImage) {
		productImageRepository.save(productImage);
	}

	@Override
	@Transactional
	public void deleteById(int id) {
	    productImageRepository.deleteProductImageById(id);
	}

	
}
