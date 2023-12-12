/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.HibernateUtil;
import dto.CartDTO;
import dto.CartItemDTO;
import dto.CusLoginDTO;
import dto.ProductDTO;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.CartItem;
import model.Customer;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author REDTECH
 */
public class CartDAO {

    public String addToSessionCart(HttpSession httpSession, int id) {
        try {
            //Get current date of Sri Lanka
            Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Colombo"));
            Date currentDate = calendar.getTime();

            CartDTO cartDTO = new CartDTO();
            List<CartItemDTO> cartItemDTOs = new ArrayList<>();

            if (httpSession.getAttribute("cart") != null) {
                cartDTO = (CartDTO) httpSession.getAttribute("cart");
                cartItemDTOs = cartDTO.getCartItemDTOs();
            }
            ProductDTO productDTO = new ProductDAO().getById(id);
            if (productDTO != null) {
                if (cartItemDTOs.isEmpty()) {
                    CartItemDTO cartItemDTO = new CartItemDTO();
                    cartItemDTO.setId(1);
                    cartItemDTO.setProductDTO(productDTO);
                    cartItemDTO.setQty(1.0);
                    cartItemDTO.setTotal(productDTO.getProductPrice());
                    cartItemDTO.setUnitprice(productDTO.getProductPrice());
                    cartItemDTO.setDiscount(productDTO.getDiscountPrice());

                    cartItemDTOs.add(cartItemDTO);
                    cartDTO.setCartItemDTOs(cartItemDTOs);
                    cartDTO.setCreatedAt(currentDate);
                    cartDTO.setUpdatedAt(currentDate);
                    cartDTO.setDiscount(productDTO.getDiscountPrice());
                    cartDTO.setTotal(productDTO.getProductPrice());
                } else {
                    Boolean isExsists = false;
                    for (CartItemDTO cartItemDTO : cartItemDTOs) {
                        if (cartItemDTO.getProductDTO().getId() == id) {
                            isExsists = true;
                            return "Item Already Exists";
                        } else {
                            isExsists = false;
                        }
                    }
                    if (!isExsists) {
                        CartItemDTO cartItemDTO = new CartItemDTO();
                        cartItemDTO.setId(cartItemDTOs.size() + 1);
                        cartItemDTO.setProductDTO(productDTO);
                        cartItemDTO.setQty(1.0);
                        cartItemDTO.setTotal(productDTO.getProductPrice());
                        cartItemDTO.setUnitprice(productDTO.getProductPrice());
                        cartItemDTO.setDiscount(productDTO.getDiscountPrice());

                        cartItemDTOs.add(cartItemDTO);
                        cartDTO.setCartItemDTOs(cartItemDTOs);
                        cartDTO.setCreatedAt(currentDate);
                        cartDTO.setUpdatedAt(currentDate);
                        cartDTO.setDiscount(cartDTO.getDiscount() + productDTO.getDiscountPrice());
                        cartDTO.setTotal(cartDTO.getTotal() + productDTO.getProductPrice());
                    }
                }
                httpSession.setAttribute("cart", cartDTO);
            } else {
                return "Product Not Found";
            }

            return "Success";
        } catch (Exception e) {
            return "something went wrong";
        }
    }

    public CartDTO getCart(HttpSession httpSession) {
        if (httpSession.getAttribute("customer") == null) {
            if (httpSession.getAttribute("cart") != null) {
                return (CartDTO) httpSession.getAttribute("cart");
            } else {
                return null;
            }
        } else {
            Session session = HibernateUtil.getSessionFactory().openSession();
            try {
                CusLoginDTO cusLoginDTO = (CusLoginDTO) httpSession.getAttribute("customer");

                CustomerDAO customerDAO = new CustomerDAO();
                Customer customer = customerDAO.getByEmail(cusLoginDTO.getEmail());
                Cart cart = (Cart) session.createCriteria(Cart.class)
                        .add(Restrictions.eq("customer", customer)).uniqueResult();
                if (cart != null) {
                    CartDTO cartDTO = new CartDTO();

                    cartDTO.setCreatedAt(cart.getCreatedAt());
                    cartDTO.setDiscount(cart.getDiscount());
                    cartDTO.setTotal(cart.getTotal());
                    cartDTO.setUpdatedAt(cart.getUpdatedAt());

                    List<CartItemDTO> cartItemDTOs = new ArrayList<>();
                    if (!cart.getCartItems().isEmpty()) {
                        for (CartItem cartItem : cart.getCartItems()) {
                            CartItemDTO cartItemDTO = new CartItemDTO();
                            cartItemDTO.setDiscount(cartItem.getDiscount());
                            cartItemDTO.setId(cartItem.getId());
                            cartItemDTO.setProductDTO(new ProductDAO().getById(cartItem.getProduct().getId()));
                            cartItemDTO.setQty(cartItem.getQty());
                            cartItemDTO.setTotal(cartItem.getTotal());
                            cartItemDTO.setUnitprice(cartItem.getUnitprice());
                            cartItemDTO.setVariantId(0);
                            cartItemDTOs.add(cartItemDTO);
                        }
                    }
                    return cartDTO;
                } else {
                    return null;
                }

            } catch (Exception e) {
                return null;
            } finally {
                session.close();
            }
        }
    }

    public String deleteFromSessionCart(HttpSession httpSession, int id) {
        if (httpSession.getAttribute("cart") != null) {
            CartDTO cartDTO = (CartDTO) httpSession.getAttribute("cart");

            if (cartDTO.getCartItemDTOs().isEmpty()) {
                return "No items in cart";
            } else {
                for (int i = 0; i < cartDTO.getCartItemDTOs().size(); i++) {
                    CartItemDTO cartItemDTO = cartDTO.getCartItemDTOs().get(i);
                    if (cartItemDTO.getId() == id) {
                        
                        //Get current date of Sri Lanka
                        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Colombo"));
                        Date currentDate = calendar.getTime();
                        
                        cartDTO.setDiscount(cartDTO.getDiscount() - cartItemDTO.getDiscount());
                        cartDTO.setTotal(cartDTO.getTotal() - cartItemDTO.getTotal());
                        cartDTO.setUpdatedAt(currentDate);
                        cartDTO.getCartItemDTOs().remove(i);
                        
                        httpSession.setAttribute("cart", cartDTO);
                        
                        return "Success";
                    }
                }
                return "Item not found";
            }

        } else {
            return "Cart not found";
        }
    }

}
