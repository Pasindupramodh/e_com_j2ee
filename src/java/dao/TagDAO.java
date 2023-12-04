/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.HibernateUtil;
import model.Tag;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author pasin
 */
public class TagDAO {
    public Tag getByTagName(String tagName){
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            return (Tag) session.createCriteria(Tag.class).add(Restrictions.eq("tagName", tagName)).uniqueResult();
        } catch (Exception e) {
            return null;
        }
    }
}
