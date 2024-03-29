package model;
// Generated Dec 19, 2023 1:28:57 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * OrderItem generated by hbm2java
 */
@Entity
@Table(name="order_item"
    ,catalog="j2e_ecom_db"
)
public class OrderItem  implements java.io.Serializable {


     private Integer id;
     private AttributeVariant attributeVariant;
     private Order order;
     private Product product;
     private Double qty;
     private Double unitprice;
     private Double discount;
     private Double totaldiscount;

    public OrderItem() {
    }

	
    public OrderItem(Order order, Product product) {
        this.order = order;
        this.product = product;
    }
    public OrderItem(AttributeVariant attributeVariant, Order order, Product product, Double qty, Double unitprice, Double discount, Double totaldiscount) {
       this.attributeVariant = attributeVariant;
       this.order = order;
       this.product = product;
       this.qty = qty;
       this.unitprice = unitprice;
       this.discount = discount;
       this.totaldiscount = totaldiscount;
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
    @JoinColumn(name="attribute_variant_id")
    public AttributeVariant getAttributeVariant() {
        return this.attributeVariant;
    }
    
    public void setAttributeVariant(AttributeVariant attributeVariant) {
        this.attributeVariant = attributeVariant;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="order_id", nullable=false)
    public Order getOrder() {
        return this.order;
    }
    
    public void setOrder(Order order) {
        this.order = order;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="product_id", nullable=false)
    public Product getProduct() {
        return this.product;
    }
    
    public void setProduct(Product product) {
        this.product = product;
    }

    
    @Column(name="qty", precision=22, scale=0)
    public Double getQty() {
        return this.qty;
    }
    
    public void setQty(Double qty) {
        this.qty = qty;
    }

    
    @Column(name="unitprice", precision=22, scale=0)
    public Double getUnitprice() {
        return this.unitprice;
    }
    
    public void setUnitprice(Double unitprice) {
        this.unitprice = unitprice;
    }

    
    @Column(name="discount", precision=22, scale=0)
    public Double getDiscount() {
        return this.discount;
    }
    
    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    
    @Column(name="totaldiscount", precision=22, scale=0)
    public Double getTotaldiscount() {
        return this.totaldiscount;
    }
    
    public void setTotaldiscount(Double totaldiscount) {
        this.totaldiscount = totaldiscount;
    }




}


