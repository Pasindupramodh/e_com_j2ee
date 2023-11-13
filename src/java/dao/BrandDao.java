/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.HibernateUtil;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
import javax.servlet.ServletContext;
import javax.servlet.http.Part;
import model.Brand;
import model.Category;
import model.SystemUser;
import org.apache.commons.io.FilenameUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author pasin
 */
public class BrandDao {

    public boolean save(Brand brand) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction transaction = session.getTransaction();
            transaction.begin();
            session.persist(brand);
            transaction.commit();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public List<Brand> getAllBrands() {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Query query = session.createQuery("from Brand");
            return query.list();
        } catch (Exception e) {
            return null;
        }
    }

    public Brand getById(int id) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            return (Brand) session.get(Brand.class, id);
        } catch (Exception e) {
            return null;
        }
    }

    public boolean delete(int id) {
        try {
            Brand brand = getById(id);
            if (brand != null) {
                Session session = HibernateUtil.getSessionFactory().openSession();
                if (brand.getIsActive()) {
                    brand.setIsActive(Boolean.FALSE);
                } else {
                    brand.setIsActive(Boolean.TRUE);
                }

                Transaction transaction = session.getTransaction();
                transaction.begin();
                session.merge(brand);
                transaction.commit();
                return true;
            } else {
                return false;
            }

        } catch (Exception e) {
            return false;
        }
    }

    public boolean update(SystemUser systemUser,int id, String brandName, String brandDesc, int category, Part part, ServletContext context) {
        try {
            Brand brand = getById(id);
            if (brand != null) {
                //get current image full name
                String fileName = FilenameUtils.getName(brand.getBrandImage());

                FileUpload fileUpload = new FileUpload(context);
                //delete current image
                boolean delete = fileUpload.delete(fileName, "brands");

                if (delete) {

                    Category categoryMoel = new CategoryDAO().getById(category);

                    //Get current date of Sri Lanka
                    Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Colombo"));
                    Date currentDate = calendar.getTime();

                    //upload new image
                    FileUpload.FileItem fileItem = fileUpload.upload("brands", part.getInputStream(), part);

                    brand.setBrandImage(fileItem.getFullUrl());
                    brand.setCategory(categoryMoel);
                    brand.setBrandDesc(brandDesc);
                    brand.setBrandName(brandName);
                    brand.setUpdatedAt(currentDate);
                    brand.setSystemUserByUpdatedBy(systemUser);
                    
                    Session session = HibernateUtil.getSessionFactory().openSession();
                    Transaction transaction = session.beginTransaction();
                    session.merge(brand);
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

    public boolean update(SystemUser systemUser, int id, String brandName, String brandDesc, int category) {
      try {
            Brand brand = getById(id);
            if (brand != null) {
                
                    Category categoryMoel = new CategoryDAO().getById(category);

                    //Get current date of Sri Lanka
                    Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Colombo"));
                    Date currentDate = calendar.getTime();

                    brand.setCategory(categoryMoel);
                    brand.setBrandDesc(brandDesc);
                    brand.setBrandName(brandName);
                    brand.setUpdatedAt(currentDate);
                    brand.setSystemUserByUpdatedBy(systemUser);
                    
                    Session session = HibernateUtil.getSessionFactory().openSession();
                    Transaction transaction = session.beginTransaction();
                    session.merge(brand);
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
