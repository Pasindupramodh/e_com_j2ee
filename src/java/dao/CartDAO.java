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
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.TimeZone;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.CartItem;
import model.Customer;
import model.Product;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
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
                    cartItemDTO.setUnitDiscount(productDTO.getDiscountPrice());

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
                        cartItemDTO.setUnitDiscount(productDTO.getDiscountPrice());

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
                CartDTO cartDTO = (CartDTO) httpSession.getAttribute("cart");
                return (cartDTO.getCartItemDTOs() == null || cartDTO.getCartItemDTOs().isEmpty()) ? null : cartDTO;
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

                    cartDTO.setId(cart.getId());
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
                        cartDTO.setCartItemDTOs(cartItemDTOs);

                    } else {
                        return null;
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

    public void saveCartDataToDB(HttpSession httpSession) {
        if (httpSession.getAttribute("customer") != null && httpSession.getAttribute("cart") != null) {

            Session session = HibernateUtil.getSessionFactory().openSession();
            try {
                Transaction transaction = session.beginTransaction();

                CusLoginDTO cusLoginDTO = (CusLoginDTO) httpSession.getAttribute("customer");
                Customer customer = new CustomerDAO().getByEmail(cusLoginDTO.getEmail());

                //Get current date of Sri Lanka
                Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Colombo"));
                Date currentDate = calendar.getTime();

                Cart cart = new Cart();
                Set<CartItem> cartItems = new HashSet<>();
                double discount = 0.0;
                double total = 0.0;
                if (!customer.getCarts().isEmpty()) {
                    System.out.println("cart found");
                    cart = (Cart) customer.getCarts().toArray()[0];
                    cartItems = cart.getCartItems();
                    discount = cart.getDiscount();
                    total = cart.getTotal();
                } else {
                    cart.setCreatedAt(currentDate);
                    cart.setUpdatedAt(currentDate);
                    cart.setCustomer(customer);
                    session.persist(cart);
                }

                boolean needToAdd = true;

                CartDTO cartDTO = (CartDTO) httpSession.getAttribute("cart");

                if (cartDTO.getCartItemDTOs() != null && !cartDTO.getCartItemDTOs().isEmpty()) {
                    for (CartItemDTO cartItemDTO : cartDTO.getCartItemDTOs()) {
                        if (!cart.getCartItems().isEmpty()) {
                            for (CartItem cartItem : cart.getCartItems()) {
                                if (Objects.equals(cartItem.getProduct().getId(), cartItemDTO.getProductDTO().getId())) {
                                    needToAdd = false;
                                    break;
                                } else {
                                    needToAdd = true;
                                }
                            }
                        }
                        if (needToAdd) {
                            CartItem cartItem = new CartItem();
                            cartItem.setCart(cart);
                            cartItem.setDiscount(cartItemDTO.getDiscount());
                            cartItem.setProduct(new ProductDAO().getById(String.valueOf(cartItemDTO.getProductDTO().getId())));
                            cartItem.setQty(cartItemDTO.getQty());
                            cartItem.setTotal(cartItemDTO.getTotal());
                            cartItem.setUnitDiscount(cartItemDTO.getUnitDiscount());
                            cartItem.setUnitprice(cartItemDTO.getUnitprice());
                            discount += cartItemDTO.getDiscount();
                            total += cartItemDTO.getTotal();
                            session.persist(cartItem);
                            cart.setDiscount(discount);
                            cart.setTotal(total);

                            session.merge(cart);
                        }
                    }
                    if (needToAdd) {

                    }
                }
                transaction.commit();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                session.close();
            }

        }
    }

    public Map updateSessionCart(HttpSession httpSession, int id, int qty) {
        Map<String, Object> map = new HashMap<>();
        if (httpSession.getAttribute("cart") != null) {

            CartDTO cartDTO = (CartDTO) httpSession.getAttribute("cart");

            for (int i = 0; i < cartDTO.getCartItemDTOs().size(); i++) {
                CartItemDTO cartItemDTO = cartDTO.getCartItemDTOs().get(i);
                if (cartItemDTO.getId() == id) {

                    //Get current date of Sri Lanka
                    Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Colombo"));
                    Date currentDate = calendar.getTime();

                    cartDTO.setTotal((cartDTO.getTotal() - cartItemDTO.getTotal()) + (cartItemDTO.getUnitprice() * qty));
                    cartDTO.setDiscount((cartDTO.getDiscount() - cartItemDTO.getDiscount()) + (cartItemDTO.getUnitDiscount() * qty));

                    cartItemDTO.setTotal(cartItemDTO.getUnitprice() * qty);
                    cartItemDTO.setDiscount(cartItemDTO.getUnitDiscount() * qty);
                    cartItemDTO.setQty(Double.valueOf(qty));

                    map.put("Message", "Success");
                    map.put("data", cartDTO);
                    return map;
                }
            }
            map.put("Message", "Item not found");
            return map;
        } else {
            map.put("Message", "Cart is empty");
            return map;
        }
    }

    public Map<String, Object> updateCart(HttpSession httpSession, int id, int qty) {
        Map<String, Object> map = new HashMap<>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction transaction = session.beginTransaction();

            CusLoginDTO cusLoginDTO = (CusLoginDTO) httpSession.getAttribute("customer");

            Customer customer = new CustomerDAO().getByEmail(cusLoginDTO.getEmail());

            if (!customer.getCarts().isEmpty()) {
                Cart cart = (Cart) customer.getCarts().toArray()[0];
                for (CartItem cartItem : cart.getCartItems()) {
                    if (cartItem.getId() == id) {
                        //Get current date of Sri Lanka
                        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Colombo"));
                        Date currentDate = calendar.getTime();

                        cart.setTotal((cart.getTotal() - cartItem.getTotal()) + (cartItem.getUnitprice() * qty));
                        cart.setDiscount((cart.getDiscount() - cartItem.getDiscount()) + (cartItem.getUnitDiscount() * qty));

                        cartItem.setTotal(cartItem.getUnitprice() * qty);
                        cartItem.setDiscount(cartItem.getUnitDiscount() * qty);
                        cartItem.setQty(Double.valueOf(qty));

                        session.merge(cart);
                        session.merge(cartItem);

                        transaction.commit();

                        map.put("Message", "Success");
                        map.put("data", getCart(httpSession));

                        return map;
                    }
                }
            } else {
                map.put("Message", "Cart is empty");
            }
        } catch (Exception e) {
            map.put("Message", "Something went wrong");
        } finally {
            session.close();
        }

        return map;
    }

    public String deleteFromCart(HttpSession httpSession, int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction transaction = session.beginTransaction();
            CusLoginDTO cusLoginDTO = (CusLoginDTO) httpSession.getAttribute("customer");

            CartItem cartItem = (CartItem) session.createCriteria(CartItem.class).add(Restrictions.eq("id", id)).uniqueResult();

            if (cartItem != null && cartItem.getCart().getCustomer().getEmail().equals(cusLoginDTO.getEmail())) {

                //Get current date of Sri Lanka
                Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Colombo"));
                Date currentDate = calendar.getTime();

                Cart cart = cartItem.getCart();

                cart.setDiscount(cart.getDiscount() - cartItem.getDiscount());
                cart.setTotal(cart.getTotal() - cartItem.getTotal());
                cart.setUpdatedAt(currentDate);

                session.merge(cart);
                session.delete(cartItem);

                transaction.commit();
                return "Success";
            } else {
                return "Cart Not found";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "Something went wrong";
        } finally {
            System.out.println("asa");
            session.close();
        }
    }

    public String addToCart(HttpSession httpSession, int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction transaction = session.beginTransaction();
            
            //Get current date of Sri Lanka
            Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Colombo"));
            Date currentDate = calendar.getTime();

            CusLoginDTO cusLoginDTO = (CusLoginDTO) httpSession.getAttribute("customer");
            Customer customer = new CustomerDAO().getByEmail(cusLoginDTO.getEmail());

            Cart cart = new Cart();

            Product product = new ProductDAO().getById(String.valueOf(id));
            
            if (!customer.getCarts().isEmpty()) {
                cart = (Cart) customer.getCarts().toArray()[0];
                cart.setDiscount(cart.getDiscount() + product.getDiscountPrice());
                cart.setTotal(cart.getTotal()+product.getProductPrice());
                cart.setUpdatedAt(currentDate);
                
                session.merge(cart);
            } else {
                cart.setCreatedAt(currentDate);
                cart.setCustomer(customer);
                cart.setDiscount(product.getDiscountPrice());
                cart.setTotal(product.getProductPrice());
                
                session.persist(cart);
            }

            boolean needToAdd = false;

            if (cart.getCartItems().isEmpty()) {
                needToAdd = true;
            } else {
                for (CartItem cartItem : cart.getCartItems()) {
                    if (cartItem.getProduct().getId() == id) {
                        needToAdd = false;
                        return "Item Already in cart";
                    } else {
                        needToAdd = true;
                    }
                }
            }
            if (needToAdd) {
                CartItem cartItem = new CartItem();
                cartItem.setCart(cart);
                cartItem.setDiscount(product.getDiscountPrice());
                cartItem.setProduct(product);
                cartItem.setQty(1.0);
                cartItem.setTotal(product.getProductPrice());
                cartItem.setUnitDiscount(product.getDiscountPrice());
                cartItem.setUnitprice(product.getProductPrice());
                
                session.persist(cartItem);
                
            }
            transaction.commit();
            return "Success";
        } catch (Exception e) {
            return "Something went wrong";
        } finally {
            session.close();
        }

    }

}
