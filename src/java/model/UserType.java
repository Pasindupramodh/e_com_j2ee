package model;
// Generated Nov 25, 2023 12:13:46 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * UserType generated by hbm2java
 */
@Entity
@Table(name="user_type"
    ,catalog="j2e_ecom_db"
)
public class UserType  implements java.io.Serializable {


     private Integer id;
     private String userType;
     private Set<SystemUser> systemUsers = new HashSet<SystemUser>(0);

    public UserType() {
    }

    public UserType(String userType, Set<SystemUser> systemUsers) {
       this.userType = userType;
       this.systemUsers = systemUsers;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="id", unique=true, nullable=false)
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    
    @Column(name="user_type", length=45)
    public String getUserType() {
        return this.userType;
    }
    
    public void setUserType(String userType) {
        this.userType = userType;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="userType")
    public Set<SystemUser> getSystemUsers() {
        return this.systemUsers;
    }
    
    public void setSystemUsers(Set<SystemUser> systemUsers) {
        this.systemUsers = systemUsers;
    }




}


