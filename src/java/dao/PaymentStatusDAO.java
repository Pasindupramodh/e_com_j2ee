/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.HibernateUtil;
import model.PaymentStatus;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author REDTECH
 */
public class PaymentStatusDAO {
    
    public PaymentStatus getExistPaymentStatus(String status, String code){
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            
            return (PaymentStatus) session.createCriteria(PaymentStatus.class)
                    .add(Restrictions.eq("statusCode", code))
                    .add(Restrictions.eq("status", status))
                    .uniqueResult();
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }finally{
            session.close();
        }
    }
    
}
