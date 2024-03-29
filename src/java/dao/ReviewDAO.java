/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.HibernateUtil;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;
import model.Customer;
import model.Product;
import model.Reviews;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author REDTECH
 */
public class ReviewDAO {

    public boolean saveReview(Product product1, Customer customer, boolean anonymous, int starCount, String review) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            
            //Get current date of Sri Lanka
            Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Colombo"));
            Date currentDate = calendar.getTime();
            
            Transaction transaction = session.beginTransaction();
            
            Reviews reviews = new Reviews();
            reviews.setCustomer(customer);
            reviews.setIsAnonymous(anonymous);
            reviews.setProduct(product1);
            reviews.setReview(review);
            reviews.setStarCount(starCount);
            reviews.setDate(currentDate);
            
            session.persist(reviews);
            
            transaction.commit();
            
            return true;
            
        } catch (Exception e) {
            return false;
        }finally{
            session.close();
        }
    }
    
}
