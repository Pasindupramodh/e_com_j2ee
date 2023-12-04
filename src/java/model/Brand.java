package model;
// Generated Dec 1, 2023 12:00:23 AM by Hibernate Tools 4.3.1


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
 * Brand generated by hbm2java
 */
@Entity
@Table(name="brand"
    ,catalog="j2e_ecom_db"
)
public class Brand  implements java.io.Serializable {


     private Integer id;
     private Category category;
     private SystemUser systemUserByUpdatedBy;
     private SystemUser systemUserByCreatedBy;
     private String brandName;
     private String brandDesc;
     private String brandImage;
     private Boolean isActive;
     private Date createdAt;
     private Date updatedAt;
     private Set<Product> products = new HashSet<Product>(0);

    public Brand() {
    }

	
    public Brand(Category category, SystemUser systemUserByUpdatedBy, SystemUser systemUserByCreatedBy) {
        this.category = category;
        this.systemUserByUpdatedBy = systemUserByUpdatedBy;
        this.systemUserByCreatedBy = systemUserByCreatedBy;
    }
    public Brand(Category category, SystemUser systemUserByUpdatedBy, SystemUser systemUserByCreatedBy, String brandName, String brandDesc, String brandImage, Boolean isActive, Date createdAt, Date updatedAt, Set<Product> products) {
       this.category = category;
       this.systemUserByUpdatedBy = systemUserByUpdatedBy;
       this.systemUserByCreatedBy = systemUserByCreatedBy;
       this.brandName = brandName;
       this.brandDesc = brandDesc;
       this.brandImage = brandImage;
       this.isActive = isActive;
       this.createdAt = createdAt;
       this.updatedAt = updatedAt;
       this.products = products;
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
    @JoinColumn(name="category_id", nullable=false)
    public Category getCategory() {
        return this.category;
    }
    
    public void setCategory(Category category) {
        this.category = category;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="updated_by", nullable=false)
    public SystemUser getSystemUserByUpdatedBy() {
        return this.systemUserByUpdatedBy;
    }
    
    public void setSystemUserByUpdatedBy(SystemUser systemUserByUpdatedBy) {
        this.systemUserByUpdatedBy = systemUserByUpdatedBy;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="created_by", nullable=false)
    public SystemUser getSystemUserByCreatedBy() {
        return this.systemUserByCreatedBy;
    }
    
    public void setSystemUserByCreatedBy(SystemUser systemUserByCreatedBy) {
        this.systemUserByCreatedBy = systemUserByCreatedBy;
    }

    
    @Column(name="brand_name", length=50)
    public String getBrandName() {
        return this.brandName;
    }
    
    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    
    @Column(name="brand_desc", length=145)
    public String getBrandDesc() {
        return this.brandDesc;
    }
    
    public void setBrandDesc(String brandDesc) {
        this.brandDesc = brandDesc;
    }

    
    @Column(name="brand_image", length=445)
    public String getBrandImage() {
        return this.brandImage;
    }
    
    public void setBrandImage(String brandImage) {
        this.brandImage = brandImage;
    }

    
    @Column(name="is_active")
    public Boolean getIsActive() {
        return this.isActive;
    }
    
    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
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

@OneToMany(fetch=FetchType.LAZY, mappedBy="brand")
    public Set<Product> getProducts() {
        return this.products;
    }
    
    public void setProducts(Set<Product> products) {
        this.products = products;
    }




}


