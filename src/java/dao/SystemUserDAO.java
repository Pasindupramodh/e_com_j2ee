/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.HibernateUtil;
import dto.SystemUserDTO;
import dto.UserData;
import java.util.ArrayList;
import java.util.List;
import model.Login;
import model.SystemUser;
import model.UserType;
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
public class SystemUserDAO {

    public List<UserType> getUserType() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query createQuery = session.createQuery("from UserType");
        return createQuery.list();
    }

    public UserType getUserTypeById(Integer id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (UserType) session.get(UserType.class, id);
    }

    public String save(Login login, SystemUser systemUser, UserData userData) {

        if (getUserByEmail(systemUser.getEmail()) == null) {
            if (new LoginDAO().getByUserName(login.getUsername()) == null) {
                Session session = HibernateUtil.getSessionFactory().openSession();
                Transaction transaction = session.getTransaction();

                try {
                    transaction.begin();
                    session.persist(login);
                    session.persist(systemUser);
                    transaction.commit();
                    return "Success";
                } catch (Exception e) {
                    e.printStackTrace();
                    return "Error while saving";
                }
            }else{
                return "Username Exsists";
            }

        } else {
            return "User email Exsists";
        }

    }

    public SystemUser getUserByEmail(String email) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(SystemUser.class);
        criteria.add(Restrictions.eq("email", email));
        return (SystemUser) criteria.uniqueResult();
    }

    public SystemUser getUserById(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (SystemUser) session.get(SystemUser.class, id);
    }

    public List<SystemUserDTO> getAllSystemUsers() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("from SystemUser");
        List<SystemUser> systemUsers = query.list();
        if (systemUsers.isEmpty()) {
            return null;
        }
        List<SystemUserDTO> systemUserDTOs = new ArrayList<>();
        for (SystemUser systemUser : systemUsers) {
            SystemUserDTO systemUserDTO = new SystemUserDTO();
            systemUserDTO.setId(systemUser.getId());
            systemUserDTO.setLoginId(systemUser.getLogin().getId());
            systemUserDTO.setActive(systemUser.isIsActive());
            systemUserDTO.setFname(systemUser.getFname());
            systemUserDTO.setLname(systemUser.getLname());
            systemUserDTO.setEmail(systemUser.getEmail());
            systemUserDTO.setMobile(systemUser.getMobile());
            systemUserDTO.setCreatedAt(systemUser.getCreatedAt());
            systemUserDTO.setUpdatedAt(systemUser.getUpdatedAt());
            systemUserDTO.setUserType(systemUser.getUserType().getUserType());
            systemUserDTO.setCreatedByName(systemUser.getSystemUserByCreatedBy().getFname() + " " + systemUser.getSystemUserByCreatedBy().getLname());
            systemUserDTO.setCreatedById(systemUser.getSystemUserByCreatedBy().getId());
            systemUserDTO.setUpdatedByName(systemUser.getSystemUserByUpdatedBy().getFname() + " " + systemUser.getSystemUserByUpdatedBy().getLname());
            systemUserDTO.setUpdatedById(systemUser.getSystemUserByUpdatedBy().getId());
            systemUserDTOs.add(systemUserDTO);
        }
        return systemUserDTOs;
    }

    public void delete(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        SystemUser systemUser = (SystemUser) session.get(SystemUser.class, id);
        if (systemUser.isIsActive()) {
            systemUser.setIsActive(false);
        } else {
            systemUser.setIsActive(true);
        }

        Transaction transaction = session.getTransaction();
        transaction.begin();
        session.merge(systemUser);
        transaction.commit();
    }

    public boolean update(SystemUser systemUser) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction transaction = session.getTransaction();
            transaction.begin();
            session.merge(systemUser);
            transaction.commit();
            return true;
        } catch (HibernateException e) {
            return false;
        }
    }
}
