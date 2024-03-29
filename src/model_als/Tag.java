package model;
// Generated Dec 18, 2023 10:41:18 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
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
     private String tagName;
     private Set<Product> products = new HashSet<Product>(0);

    public Tag() {
    }

    public Tag(String tagName, Set<Product> products) {
       this.tagName = tagName;
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

    
    @Column(name="tag_name", length=45)
    public String getTagName() {
        return this.tagName;
    }
    
    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

@ManyToMany(fetch=FetchType.LAZY)
    @JoinTable(name="product_has_tag", catalog="j2e_ecom_db", joinColumns = { 
        @JoinColumn(name="tag_id", nullable=false, updatable=false) }, inverseJoinColumns = { 
        @JoinColumn(name="product_id", nullable=false, updatable=false) })
    public Set<Product> getProducts() {
        return this.products;
    }
    
    public void setProducts(Set<Product> products) {
        this.products = products;
    }




}


