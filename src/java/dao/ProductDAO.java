/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.HibernateUtil;
import java.io.IOException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.http.Part;
import model.Brand;
import model.Gallery;
import model.Product;
import model.SystemUser;
import model.Tag;
import org.hibernate.Session;
import org.hibernate.Transaction;
import services.FileUpload;

/**
 *
 * @author pasin
 */
public class ProductDAO {

    public boolean save(ServletContext servletContext, Part productImage, String productName, double discount, 
            int qty, double price, int brandId, String[] tags, boolean publishe, String shortDesc,
            String productDescription , Date currentDate, SystemUser systemUser) {
        
        try {
            FileUpload.FileItem fileItem = new FileUpload(servletContext).upload("products", productImage.getInputStream(), productImage);
            if (fileItem != null) {
                String imagePath = fileItem.getFullUrl();
                
                Brand brand = new BrandDao().getById(brandId);
                if(brand != null){
                    
                    Product product = new Product();
                    
                    product.setBrand(brand);
                    product.setCreatedAt(currentDate);
                    product.setDescription(productDescription);
                    product.setDiscountPrice(discount);
                    product.setProductName(productName);
                    product.setProductPrice(price);
                    product.setPublished(publishe);
                    product.setQty(price);
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

                    for(String tag: tags){
                        Tag t = new Tag();
                        t.setTagName(tag);
                        t.setProduct(product);
                        session.persist(t);
                    }

                    transaction.commit();
                    
                    
                    return true;
                }else{
                    return false;
                }
                
                
                
                
            }else{
                return false;
            }
        } catch (IOException ex) {
            ex.printStackTrace();
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
    }

}
