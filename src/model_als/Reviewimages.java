package model;
// Generated Dec 18, 2023 10:41:18 AM by Hibernate Tools 4.3.1


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
 * Reviewimages generated by hbm2java
 */
@Entity
@Table(name="reviewimages"
    ,catalog="j2e_ecom_db"
)
public class Reviewimages  implements java.io.Serializable {


     private Integer id;
     private Reviews reviews;
     private String imageUrl;

    public Reviewimages() {
    }

	
    public Reviewimages(Reviews reviews) {
        this.reviews = reviews;
    }
    public Reviewimages(Reviews reviews, String imageUrl) {
       this.reviews = reviews;
       this.imageUrl = imageUrl;
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
    @JoinColumn(name="reviews_id", nullable=false)
    public Reviews getReviews() {
        return this.reviews;
    }
    
    public void setReviews(Reviews reviews) {
        this.reviews = reviews;
    }

    
    @Column(name="image_url")
    public String getImageUrl() {
        return this.imageUrl;
    }
    
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }




}


