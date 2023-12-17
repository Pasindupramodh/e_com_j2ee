/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.HibernateUtil;
import model.OrderStatus;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author REDTECH
 */
public class OrderStatusDAO {
    
    public OrderStatus getOrderStatusByStatus(String status){
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            return (OrderStatus) session.createCriteria(OrderStatus.class)
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
