package model;
// Generated Dec 18, 2023 10:41:18 AM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * OrderHasOrderStatusId generated by hbm2java
 */
@Embeddable
public class OrderHasOrderStatusId  implements java.io.Serializable {


     private String orderId;
     private int orderStatusId;

    public OrderHasOrderStatusId() {
    }

    public OrderHasOrderStatusId(String orderId, int orderStatusId) {
       this.orderId = orderId;
       this.orderStatusId = orderStatusId;
    }
   


    @Column(name="order_id", nullable=false, length=150)
    public String getOrderId() {
        return this.orderId;
    }
    
    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }


    @Column(name="order_status_id", nullable=false)
    public int getOrderStatusId() {
        return this.orderStatusId;
    }
    
    public void setOrderStatusId(int orderStatusId) {
        this.orderStatusId = orderStatusId;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof OrderHasOrderStatusId) ) return false;
		 OrderHasOrderStatusId castOther = ( OrderHasOrderStatusId ) other; 
         
		 return ( (this.getOrderId()==castOther.getOrderId()) || ( this.getOrderId()!=null && castOther.getOrderId()!=null && this.getOrderId().equals(castOther.getOrderId()) ) )
 && (this.getOrderStatusId()==castOther.getOrderStatusId());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getOrderId() == null ? 0 : this.getOrderId().hashCode() );
         result = 37 * result + this.getOrderStatusId();
         return result;
   }   


}


