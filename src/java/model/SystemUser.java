package model;
// Generated Dec 15, 2023 11:19:00 AM by Hibernate Tools 4.3.1


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
 * SystemUser generated by hbm2java
 */
@Entity
@Table(name="system_user"
    ,catalog="j2e_ecom_db"
)
public class SystemUser  implements java.io.Serializable {


     private Integer id;
     private Login login;
     private SystemUser systemUserByCreatedBy;
     private SystemUser systemUserByUpdatedBy;
     private UserType userType;
     private String fname;
     private String lname;
     private String mobile;
     private String email;
     private Date createdAt;
     private Date updatedAt;
     private boolean isActive;
     private Set<OrderStatus> orderStatuses = new HashSet<OrderStatus>(0);
     private Set<SystemUser> systemUsersForCreatedBy = new HashSet<SystemUser>(0);
     private Set<OrderHasOrderStatus> orderHasOrderStatuses = new HashSet<OrderHasOrderStatus>(0);
     private Set<Category> categoriesForCreatedBy = new HashSet<Category>(0);
     private Set<Brand> brandsForUpdatedBy = new HashSet<Brand>(0);
     private Set<Category> categoriesForUpdatedBy = new HashSet<Category>(0);
     private Set<Product> productsForUpdatedBy = new HashSet<Product>(0);
     private Set<Brand> brandsForCreatedBy = new HashSet<Brand>(0);
     private Set<AttributeVariant> attributeVariantsForUpdatedby = new HashSet<AttributeVariant>(0);
     private Set<AttributeVariant> attributeVariantsForCreatedby = new HashSet<AttributeVariant>(0);
     private Set<Product> productsForCreatedBy = new HashSet<Product>(0);
     private Set<SystemUser> systemUsersForUpdatedBy = new HashSet<SystemUser>(0);

    public SystemUser() {
    }

	
    public SystemUser(Login login, UserType userType, boolean isActive) {
        this.login = login;
        this.userType = userType;
        this.isActive = isActive;
    }
    public SystemUser(Login login, SystemUser systemUserByCreatedBy, SystemUser systemUserByUpdatedBy, UserType userType, String fname, String lname, String mobile, String email, Date createdAt, Date updatedAt, boolean isActive, Set<OrderStatus> orderStatuses, Set<SystemUser> systemUsersForCreatedBy, Set<OrderHasOrderStatus> orderHasOrderStatuses, Set<Category> categoriesForCreatedBy, Set<Brand> brandsForUpdatedBy, Set<Category> categoriesForUpdatedBy, Set<Product> productsForUpdatedBy, Set<Brand> brandsForCreatedBy, Set<AttributeVariant> attributeVariantsForUpdatedby, Set<AttributeVariant> attributeVariantsForCreatedby, Set<Product> productsForCreatedBy, Set<SystemUser> systemUsersForUpdatedBy) {
       this.login = login;
       this.systemUserByCreatedBy = systemUserByCreatedBy;
       this.systemUserByUpdatedBy = systemUserByUpdatedBy;
       this.userType = userType;
       this.fname = fname;
       this.lname = lname;
       this.mobile = mobile;
       this.email = email;
       this.createdAt = createdAt;
       this.updatedAt = updatedAt;
       this.isActive = isActive;
       this.orderStatuses = orderStatuses;
       this.systemUsersForCreatedBy = systemUsersForCreatedBy;
       this.orderHasOrderStatuses = orderHasOrderStatuses;
       this.categoriesForCreatedBy = categoriesForCreatedBy;
       this.brandsForUpdatedBy = brandsForUpdatedBy;
       this.categoriesForUpdatedBy = categoriesForUpdatedBy;
       this.productsForUpdatedBy = productsForUpdatedBy;
       this.brandsForCreatedBy = brandsForCreatedBy;
       this.attributeVariantsForUpdatedby = attributeVariantsForUpdatedby;
       this.attributeVariantsForCreatedby = attributeVariantsForCreatedby;
       this.productsForCreatedBy = productsForCreatedBy;
       this.systemUsersForUpdatedBy = systemUsersForUpdatedBy;
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
    @JoinColumn(name="login_id", nullable=false)
    public Login getLogin() {
        return this.login;
    }
    
    public void setLogin(Login login) {
        this.login = login;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="created_by")
    public SystemUser getSystemUserByCreatedBy() {
        return this.systemUserByCreatedBy;
    }
    
    public void setSystemUserByCreatedBy(SystemUser systemUserByCreatedBy) {
        this.systemUserByCreatedBy = systemUserByCreatedBy;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="updated_by")
    public SystemUser getSystemUserByUpdatedBy() {
        return this.systemUserByUpdatedBy;
    }
    
    public void setSystemUserByUpdatedBy(SystemUser systemUserByUpdatedBy) {
        this.systemUserByUpdatedBy = systemUserByUpdatedBy;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="user_type_id", nullable=false)
    public UserType getUserType() {
        return this.userType;
    }
    
    public void setUserType(UserType userType) {
        this.userType = userType;
    }

    
    @Column(name="fname", length=145)
    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }

    
    @Column(name="lname", length=145)
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

    
    @Column(name="is_active", nullable=false)
    public boolean isIsActive() {
        return this.isActive;
    }
    
    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="systemUser")
    public Set<OrderStatus> getOrderStatuses() {
        return this.orderStatuses;
    }
    
    public void setOrderStatuses(Set<OrderStatus> orderStatuses) {
        this.orderStatuses = orderStatuses;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="systemUserByCreatedBy")
    public Set<SystemUser> getSystemUsersForCreatedBy() {
        return this.systemUsersForCreatedBy;
    }
    
    public void setSystemUsersForCreatedBy(Set<SystemUser> systemUsersForCreatedBy) {
        this.systemUsersForCreatedBy = systemUsersForCreatedBy;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="systemUser")
    public Set<OrderHasOrderStatus> getOrderHasOrderStatuses() {
        return this.orderHasOrderStatuses;
    }
    
    public void setOrderHasOrderStatuses(Set<OrderHasOrderStatus> orderHasOrderStatuses) {
        this.orderHasOrderStatuses = orderHasOrderStatuses;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="systemUserByCreatedBy")
    public Set<Category> getCategoriesForCreatedBy() {
        return this.categoriesForCreatedBy;
    }
    
    public void setCategoriesForCreatedBy(Set<Category> categoriesForCreatedBy) {
        this.categoriesForCreatedBy = categoriesForCreatedBy;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="systemUserByUpdatedBy")
    public Set<Brand> getBrandsForUpdatedBy() {
        return this.brandsForUpdatedBy;
    }
    
    public void setBrandsForUpdatedBy(Set<Brand> brandsForUpdatedBy) {
        this.brandsForUpdatedBy = brandsForUpdatedBy;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="systemUserByUpdatedBy")
    public Set<Category> getCategoriesForUpdatedBy() {
        return this.categoriesForUpdatedBy;
    }
    
    public void setCategoriesForUpdatedBy(Set<Category> categoriesForUpdatedBy) {
        this.categoriesForUpdatedBy = categoriesForUpdatedBy;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="systemUserByUpdatedBy")
    public Set<Product> getProductsForUpdatedBy() {
        return this.productsForUpdatedBy;
    }
    
    public void setProductsForUpdatedBy(Set<Product> productsForUpdatedBy) {
        this.productsForUpdatedBy = productsForUpdatedBy;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="systemUserByCreatedBy")
    public Set<Brand> getBrandsForCreatedBy() {
        return this.brandsForCreatedBy;
    }
    
    public void setBrandsForCreatedBy(Set<Brand> brandsForCreatedBy) {
        this.brandsForCreatedBy = brandsForCreatedBy;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="systemUserByUpdatedby")
    public Set<AttributeVariant> getAttributeVariantsForUpdatedby() {
        return this.attributeVariantsForUpdatedby;
    }
    
    public void setAttributeVariantsForUpdatedby(Set<AttributeVariant> attributeVariantsForUpdatedby) {
        this.attributeVariantsForUpdatedby = attributeVariantsForUpdatedby;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="systemUserByCreatedby")
    public Set<AttributeVariant> getAttributeVariantsForCreatedby() {
        return this.attributeVariantsForCreatedby;
    }
    
    public void setAttributeVariantsForCreatedby(Set<AttributeVariant> attributeVariantsForCreatedby) {
        this.attributeVariantsForCreatedby = attributeVariantsForCreatedby;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="systemUserByCreatedBy")
    public Set<Product> getProductsForCreatedBy() {
        return this.productsForCreatedBy;
    }
    
    public void setProductsForCreatedBy(Set<Product> productsForCreatedBy) {
        this.productsForCreatedBy = productsForCreatedBy;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="systemUserByUpdatedBy")
    public Set<SystemUser> getSystemUsersForUpdatedBy() {
        return this.systemUsersForUpdatedBy;
    }
    
    public void setSystemUsersForUpdatedBy(Set<SystemUser> systemUsersForUpdatedBy) {
        this.systemUsersForUpdatedBy = systemUsersForUpdatedBy;
    }




}


