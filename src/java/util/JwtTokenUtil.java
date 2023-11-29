/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import dto.TokenDetailsDTO;
import io.fusionauth.jwt.Signer;
import io.fusionauth.jwt.Verifier;
import io.fusionauth.jwt.domain.JWT;
import io.fusionauth.jwt.hmac.HMACSigner;
import io.fusionauth.jwt.hmac.HMACVerifier;

import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author pasin
 */
public class JwtTokenUtil {

    private static final String CLAIM_KEY_USERNAME = "sub";
    private static final String CLAIM_KEY_CREATED = "created";
    private static final String ISSUER = "www.greentech.lk";
    private static final String SECRET = "La_Qt=Vd%fZ=;e[0F+cVktxdwRK&Q6!%rj#_mJ;vJJu&JY)*]yX%%@yr-60!kFdL";
    private static final Long TOKEN_LIFE = 30L;
    private String generateToken(Map<String,String> claims ,Long expiration, String subject){
        Signer signer = HMACSigner.newSHA256Signer(SECRET);

// Build a new JWT with an issuer(iss), issued at(iat), subject(sub) and expiration(exp)
        JWT jwt = new JWT().setIssuer(ISSUER)
                .setIssuedAt(ZonedDateTime.now(ZoneOffset.UTC))
                .setSubject(subject)
                .setExpiration(ZonedDateTime.now(ZoneOffset.UTC).plusMinutes(expiration));

// Sign and encode the JWT to a JSON string representation
        claims.keySet().forEach(k ->{
            if(claims.get(k)!= null){
                jwt.addClaim(k,claims.get(k));
            }
        });

        return JWT.getEncoder().encode(jwt, signer);
    }
    private Map<String,String> getClaimsFromToken(String token){
        Verifier verifier = HMACVerifier.newVerifier(SECRET);

// Verify and decode the encoded string JWT to a rich object
        JWT jwt = JWT.getDecoder().decode(token, verifier);
        Map<String,String> claims = new HashMap<>();
        if(jwt != null){
            jwt.getAllClaims().forEach((k,v)->{
                claims.put(k,v.toString());
            });
        }
        return claims;
    }
    public String getUsernameFromToken(String token){
        Map<String,String> claims = getClaimsFromToken(token);
        return claims.get(CLAIM_KEY_USERNAME);
    }
    public boolean validateToken(String token, TokenDetailsDTO userDetails){
        if(isTokenExpired(token)){
            return false;
        }
        String username = getUsernameFromToken(token);
        return username.equals(userDetails.getEmail()) && !isTokenExpired(token);
    }

    public Date getExpireDateFromToken(String token){
        Verifier verifier = HMACVerifier.newVerifier(SECRET);
        // Verify and decode the encoded string JWT to a rich object
        JWT jwt = JWT.getDecoder().decode(token, verifier);
        return new Date(jwt.expiration.toInstant().toEpochMilli());
    }

    public boolean isTokenExpired(String token){
        Date expireDate = getExpireDateFromToken(token);
        return expireDate.before(new Date(System.currentTimeMillis()));
    }

    public String generateAccessToken(TokenDetailsDTO userDetails){
        Map<String,String> claims= new HashMap<>();
        claims.put(CLAIM_KEY_USERNAME,userDetails.getEmail());
        claims.put(CLAIM_KEY_CREATED,new Date().toString());

        return generateToken(claims,TOKEN_LIFE,userDetails.getEmail());
    }

    
}