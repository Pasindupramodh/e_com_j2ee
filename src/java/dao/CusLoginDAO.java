/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.HibernateUtil;
import java.util.Optional;
import javax.persistence.NoResultException;
import model.CusLogin;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author pasin
 */
public class CusLoginDAO {

    public CusLogin getByVC(String token) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            return (CusLogin) session.createCriteria(CusLogin.class)
                    .add(Restrictions.eq("varifyCode", token))
                    .uniqueResult();
        } catch (HibernateException e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }

    public boolean update(CusLogin cusLogin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction transaction = session.beginTransaction();
            session.merge(cusLogin);
            transaction.commit();
            return true;
        } catch (Exception e) {
            return false;
        } finally {
            session.close();
        }
    }

    public CusLogin getByEmail(String email) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            return (CusLogin) session.createQuery("select u from CusLogin u where u.username=:email")
                    .setParameter("email", email).
                    uniqueResult();
        } catch (NoResultException ex) {
            
            return null;
        } finally {

            session.close();

        }

    }

}
