package model;
// Generated Nov 25, 2023 12:13:46 AM by Hibernate Tools 4.3.1


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
 * AttributeVariant generated by hbm2java
 */
@Entity
@Table(name="attribute_variant"
    ,catalog="j2e_ecom_db"
)
public class AttributeVariant  implements java.io.Serializable {


     private Integer id;
     private Gallery gallery;
     private Product product;
     private SystemUser systemUserByUpdatedby;
     private SystemUser systemUserByCreatedby;
     private String variantName;
     private Double price;
     private Double discountPrice;
     private Integer qty;
     private Date createdat;
     private Date updatedat;
     private Set<CartItem> cartItems = new HashSet<CartItem>(0);
     private Set<Order> orders = new HashSet<Order>(0);

    public AttributeVariant() {
    }

	
    public AttributeVariant(Gallery gallery, Product product, SystemUser systemUserByUpdatedby, SystemUser systemUserByCreatedby) {
        this.gallery = gallery;
        this.product = product;
        this.systemUserByUpdatedby = systemUserByUpdatedby;
        this.systemUserByCreatedby = systemUserByCreatedby;
    }
    public AttributeVariant(Gallery gallery, Product product, SystemUser systemUserByUpdatedby, SystemUser systemUserByCreatedby, String variantName, Double price, Double discountPrice, Integer qty, Date createdat, Date updatedat, Set<CartItem> cartItems, Set<Order> orders) {
       this.gallery = gallery;
       this.product = product;
       this.systemUserByUpdatedby = systemUserByUpdatedby;
       this.systemUserByCreatedby = systemUserByCreatedby;
       this.variantName = variantName;
       this.price = price;
       this.discountPrice = discountPrice;
       this.qty = qty;
       this.createdat = createdat;
       this.updatedat = updatedat;
       this.cartItems = cartItems;
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
    @JoinColumn(name="gallery_id", nullable=false)
    public Gallery getGallery() {
        return this.gallery;
    }
    
    public void setGallery(Gallery gallery) {
        this.gallery = gallery;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="product_id", nullable=false)
    public Product getProduct() {
        return this.product;
    }
    
    public void setProduct(Product product) {
        this.product = product;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="updatedby", nullable=false)
    public SystemUser getSystemUserByUpdatedby() {
        return this.systemUserByUpdatedby;
    }
    
    public void setSystemUserByUpdatedby(SystemUser systemUserByUpdatedby) {
        this.systemUserByUpdatedby = systemUserByUpdatedby;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="createdby", nullable=false)
    public SystemUser getSystemUserByCreatedby() {
        return this.systemUserByCreatedby;
    }
    
    public void setSystemUserByCreatedby(SystemUser systemUserByCreatedby) {
        this.systemUserByCreatedby = systemUserByCreatedby;
    }

    
    @Column(name="variant_name", length=50)
    public String getVariantName() {
        return this.variantName;
    }
    
    public void setVariantName(String variantName) {
        this.variantName = variantName;
    }

    
    @Column(name="price", precision=22, scale=0)
    public Double getPrice() {
        return this.price;
    }
    
    public void setPrice(Double price) {
        this.price = price;
    }

    
    @Column(name="discount_price", precision=22, scale=0)
    public Double getDiscountPrice() {
        return this.discountPrice;
    }
    
    public void setDiscountPrice(Double discountPrice) {
        this.discountPrice = discountPrice;
    }

    
    @Column(name="qty")
    public Integer getQty() {
        return this.qty;
    }
    
    public void setQty(Integer qty) {
        this.qty = qty;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="createdat", length=19)
    public Date getCreatedat() {
        return this.createdat;
    }
    
    public void setCreatedat(Date createdat) {
        this.createdat = createdat;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="updatedat", length=19)
    public Date getUpdatedat() {
        return this.updatedat;
    }
    
    public void setUpdatedat(Date updatedat) {
        this.updatedat = updatedat;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="attributeVariant")
    public Set<CartItem> getCartItems() {
        return this.cartItems;
    }
    
    public void setCartItems(Set<CartItem> cartItems) {
        this.cartItems = cartItems;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="attributeVariant")
    public Set<Order> getOrders() {
        return this.orders;
    }
    
    public void setOrders(Set<Order> orders) {
        this.orders = orders;
    }




}


