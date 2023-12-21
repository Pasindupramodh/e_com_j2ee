/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.HibernateUtil;
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
            
            Transaction transaction = session.beginTransaction();
            
            Reviews reviews = new Reviews();
            reviews.setCustomer(customer);
            reviews.setIsAnonymous(anonymous);
            reviews.setProduct(product1);
            reviews.setReview(review);
            reviews.setStarCount(starCount);
            
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
