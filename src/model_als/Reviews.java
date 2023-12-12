package model;
// Generated Nov 22, 2023 10:15:03 PM by Hibernate Tools 4.3.1


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

/**
 * Reviews generated by hbm2java
 */
@Entity
@Table(name="reviews"
    ,catalog="j2e_ecom_db"
)
public class Reviews  implements java.io.Serializable {


     private Integer id;
     private Customer customer;
     private Product product;
     private Integer starCount;
     private String review;
     private Boolean isAnonymous;
     private Set<Reviewimages> reviewimageses = new HashSet<Reviewimages>(0);

    public Reviews() {
    }

	
    public Reviews(Customer customer, Product product) {
        this.customer = customer;
        this.product = product;
    }
    public Reviews(Customer customer, Product product, Integer starCount, String review, Boolean isAnonymous, Set<Reviewimages> reviewimageses) {
       this.customer = customer;
       this.product = product;
       this.starCount = starCount;
       this.review = review;
       this.isAnonymous = isAnonymous;
       this.reviewimageses = reviewimageses;
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
    @JoinColumn(name="customer", nullable=false)
    public Customer getCustomer() {
        return this.customer;
    }
    
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="product_id", nullable=false)
    public Product getProduct() {
        return this.product;
    }
    
    public void setProduct(Product product) {
        this.product = product;
    }

    
    @Column(name="star_count")
    public Integer getStarCount() {
        return this.starCount;
    }
    
    public void setStarCount(Integer starCount) {
        this.starCount = starCount;
    }

    
    @Column(name="review", length=450)
    public String getReview() {
        return this.review;
    }
    
    public void setReview(String review) {
        this.review = review;
    }

    
    @Column(name="is_anonymous")
    public Boolean getIsAnonymous() {
        return this.isAnonymous;
    }
    
    public void setIsAnonymous(Boolean isAnonymous) {
        this.isAnonymous = isAnonymous;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="reviews")
    public Set<Reviewimages> getReviewimageses() {
        return this.reviewimageses;
    }
    
    public void setReviewimageses(Set<Reviewimages> reviewimageses) {
        this.reviewimageses = reviewimageses;
    }




}

