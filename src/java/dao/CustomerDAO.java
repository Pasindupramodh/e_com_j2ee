/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.HibernateUtil;
import dto.CustomerDTO;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import model.CusLogin;
import model.Customer;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
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

    public List<CustomerDTO> getAllCustomers() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {

            List<Customer> customers = session.createCriteria(Customer.class).list();

            List<CustomerDTO> customerDTOs = new ArrayList<>();

            for (Customer customer : customers) {
                CustomerDTO customerDTO = new CustomerDTO();
                customerDTO.setEmail(customer.getEmail());
                customerDTO.setFname(customer.getFname());
                customerDTO.setGender(customer.getGender());
                customerDTO.setId(customer.getId());
                customerDTO.setLname(customer.getLname());
                customerDTO.setMobile(customer.getMobile());

                if (!customer.getCusLogin().getStatus() && customer.getCusLogin().getVerifiedAt() == null) {
                    customerDTO.setStatus("Not Verified");
                } else if (!customer.getCusLogin().getStatus() && customer.getCusLogin().getVerifiedAt() != null) {
                    customerDTO.setStatus("Blocked");
                } else if (customer.getCusLogin().getStatus() && customer.getCusLogin().getVerifiedAt() != null) {
                    customerDTO.setStatus("Active");
                }
                customerDTOs.add(customerDTO);
            }

            return customerDTOs;

        } catch (Exception e) {
            return null;
        } finally {
            session.close();
        }
    }

    public boolean updatecustomerStatus(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction transaction = session.beginTransaction();

            Customer customer = (Customer) session.createCriteria(Customer.class)
                    .add(Restrictions.eq("id", id))
                    .uniqueResult();
            CusLogin cusLogin = customer.getCusLogin();

            if (cusLogin.getStatus()) {
                cusLogin.setStatus(Boolean.FALSE);
            } else {
                cusLogin.setStatus(Boolean.TRUE);
            }

            session.merge(cusLogin);
            transaction.commit();

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }

    public Long getCount() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Criteria criteria = session.createCriteria(Customer.class);

            criteria.setProjection(Projections.rowCount());
            return (Long) criteria.uniqueResult();
        } catch (Exception e) {
            return 0l;
        } finally {
            session.close();
        }

    }

}
