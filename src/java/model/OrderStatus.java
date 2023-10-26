package model;
// Generated Oct 25, 2023 3:16:17 PM by Hibernate Tools 4.3.1


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * OrderStatus generated by hbm2java
 */
@Entity
@Table(name="order_status"
    ,catalog="j2e_ecom_db"
)
public class OrderStatus  implements java.io.Serializable {


     private int id;
     private Order order;
     private SystemUser systemUser;
     private String status;
     private Date createdAt;

    public OrderStatus() {
    }

	
    public OrderStatus(int id, Order order) {
        this.id = id;
        this.order = order;
    }
    public OrderStatus(int id, Order order, SystemUser systemUser, String status, Date createdAt) {
       this.id = id;
       this.order = order;
       this.systemUser = systemUser;
       this.status = status;
       this.createdAt = createdAt;
    }
   
     @Id 

    
    @Column(name="id", unique=true, nullable=false)
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
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
    @JoinColumn(name="created_by")
    public SystemUser getSystemUser() {
        return this.systemUser;
    }
    
    public void setSystemUser(SystemUser systemUser) {
        this.systemUser = systemUser;
    }

    
    @Column(name="status", length=45)
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="created_at", length=10)
    public Date getCreatedAt() {
        return this.createdAt;
    }
    
    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }




}


