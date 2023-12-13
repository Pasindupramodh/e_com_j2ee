/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.HibernateUtil;
import java.util.Optional;
import model.CusLogin;
import model.Customer;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author pasin
 */
public class CustomerDAO {

    public Customer getById(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (Customer) session.get(Customer.class, id);
    }

    public Customer getByEmail(String email) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {

            return (Customer) session.createCriteria(Customer.class)
                    .add(Restrictions.eq("email", email))
                    .uniqueResult();

        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
        }
    }

    public boolean save(CusLogin cusLogin, Customer user) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction transaction = session.beginTransaction();
            session.persist(cusLogin);
            session.persist(user);
            transaction.commit();
            return true;
        } catch (Exception e) {
            return false;
        } finally {
            session.close();

        }

    }
}
