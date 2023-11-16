package model;
// Generated Nov 15, 2023 12:07:55 AM by Hibernate Tools 4.3.1


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
 * Order generated by hbm2java
 */
@Entity
@Table(name="order"
    ,catalog="j2e_ecom_db"
)
public class Order  implements java.io.Serializable {


     private Integer id;
     private Customer customer;
     private String qty;
     private Double total;
     private Date orderDeliveredCarrierDate;
     private Date orderDeliveredCustomerDate;
     private String createdAt;
     private int attributeVariantId;
     private Set<OrderStatus> orderStatuses = new HashSet<OrderStatus>(0);

    public Order() {
    }

	
    public Order(Customer customer, int attributeVariantId) {
        this.customer = customer;
        this.attributeVariantId = attributeVariantId;
    }
    public Order(Customer customer, String qty, Double total, Date orderDeliveredCarrierDate, Date orderDeliveredCustomerDate, String createdAt, int attributeVariantId, Set<OrderStatus> orderStatuses) {
       this.customer = customer;
       this.qty = qty;
       this.total = total;
       this.orderDeliveredCarrierDate = orderDeliveredCarrierDate;
       this.orderDeliveredCustomerDate = orderDeliveredCustomerDate;
       this.createdAt = createdAt;
       this.attributeVariantId = attributeVariantId;
       this.orderStatuses = orderStatuses;
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
    @JoinColumn(name="customer_id", nullable=false)
    public Customer getCustomer() {
        return this.customer;
    }
    
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    
    @Column(name="qty", length=45)
    public String getQty() {
        return this.qty;
    }
    
    public void setQty(String qty) {
        this.qty = qty;
    }

    
    @Column(name="total", precision=22, scale=0)
    public Double getTotal() {
        return this.total;
    }
    
    public void setTotal(Double total) {
        this.total = total;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="order_delivered_carrier_date", length=19)
    public Date getOrderDeliveredCarrierDate() {
        return this.orderDeliveredCarrierDate;
    }
    
    public void setOrderDeliveredCarrierDate(Date orderDeliveredCarrierDate) {
        this.orderDeliveredCarrierDate = orderDeliveredCarrierDate;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="order_delivered_customer_date", length=19)
    public Date getOrderDeliveredCustomerDate() {
        return this.orderDeliveredCustomerDate;
    }
    
    public void setOrderDeliveredCustomerDate(Date orderDeliveredCustomerDate) {
        this.orderDeliveredCustomerDate = orderDeliveredCustomerDate;
    }

    
    @Column(name="created_at", length=45)
    public String getCreatedAt() {
        return this.createdAt;
    }
    
    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    
    @Column(name="attribute_variant_id", nullable=false)
    public int getAttributeVariantId() {
        return this.attributeVariantId;
    }
    
    public void setAttributeVariantId(int attributeVariantId) {
        this.attributeVariantId = attributeVariantId;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="order")
    public Set<OrderStatus> getOrderStatuses() {
        return this.orderStatuses;
    }
    
    public void setOrderStatuses(Set<OrderStatus> orderStatuses) {
        this.orderStatuses = orderStatuses;
    }




}


