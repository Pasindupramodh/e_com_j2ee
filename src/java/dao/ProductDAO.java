/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.HibernateUtil;
import dto.BrandDTO;
import dto.CategoryDTO;
import dto.GalleryDTO;
import dto.ProductDTO;
import dto.TagDTO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.http.Part;
import model.Brand;
import model.Category;
import model.Gallery;
import model.Product;
import model.SystemUser;
import model.Tag;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import services.FileUpload;

/**
 *
 * @author pasin
 */
public class ProductDAO {

    public boolean save(ServletContext servletContext, Part productImage, String productName, double discount,
            double qty, double price, int brandId, String[] tags, boolean publishe, String shortDesc,
            String productDescription, Date currentDate, SystemUser systemUser) {

        try {
            FileUpload.FileItem fileItem = new FileUpload(servletContext).upload("products", productImage.getInputStream(), productImage);
            if (fileItem != null) {
                String imagePath = fileItem.getFullUrl();

                Brand brand = new BrandDao().getById(brandId);
                if (brand != null) {

                    Product product = new Product();

                    product.setBrand(brand);
                    product.setCreatedAt(currentDate);
                    product.setDescription(productDescription);
                    product.setDiscountPrice(discount);
                    product.setProductName(productName);
                    product.setProductPrice(price);
                    product.setPublished(publishe);
                    product.setQty(qty);
                    product.setShortDescription(shortDesc);
                    product.setSystemUserByCreatedBy(systemUser);
                    product.setSystemUserByUpdatedBy(systemUser);
                    product.setUpdatedAt(currentDate);

                    Gallery gallery = new Gallery();
                    gallery.setCreatedAt(currentDate);
                    gallery.setImgPath(imagePath);
                    gallery.setProduct(product);
                    gallery.setThumbnail(true);
                    gallery.setUpdatedAt(currentDate);

                    Session session = HibernateUtil.getSessionFactory().openSession();
                    Transaction transaction = session.getTransaction();
                    transaction.begin();

                    session.persist(product);

                    session.persist(gallery);

                    for (String tag : tags) {
                        Tag t = new Tag();
                        t.setTagName(tag);
                        t.setProduct(product);
                        session.persist(t);
                    }

                    transaction.commit();

                    return true;
                } else {
                    return false;
                }

            } else {
                return false;
            }
        } catch (IOException ex) {
            ex.printStackTrace();
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }

    }

    public List<ProductDTO> getAllProducts() {
        Session session = HibernateUtil.getSessionFactory().openSession();
//        Query createQuery = session.createQuery("from Product");
        Criteria criteria = session.createCriteria(Product.class);

        List<Product> products = criteria.list();

        List<ProductDTO> productDTOs = null;

        if (!criteria.list().isEmpty()) {
            productDTOs = new ArrayList<>();
            for (Product product : products) {

                ProductDTO productDTO = new ProductDTO();

                Brand brand = product.getBrand();
                Category category = brand.getCategory();

                CategoryDTO categoryDTO = new CategoryDTO();
                categoryDTO.setCategoryDesc(category.getCategoryDesc());
                categoryDTO.setCategoryIcon(category.getCategoryIcon());
                categoryDTO.setCategoryName(category.getCategoryName());
                categoryDTO.setId(category.getId());
                categoryDTO.setStatus(category.getIsActive());

                BrandDTO brandDTO = new BrandDTO();
                brandDTO.setBrandDesc(brand.getBrandDesc());
                brandDTO.setBrandImage(brand.getBrandImage());
                brandDTO.setBrandName(brand.getBrandName());
                brandDTO.setId(brand.getId());
                brandDTO.setCategory(categoryDTO);

                List<GalleryDTO> galleryDTOs = null;
                if (!product.getGalleries().isEmpty()) {
                    galleryDTOs = new ArrayList<>();
                    for (Gallery gallery : product.getGalleries()) {
                        GalleryDTO galleryDTO = new GalleryDTO();
                        galleryDTO.setId(gallery.getId());
                        galleryDTO.setImgPath(gallery.getImgPath());
                        galleryDTO.setThumbnail(gallery.getThumbnail());
                        galleryDTOs.add(galleryDTO);
                    }
                }

                List<TagDTO> tagDTOs = null;

                if (!product.getTags().isEmpty()) {
                    tagDTOs = new ArrayList<>();
                    for (Tag tag : product.getTags()) {
                        TagDTO tagDTO = new TagDTO();
                        tagDTO.setId(tag.getId());
                        tagDTO.setTagName(tag.getTagName());
                        tagDTOs.add(tagDTO);
                    }
                }

                productDTO.setBrand(brandDTO);
                productDTO.setDescription(product.getDescription());
                productDTO.setDiscountPrice(product.getDiscountPrice());
                productDTO.setGalleries(galleryDTOs);
                productDTO.setId(product.getId());
                productDTO.setProductName(product.getProductName());
                productDTO.setProductPrice(product.getProductPrice());
                productDTO.setPublished(product.getPublished());
                productDTO.setQty(product.getQty());
                productDTO.setShortDescription(product.getShortDescription());
                productDTO.setTags(tagDTOs);
                productDTOs.add(productDTO);
            }
        }

        return productDTOs;

    }

    public ProductDTO getById(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
//        Query createQuery = session.createQuery("from Product");
        Criteria criteria = session.createCriteria(Product.class);
        criteria.add(Restrictions.eq("id", id));
        Product product = (Product) criteria.uniqueResult();

        if (product != null) {

            ProductDTO productDTO = new ProductDTO();

            Brand brand = product.getBrand();
            Category category = brand.getCategory();

            CategoryDTO categoryDTO = new CategoryDTO();
            categoryDTO.setCategoryDesc(category.getCategoryDesc());
            categoryDTO.setCategoryIcon(category.getCategoryIcon());
            categoryDTO.setCategoryName(category.getCategoryName());
            categoryDTO.setId(category.getId());
            categoryDTO.setStatus(category.getIsActive());

            BrandDTO brandDTO = new BrandDTO();
            brandDTO.setBrandDesc(brand.getBrandDesc());
            brandDTO.setBrandImage(brand.getBrandImage());
            brandDTO.setBrandName(brand.getBrandName());
            brandDTO.setId(brand.getId());
            brandDTO.setCategory(categoryDTO);

            List<GalleryDTO> galleryDTOs = null;
            if (!product.getGalleries().isEmpty()) {
                galleryDTOs = new ArrayList<>();
                for (Gallery gallery : product.getGalleries()) {
                    GalleryDTO galleryDTO = new GalleryDTO();
                    galleryDTO.setId(gallery.getId());
                    galleryDTO.setImgPath(gallery.getImgPath());
                    galleryDTO.setThumbnail(gallery.getThumbnail());
                    galleryDTOs.add(galleryDTO);
                }
            }

            List<TagDTO> tagDTOs = null;

            if (!product.getTags().isEmpty()) {
                tagDTOs = new ArrayList<>();
                for (Tag tag : product.getTags()) {
                    TagDTO tagDTO = new TagDTO();
                    tagDTO.setId(tag.getId());
                    tagDTO.setTagName(tag.getTagName());
                    tagDTOs.add(tagDTO);
                }
            }

            productDTO.setBrand(brandDTO);
            productDTO.setDescription(product.getDescription());
            productDTO.setDiscountPrice(product.getDiscountPrice());
            productDTO.setGalleries(galleryDTOs);
            productDTO.setId(product.getId());
            productDTO.setProductName(product.getProductName());
            productDTO.setProductPrice(product.getProductPrice());
            productDTO.setPublished(product.getPublished());
            productDTO.setQty(product.getQty());
            productDTO.setShortDescription(product.getShortDescription());
            productDTO.setTags(tagDTOs);
            return productDTO;
        }

        return null;

    }

    public boolean update(ServletContext servletContext, int productId, Part productImage, String productName, double discount, double qty, double price, int brandId, String[] tags, boolean publishe, String shortDesc, String productDescription, Date currentDate, SystemUser systemUser) {

        try {
            FileUpload fileUpload = new FileUpload(servletContext);

            ProductDTO productDTO = getById(productId);
            String image = "";
            int galleryId = 0;
            for (GalleryDTO galleryDTO : productDTO.getGalleries()) {
                if (galleryDTO.getThumbnail()) {
                    image = galleryDTO.getImgPath();
                    galleryId = galleryDTO.getId();
                    break;
                }
            }

            boolean delete = fileUpload.delete(image, "products");
            if (delete) {
                FileUpload.FileItem fileItem = new FileUpload(servletContext).upload("products", productImage.getInputStream(), productImage);
                if (fileItem != null) {
                    String imagePath = fileItem.getFullUrl();

                    Brand brand = new BrandDao().getById(brandId);
                    if (brand != null) {

                        Session session = HibernateUtil.getSessionFactory().openSession();
//        Query createQuery = session.createQuery("from Product");
                        Criteria criteria = session.createCriteria(Product.class);
                        criteria.add(Restrictions.eq("id", productId));
                        Product product = (Product) criteria.uniqueResult();
                        product.setBrand(brand);
                        product.setDescription(productDescription);
                        product.setDiscountPrice(discount);
                        product.setProductName(productName);
                        product.setProductPrice(price);
                        product.setPublished(publishe);
                        product.setQty(qty);
                        product.setShortDescription(shortDesc);
                        product.setSystemUserByUpdatedBy(systemUser);
                        product.setUpdatedAt(currentDate);

                        Gallery gallery = new Gallery();
                        gallery.setId(galleryId);
                        gallery.setImgPath(imagePath);
                        gallery.setProduct(product);
                        gallery.setThumbnail(true);
                        gallery.setUpdatedAt(currentDate);

                        Transaction transaction = session.getTransaction();
                        transaction.begin();

                        session.merge(product);

                        session.merge(gallery);
                        for (TagDTO tagDTO : productDTO.getTags()) {
                            Tag t = new Tag();
                            t.setId(tagDTO.getId());
                            t.setTagName(tagDTO.getTagName());
                            session.delete(t);

                        }
                        for (String tag : tags) {
                            Tag t = new Tag();
                            t.setTagName(tag);
                            t.setProduct(product);
                            session.persist(t);
                        }

                        transaction.commit();

                        return true;
                    } else {
                        return false;
                    }

                } else {
                    return false;
                }
            } else {
                return false;
            }
        } catch (IOException ex) {
            ex.printStackTrace();
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }

    }

    public boolean update(int productId, String productName, double discount, double qty, double price, int brandId, String[] tags, boolean publishe, String shortDesc, String productDescription, Date currentDate, SystemUser systemUser) {
        try {

            ProductDTO productDTO = getById(productId);

            Brand brand = new BrandDao().getById(brandId);
            if (brand != null) {
                Session session = HibernateUtil.getSessionFactory().openSession();
//        Query createQuery = session.createQuery("from Product");
                Criteria criteria = session.createCriteria(Product.class);
                criteria.add(Restrictions.eq("id", productId));
                Product product = (Product) criteria.uniqueResult();
                product.setId(productId);
                product.setBrand(brand);
                product.setDescription(productDescription);
                product.setDiscountPrice(discount);
                product.setProductName(productName);
                product.setProductPrice(price);
                product.setPublished(publishe);
                product.setQty(qty);
                product.setShortDescription(shortDesc);
                product.setSystemUserByUpdatedBy(systemUser);
                product.setUpdatedAt(currentDate);

                Transaction transaction = session.getTransaction();
                transaction.begin();

                session.merge(product);

                for (TagDTO tagDTO : productDTO.getTags()) {
                    Tag t = new Tag();
                    t.setId(tagDTO.getId());
                    t.setTagName(tagDTO.getTagName());
                    session.delete(t);
                }

                for (String tag : tags) {
                    Tag t = new Tag();
                    t.setTagName(tag);
                    t.setProduct(product);
                    session.persist(t);
                }

                transaction.commit();

                return true;
            } else {
                return false;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }

    }

    Product getById(String productId) {
        try {
            int id = Integer.parseInt(productId);
            Session session = HibernateUtil.getSessionFactory().openSession();
            Criteria criteria = session.createCriteria(Product.class);
            criteria.add(Restrictions.eq("id", id));
            return (Product) criteria.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
