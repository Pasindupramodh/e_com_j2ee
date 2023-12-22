/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.HibernateUtil;
import dto.BrandDTO;
import dto.CartDTO;
import dto.CartItemDTO;
import dto.CategoryDTO;
import dto.GalleryDTO;
import dto.ProductDTO;
import dto.TagDTO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
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
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
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

                    Set<Tag> set = new HashSet<>();

                    for (String tag : tags) {
                        Tag t = new TagDAO().getByTagName(tag);
                        if (t == null) {
                            t = new Tag();
                            t.setTagName(tag);
                            session.persist(t);
                        }
                        set.add(t);
                    }
                    product.setTags(set);
                    session.persist(product);

                    session.persist(gallery);

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

                        Set<Tag> set = new HashSet<>();

                        for (String tag : tags) {
                            Tag t = new TagDAO().getByTagName(tag);
                            if (t == null) {
                                t = new Tag();
                                t.setTagName(tag);
                                session.persist(t);
                            }
                            if (!product.getTags().contains(t)) {
                                set.add(t);
                            }
                        }
                        product.setTags(set);

                        session.merge(product);

                        session.merge(gallery);
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

                Set<Tag> set = new HashSet<>();

                for (String tag : tags) {
                    Tag t = new TagDAO().getByTagName(tag);
                    if (t == null) {
                        t = new Tag();
                        t.setTagName(tag);
                        session.persist(t);
                    }
                    if (!product.getTags().contains(t)) {
                        set.add(t);
                    }
                }
                product.setTags(set);
                session.merge(product);
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

    public Product getById(String productId) {
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

    public List<Product> getAllPublished() {
        try {

            Session session = HibernateUtil.getSessionFactory().openSession();
            return session.createCriteria(Product.class).add(Restrictions.eq("published", true)).addOrder(Order.desc("discountPrice")).list();
        } catch (Exception e) {
            return null;
        }
    }

    public List<Product> getAllPublished(String orderBy, int count) {
        try {

            Session session = HibernateUtil.getSessionFactory().openSession();
            return session.createCriteria(Product.class).add(Restrictions.eq("published", true)).addOrder(Order.desc(orderBy)).setMaxResults(count).list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Product> getPaginateItems(int first, String order) {
        Session session = connection.HibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(Product.class);
        criteria.add(Restrictions.eq("published", true));
        if (order.equals("priceDesc")) {
            criteria.addOrder(Order.desc("productPrice"));
        } else if (order.equals("createdAt")) {
            criteria.addOrder(Order.desc("createdAt"));
        } else {
            criteria.addOrder(Order.asc(order));
        }

        criteria.setFirstResult(first);
        criteria.setMaxResults(12);
        return criteria.list();
    }

    public int getCount() {
        Session session = connection.HibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(Product.class);
        return Integer.parseInt(criteria.add(Restrictions.eq("published", true)).setProjection(Projections.rowCount()).uniqueResult().toString());
    }

    public void updateQTY(CartDTO cart) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {

            Transaction transaction = session.beginTransaction();

            for (CartItemDTO cartItemDTO : cart.getCartItemDTOs()) {
                Product product = (Product) session.get(Product.class, cartItemDTO.getProductDTO().getId());
                double newQTY = product.getQty() - cartItemDTO.getQty();
                product.setQty(newQTY);
                if (newQTY < 1) {
                    product.setPublished(Boolean.FALSE);
                }
                session.merge(product);
            }
            transaction.commit();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void updateQTY(Integer id, int productQTY) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {

            Transaction transaction = session.beginTransaction();

            Product product = (Product) session.get(Product.class, id);
            double newQTY = product.getQty() - productQTY;
            product.setQty(newQTY);
            if (newQTY < 1) {
                product.setPublished(Boolean.FALSE);
            }
            session.merge(product);
            transaction.commit();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public List<ProductDTO> getByBrand(String brandid) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {

            Brand brand = (Brand) session.createCriteria(Brand.class)
                    .add(Restrictions.eq("id", Integer.parseInt(brandid)))
                    .uniqueResult();
            if (brand.getProducts().isEmpty()) {
                return null;
            } else {
                List<ProductDTO> productDTOs = new ArrayList<>();
                for (Product product : brand.getProducts()) {
                    if(getProductDto(product) != null){
                            productDTOs.add(getProductDto(product));
                        }
                }
                return productDTOs;
            }

        } catch (Exception e) {
            return null;
        } finally {
            session.close();
        }
    }

    public List<ProductDTO> getByCategory(String parameter) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {

            Category category = (Category) session.createCriteria(Category.class)
                    .add(Restrictions.eq("id", Integer.parseInt(parameter)))
                    .uniqueResult();
            if (category.getBrands().isEmpty()) {
                return null;
            } else {
                List<ProductDTO> productDTOs = new ArrayList<>();
                for (Brand brand : category.getBrands()) {
                    for (Product product : brand.getProducts()) {
                        if(getProductDto(product) != null){
                            productDTOs.add(getProductDto(product));
                        }
                    }
                }

                return productDTOs;
            }

        } catch (Exception e) {
            return null;
        } finally {
            session.close();
        }
    }

    public List<ProductDTO> getByTag(String tagName) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {

            List<Tag> tags = session.createCriteria(Tag.class).add(Restrictions.like("tagName", tagName + "%")).list();

            if (tags != null && !tags.isEmpty()) {
                List<ProductDTO> productDTOs = new ArrayList<>();
                for (Tag tag : tags) {

                    for (Product product : tag.getProducts()) {
                        if(getProductDto(product) != null){
                            productDTOs.add(getProductDto(product));
                        }
                    }
                }
                return productDTOs;
            } else {
                return null;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }

    ProductDTO getProductDto(Product product) {
        if (product != null) {

            if (product.getPublished() && product.getQty() > 0) {
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
            }else{
                return  null;
            }

        } else {
            return null;
        }
    }

}
