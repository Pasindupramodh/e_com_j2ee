package model;
// Generated Nov 22, 2023 10:04:55 PM by Hibernate Tools 4.3.1


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Address generated by hbm2java
 */
@Entity
@Table(name="address"
    ,catalog="j2e_ecom_db"
)
public class Address  implements java.io.Serializable {


     private Integer id;
     private City city;
     private Customer customer;
     private String addressLine1;
     private String addressLine2;
     private Boolean isDefault;
     private Date createdAt;
     private Date updatedAt;

    public Address() {
    }

	
    public Address(City city, Customer customer) {
        this.city = city;
        this.customer = customer;
    }
    public Address(City city, Customer customer, String addressLine1, String addressLine2, Boolean isDefault, Date createdAt, Date updatedAt) {
       this.city = city;
       this.customer = customer;
       this.addressLine1 = addressLine1;
       this.addressLine2 = addressLine2;
       this.isDefault = isDefault;
       this.createdAt = createdAt;
       this.updatedAt = updatedAt;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="id", unique=true, nullable=false)
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="city_id", nullable=false)
    public City getCity() {
        return this.city;
    }
    
    public void setCity(City city) {
        this.city = city;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="customer_id", nullable=false)
    public Customer getCustomer() {
        return this.customer;
    }
    
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    
    @Column(name="address_line_1", length=245)
    public String getAddressLine1() {
        return this.addressLine1;
    }
    
    public void setAddressLine1(String addressLine1) {
        this.addressLine1 = addressLine1;
    }

    
    @Column(name="address_line_2", length=245)
    public String getAddressLine2() {
        return this.addressLine2;
    }
    
    public void setAddressLine2(String addressLine2) {
        this.addressLine2 = addressLine2;
    }

    
    @Column(name="is_default")
    public Boolean getIsDefault() {
        return this.isDefault;
    }
    
    public void setIsDefault(Boolean isDefault) {
        this.isDefault = isDefault;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="created_at", length=19)
    public Date getCreatedAt() {
        return this.createdAt;
    }
    
    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="updated_at", length=19)
    public Date getUpdatedAt() {
        return this.updatedAt;
    }
    
    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }




}

