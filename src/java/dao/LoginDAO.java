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
import model.Login;
import model.SystemUser;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import util.Encryption;

/**
 *
 * @author pasin
 */
public class LoginDAO {

    public Login login(String username, String password) {
        String encPassword = Encryption.encrypt(password);

        Session session = HibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(Login.class);
        criteria.add(Restrictions.eq("username", username));
        criteria.add(Restrictions.eq("password", encPassword));

        return (Login) criteria.uniqueResult();
    }

    public Login getById(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (Login) session.get(Login.class, id);
    }

    public Login getByUserName(String username) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(Login.class);
        criteria.add(Restrictions.eq("username", username));

        return (Login) criteria.uniqueResult();
    }

    public boolean update(String username, String password, String idq) {
        try {
            String encPassword = Encryption.encrypt(password);

            //Get current date of Sri Lanka
            Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Colombo"));
            Date currentDate = calendar.getTime();

            int id = Integer.parseInt(idq);
            Login login = getById(id);

            if (login != null) {
                if (getByUserName(username) == null) {
                    login.setUsername(username);
                    login.setPassword(encPassword);
                    login.setUpdatedAt(currentDate);

                    Session session = HibernateUtil.getSessionFactory().openSession();
                    Transaction transaction = session.getTransaction();
                    transaction.begin();
                    session.merge(login);
                    transaction.commit();
                    return true;
                } else {
                    return false;
                }

            } else {
                return false;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updatePassword(String userName, String newPassword) {
        SystemUserDAO systemUserDAO = new SystemUserDAO();
        SystemUser systemUser = systemUserDAO.getUserByEmail(userName);
        if (systemUser != null) {
            Session session = HibernateUtil.getSessionFactory().openSession();
            try {
                Login login = systemUser.getLogin();
                Transaction transaction = session.beginTransaction();
                login.setPassword(Encryption.encrypt(newPassword));
                
                session.merge(login);
                
                transaction.commit();
                return true;
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        }
        return false;
    }

}
