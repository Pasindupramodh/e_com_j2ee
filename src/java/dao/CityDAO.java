/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.HibernateUtil;
import dto.CityDTO;
import dto.ProvinceDTO;
import java.util.ArrayList;
import java.util.List;
import model.City;
import model.Province;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author REDTECH
 */
public class CityDAO {

    public List<CityDTO> getCityByProvince(Province province) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {

            List<City> citys = session.createCriteria(City.class)
                    .add(Restrictions.eq("province", province))
                    .list();

            if (citys != null && !citys.isEmpty()) {
                List<CityDTO> cityDTOs = new ArrayList<>();
                for (City city : citys) {
                    CityDTO cityDTO = new CityDTO();
                    cityDTO.setId(city.getId());
                    cityDTO.setName(city.getName());
                    ProvinceDTO provinceDTO = new ProvinceDTO();
                    provinceDTO.setId(city.getProvince().getId());
                    provinceDTO.setName(city.getProvince().getName());
                    cityDTO.setProvinceDTO(provinceDTO);

                    cityDTOs.add(cityDTO);
                }

                return cityDTOs;
            } else {
                return null;
            }

        } catch (Exception e) {
            return null;
        } finally {
            session.close();
        }
    }

    public CityDTO getCityById(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            City city = (City) session.createCriteria(City.class)
                    .add(Restrictions.eq("id", id))
                    .uniqueResult();
            if (city == null) {
                return null;
            } else {
                CityDTO cityDTO = new CityDTO();
                cityDTO.setId(city.getId());
                cityDTO.setName(city.getName());
                ProvinceDTO provinceDTO = new ProvinceDTO();
                provinceDTO.setId(city.getProvince().getId());
                provinceDTO.setName(city.getProvince().getName());
                cityDTO.setProvinceDTO(provinceDTO);

                return cityDTO;
            }
        } catch (Exception e) {
            return null;
        } finally {
            session.close();
        }
    }

    public City getCityModelById(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            City city = (City) session.createCriteria(City.class)
                    .add(Restrictions.eq("id", id))
                    .uniqueResult();
            if (city == null) {
                return null;
            } else {

                return city;
            }
        } catch (Exception e) {
            return null;
        } finally {
            session.close();
        }
    }
}
