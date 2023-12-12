package model;
// Generated Nov 22, 2023 10:04:55 PM by Hibernate Tools 4.3.1


import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Login generated by hbm2java
 */
@Entity
@Table(name="login"
    ,catalog="j2e_ecom_db"
)
public class Login  implements java.io.Serializable {


     private Integer id;
     private String username;
     private String password;
     private String status;
     private Date createdAt;
     private Date updatedAt;
     private Set<SystemUser> systemUsers = new HashSet<SystemUser>(0);

    public Login() {
    }

    public Login(String username, String password, String status, Date createdAt, Date updatedAt, Set<SystemUser> systemUsers) {
       this.username = username;
       this.password = password;
       this.status = status;
       this.createdAt = createdAt;
       this.updatedAt = updatedAt;
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

    
    @Column(name="username", length=45)
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }

    
    @Column(name="password", length=345)
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    
    @Column(name="status", length=45)
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="created_at", length=19)
    public Date getCreatedAt() {
        return this.createdAt;
    }
    
    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="updated_at", length=19)
    public Date getUpdatedAt() {
        return this.updatedAt;
    }
    
    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="login")
    public Set<SystemUser> getSystemUsers() {
        return this.systemUsers;
    }
    
    public void setSystemUsers(Set<SystemUser> systemUsers) {
        this.systemUsers = systemUsers;
    }




}

