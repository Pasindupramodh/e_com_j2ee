/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.HibernateUtil;
import java.util.List;
import model.Province;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author REDTECH
 */
public class ProvinceDAO {
    public List<Province> getAllProvinces(){
        return HibernateUtil.getSessionFactory().openSession()
                .createCriteria(Province.class).list();
    }

    public Province getById(int state) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            return (Province) session.createCriteria(Province.class)
                    .add(Restrictions.eq("id", state))
                    .uniqueResult();
        } catch (Exception e) {
            return null;
        }finally{
            session.close();
        }
    }
}
