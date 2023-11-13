/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.HibernateUtil;
import dto.CategoryDTO;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
import model.Category;
import model.SystemUser;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author pasin
 */
public class CategoryDAO {
    
    public boolean save(Category category) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction transaction = session.getTransaction();
            transaction.begin();
            session.persist(category);
            transaction.commit();
            return true;
            
        } catch (Exception e) {
            return false;
        }
    }
    
    public List<CategoryDTO> getAllCategoriess() {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Query query = session.createQuery("from Category");
            List<Category> categories = query.list();
            if (categories.isEmpty()) {
                return null;
            } else {
                List<CategoryDTO> categoryDTOs = new ArrayList<>();
                
                for (Category category : categories) {
                    CategoryDTO categoryDTO = new CategoryDTO();
                    categoryDTO.setCategoryDesc(category.getCategoryDesc());
                    categoryDTO.setCategoryName(category.getCategoryName());
                    categoryDTO.setId(category.getId());
                    categoryDTO.setStatus(category.getIsActive());
                    categoryDTO.setCategoryIcon(category.getCategoryIcon());
                    categoryDTOs.add(categoryDTO);
                }
                
                return categoryDTOs;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Category> getAllActiveCategoriess() {
        
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Criteria criteria = session.createCriteria(Category.class);
            criteria.add(Restrictions.eq("isActive", true));
            return criteria.list();
        } catch (HibernateException e) {
            e.printStackTrace();
            return null;
        }
        
    }
    
    public Category getById(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (Category) session.get(Category.class, id);
    }
    
    public boolean delete(int id) {
        
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Category category = (Category) session.get(Category.class, id);
            if (category.getIsActive()) {
                category.setIsActive(false);
            } else {
                category.setIsActive(true);
            }
            
            Transaction transaction = session.getTransaction();
            transaction.begin();
            session.merge(category);
            transaction.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        
    }
    
    public boolean update(String id, String name, String desc, String icon, SystemUser systemUser) {
        try {
            int idi = Integer.parseInt(id);
            Category category = getById(idi);
            if (category == null) {
                return false;
            } else {

                //Get current date of Sri Lanka
                Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Colombo"));
                Date currentDate = calendar.getTime();
                
                category.setCategoryDesc(desc);
                category.setCategoryIcon(icon);
                category.setCategoryName(name);
                category.setSystemUserByUpdatedBy(systemUser);
                category.setUpdatedAt(currentDate);
                Session session = HibernateUtil.getSessionFactory().openSession();
                Transaction transaction = session.getTransaction();
                transaction.begin();
                session.merge(category);
                transaction.commit();
                return true;
            }
        } catch (Exception e) {
            return false;
        }
    }
}
