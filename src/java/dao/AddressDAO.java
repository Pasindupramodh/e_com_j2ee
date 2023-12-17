/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.HibernateUtil;
import dto.AddressDTO;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
import model.Address;
import model.Customer;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author REDTECH
 */
public class AddressDAO {

    public List<AddressDTO> saveAddress(Customer customer, String fname,
            String lname, String street, String streetOptional, String city,
            String state, String zip, String phone, boolean aDefault) {

        Session session = HibernateUtil.getSessionFactory().openSession();

        try {

            //Get current date of Sri Lanka
            Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Colombo"));
            Date currentDate = calendar.getTime();

            Transaction transaction = session.beginTransaction();

            if (aDefault) {
                List<Address> addresses = getAllAddressListsByCustomer(customer);
                if (addresses != null && !addresses.isEmpty()) {
                    for (Address addressCheck : addresses) {
                        if (addressCheck.getIsDefault()) {
                            addressCheck.setIsDefault(false);
                            session.merge(addressCheck);
                            break;
                        }
                    }
                }
            }

            Address address = new Address();
            address.setAddressLine1(street);
            address.setAddressLine2(streetOptional);
            address.setCity(new CityDAO().getCityModelById(Integer.valueOf(city)));
            address.setCreatedAt(currentDate);
            address.setCustomer(customer);
            address.setFname(fname);
            address.setIsDefault(aDefault);
            address.setLname(lname);
            address.setPhone(phone);
            address.setUpdatedAt(currentDate);
            address.setZipcode(zip);

            session.persist(address);

            transaction.commit();

            return getAllAddressByCustomer(customer, address);
        } catch (NumberFormatException e) {
            return null;
        } finally {
            session.close();
        }

    }

    public List<AddressDTO> getAllAddressByCustomer(Customer customer, Address addressRecent) {

        List<Address> addresses = getAllAddressListsByCustomer(customer);

        if (addressRecent != null) {
            addresses.add(addressRecent);
        }

        if (addresses == null || addresses.isEmpty()) {
            return null;
        } else {
            List<AddressDTO> addressDTOs = new ArrayList<>();

            addresses.stream().map((address) -> {
                AddressDTO addressDTO = new AddressDTO();
                addressDTO.setId(address.getId());
                addressDTO.setAddressLine1(address.getAddressLine1());
                addressDTO.setAddressLine2(address.getAddressLine2());
                addressDTO.setCity(new CityDAO().getCityById(address.getCity().getId()));
                addressDTO.setFname(address.getFname());
                addressDTO.setIsDefault(address.getIsDefault());
                addressDTO.setLname(address.getLname());
                addressDTO.setPhone(address.getPhone());
                addressDTO.setZipcode(address.getZipcode());
                return addressDTO;
            }).forEachOrdered((addressDTO) -> {
                addressDTOs.add(addressDTO);
            });
            return addressDTOs;
        }

    }

    List<Address> getAllAddressListsByCustomer(Customer customer) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            List<Address> addresses = session.createCriteria(Address.class)
                    .add(Restrictions.eq("customer", customer))
                    .list();
            return addresses;
        } catch (HibernateException e) {
            return null;
        } finally {
            session.close();
        }
    }

    public AddressDTO getById(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Address address = (Address) session.createCriteria(Address.class).add(Restrictions.eq("id", id)).uniqueResult();

            AddressDTO addressDTO = new AddressDTO();
            addressDTO.setId(address.getId());
            addressDTO.setAddressLine1(address.getAddressLine1());
            addressDTO.setAddressLine2(address.getAddressLine2());
            addressDTO.setCity(new CityDAO().getCityById(address.getCity().getId()));
            addressDTO.setFname(address.getFname());
            addressDTO.setIsDefault(address.getIsDefault());
            addressDTO.setLname(address.getLname());
            addressDTO.setPhone(address.getPhone());
            addressDTO.setZipcode(address.getZipcode());
            
            return addressDTO;
        } catch (Exception e) {
            return null;
        } finally {
            session.close();
        }
    }
    
    public Address getAddressModelById(int id){
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        try {
            return (Address) session.get(Address.class, id);
        } catch (Exception e) {
            return null;
        }finally{
            session.close();
        }
    }
    
}
