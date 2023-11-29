/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.HibernateUtil;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.Part;
import model.AttributeVariant;
import model.Gallery;
import model.Product;
import model.SystemUser;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import services.FileUpload;

/**
 *
 * @author pasin
 */
public class VarientDAO {

    public boolean save(ServletContext servletContext, String productId, String varientName, double dis, int qt, double pri, Part image, Date currentDate, SystemUser systemUser) {

        Product product = new ProductDAO().getById(productId);

        if (product != null) {

            try {
                FileUpload.FileItem fileItem = new FileUpload(servletContext).upload("products", image.getInputStream(), image);
                if (fileItem != null) {
                    String imagePath = fileItem.getFullUrl();

                    Session session = HibernateUtil.getSessionFactory().openSession();
                    Transaction transaction = session.getTransaction();
                    transaction.begin();

                    Gallery gallery = new Gallery();
                    gallery.setCreatedAt(currentDate);
                    gallery.setImgPath(imagePath);
                    gallery.setProduct(product);
                    gallery.setThumbnail(Boolean.FALSE);
                    gallery.setUpdatedAt(currentDate);

                    AttributeVariant attributeVariant = new AttributeVariant();
                    attributeVariant.setCreatedat(currentDate);
                    attributeVariant.setDiscountPrice(dis);
                    attributeVariant.setPrice(pri);
                    attributeVariant.setProduct(product);
                    attributeVariant.setQty(qt);
                    attributeVariant.setSystemUserByCreatedby(systemUser);
                    attributeVariant.setSystemUserByUpdatedby(systemUser);
                    attributeVariant.setUpdatedat(currentDate);
                    attributeVariant.setVariantName(varientName);
                    attributeVariant.setGallery(gallery);

                    session.persist(gallery);
                    session.persist(attributeVariant);

                    transaction.commit();
                    return true;

                }

            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }

            return false;
        } else {
            return false;
        }

    }

    public List<AttributeVariant> getAll() {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Criteria criteria = session.createCriteria(AttributeVariant.class);
            return criteria.list();
        } catch (Exception e) {
            return null;
        }
    }

    public AttributeVariant getById(int id) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Criteria criteria = session.createCriteria(AttributeVariant.class);
            criteria.add(Restrictions.eq("id", id));
            return (AttributeVariant) criteria.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean update(ServletContext servletContext, int id, String varientName, double dis, int qt, double pri, Part image, Date currentDate, SystemUser systemUser) {

        try {

            AttributeVariant attributeVariant = getById(id);

            if (attributeVariant != null) {

                FileUpload fileUpload = new FileUpload(servletContext);
                fileUpload.delete(attributeVariant.getGallery().getImgPath(), "products");

                FileUpload.FileItem fileItem = fileUpload.upload("products", image.getInputStream(), image);
                if (fileItem != null) {
                    Session session = HibernateUtil.getSessionFactory().openSession();
                    Transaction transaction = session.getTransaction();
                    transaction.begin();

                    String imagePath = fileItem.getFullUrl();
                    Gallery gallery = attributeVariant.getGallery();
                    gallery.setImgPath(imagePath);

                    session.merge(gallery);

                    attributeVariant.setDiscountPrice(dis);
                    attributeVariant.setPrice(pri);
                    attributeVariant.setQty(qt);
                    attributeVariant.setSystemUserByUpdatedby(systemUser);
                    attributeVariant.setUpdatedat(currentDate);
                    attributeVariant.setVariantName(varientName);

                    session.merge(attributeVariant);

                    transaction.commit();
                    return true;
                }
            }

            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    public boolean update(int id, String varientName, double dis, int qt, double pri, Date currentDate, SystemUser systemUser) {

        try {

            AttributeVariant attributeVariant = getById(id);

            if (attributeVariant != null) {

                
                    Session session = HibernateUtil.getSessionFactory().openSession();
                    Transaction transaction = session.getTransaction();
                    transaction.begin();

                    attributeVariant.setDiscountPrice(dis);
                    attributeVariant.setPrice(pri);
                    attributeVariant.setQty(qt);
                    attributeVariant.setSystemUserByUpdatedby(systemUser);
                    attributeVariant.setUpdatedat(currentDate);
                    attributeVariant.setVariantName(varientName);

                    session.merge(attributeVariant);

                    transaction.commit();
                    return true;
            }

            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

}
