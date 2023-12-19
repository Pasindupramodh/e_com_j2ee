package model;
// Generated Dec 19, 2023 1:28:57 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Customer generated by hbm2java
 */
@Entity
@Table(name="customer"
    ,catalog="j2e_ecom_db"
)
public class Customer  implements java.io.Serializable {


     private Integer id;
     private CusLogin cusLogin;
     private String fname;
     private String lname;
     private String mobile;
     private String email;
     private String gender;
     private Date createdAt;
     private Date updatedAt;
     private Set<Reviews> reviewses = new HashSet<Reviews>(0);
     private Set<Address> addresses = new HashSet<Address>(0);
     private Set<Cart> carts = new HashSet<Cart>(0);
     private Set<Order> orders = new HashSet<Order>(0);

    public Customer() {
    }

	
    public Customer(CusLogin cusLogin) {
        this.cusLogin = cusLogin;
    }
    public Customer(CusLogin cusLogin, String fname, String lname, String mobile, String email, String gender, Date createdAt, Date updatedAt, Set<Reviews> reviewses, Set<Address> addresses, Set<Cart> carts, Set<Order> orders) {
       this.cusLogin = cusLogin;
       this.fname = fname;
       this.lname = lname;
       this.mobile = mobile;
       this.email = email;
       this.gender = gender;
       this.createdAt = createdAt;
       this.updatedAt = updatedAt;
       this.reviewses = reviewses;
       this.addresses = addresses;
       this.carts = carts;
       this.orders = orders;
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
    @JoinColumn(name="cus_login_id", nullable=false)
    public CusLogin getCusLogin() {
        return this.cusLogin;
    }
    
    public void setCusLogin(CusLogin cusLogin) {
        this.cusLogin = cusLogin;
    }

    
    @Column(name="fname", length=245)
    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }

    
    @Column(name="lname", length=245)
    public String getLname() {
        return this.lname;
    }
    
    public void setLname(String lname) {
        this.lname = lname;
    }

    
    @Column(name="mobile", length=15)
    public String getMobile() {
        return this.mobile;
    }
    
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    
    @Column(name="email", length=245)
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    
    @Column(name="gender", length=15)
    public String getGender() {
        return this.gender;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
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

@OneToMany(fetch=FetchType.LAZY, mappedBy="customer")
    public Set<Reviews> getReviewses() {
        return this.reviewses;
    }
    
    public void setReviewses(Set<Reviews> reviewses) {
        this.reviewses = reviewses;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="customer")
    public Set<Address> getAddresses() {
        return this.addresses;
    }
    
    public void setAddresses(Set<Address> addresses) {
        this.addresses = addresses;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="customer")
    public Set<Cart> getCarts() {
        return this.carts;
    }
    
    public void setCarts(Set<Cart> carts) {
        this.carts = carts;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="customer")
    public Set<Order> getOrders() {
        return this.orders;
    }
    
    public void setOrders(Set<Order> orders) {
        this.orders = orders;
    }




}


