package model;
// Generated Nov 25, 2023 12:13:46 AM by Hibernate Tools 4.3.1


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
 * Tag generated by hbm2java
 */
@Entity
@Table(name="tag"
    ,catalog="j2e_ecom_db"
)
public class Tag  implements java.io.Serializable {


     private Integer id;
     private Product product;
     private String tagName;

    public Tag() {
    }

	
    public Tag(Product product) {
        this.product = product;
    }
    public Tag(Product product, String tagName) {
       this.product = product;
       this.tagName = tagName;
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
    @JoinColumn(name="product_id", nullable=false)
    public Product getProduct() {
        return this.product;
    }
    
    public void setProduct(Product product) {
        this.product = product;
    }

    
    @Column(name="tag_name", length=45)
    public String getTagName() {
        return this.tagName;
    }
    
    public void setTagName(String tagName) {
        this.tagName = tagName;
    }




}


