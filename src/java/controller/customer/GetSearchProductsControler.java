/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import dao.ProductDAO;
import dto.GalleryDTO;
import dto.ProductDTO;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Gallery;
import model.Product;
import org.json.JSONObject;

/**
 *
 * @author REDTECH
 */
@WebServlet(name = "GetSearchProductsControler", urlPatterns = {"/GetSearchProducts"})
public class GetSearchProductsControler extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String content = "";
        System.out.println(req.getParameter("brand"));
        System.out.println(req.getParameter("tag"));
        System.out.println(req.getParameter("category"));
        List<ProductDTO> productDTOs = null;
        if (!req.getParameter("brand").equals("null")) {
             productDTOs = new ProductDAO().getByBrand(req.getParameter("brand"));
        }
        if(!req.getParameter("tag").equals("null")){
            productDTOs = new ProductDAO().getByTag(req.getParameter("tag"));
        }
        if(!req.getParameter("category").equals("null")){
            productDTOs = new ProductDAO().getByCategory(req.getParameter("category"));
        }
        
        if(productDTOs == null){
            content = "<h3>Products Not Found</h3>";
        }else{
            for (ProductDTO product : productDTOs) {

                String href = "product_detail.jsp?id=" + product.getId();

                String imgPath = "";

                for (GalleryDTO gallery : product.getGalleries()) {
                    if (gallery.getThumbnail()) {
                        imgPath = gallery.getImgPath();
                        break;
                    }
                }

                content += "<div class='col-lg-3 col-md-4 col-sm-6' style='--bs-gutter-x: 1.5rem;--bs-gutter-y: 1.5rem;'><div class='product-m' style='border: 2px solid #e5e5e5;'><div class='product-m__thumb'><a class='aspect aspect--bg-grey aspect--square u-d-block'"
                        + " href='" + href + "'>"
                        + "<img class='aspect__img' style='padding: 10px' src='" + imgPath + "' alt=''></a>\n"
                        + " <div class=\"product-m__add-cart\">\n"
                        + "<a class='btn--e-brand' onclick=\"setDataToAddToCart('" + product.getId() + "', '" + product.getProductName() + "', '" + (product.getProductPrice() - product.getDiscountPrice()) + " ', '" + imgPath + "')\" data-modal='modal' data-modal-id='#add-to-cart'>Add to Cart</a></div>\n</div>"
                        + "<div class=\"product-m__content\">\n"
                        + "<div class=\"product-m__category\">\n"
                        + "<a href=\"shop-side-version-2.html\">" + product.getBrand().getCategory().getCategoryName() + "</a></div>\n"
                        + "<div class=\"product-m__name\">\n"
                        + "<a href='" + href + "'>" + product.getProductName() + "</a></div>\n"
                        + "<div class=\"product-m__price\">" + (product.getProductPrice() - product.getDiscountPrice()) + " LKR</div>\n"
                        + "<div class=\"product-m__hover\">\n"
                        + "<div class=\"product-m__preview-description\">\n"
                        + "<span>" + product.getShortDescription() + "</span></div>\n"
                        + "<div class=\"product-m__wishlist\">\n"
                        + "<a class=\"far fa-heart\" href=\"#\" data-tooltip=\"tooltip\" data-placement=\"top\" title=\"Add to Wishlist\"></a></div>\n"
                        + "</div></div></div></div>";
            }
        }
        
            Map<String, Object> data = new HashMap<>();

            data.put("content", content);

            JSONObject jsonObject = new JSONObject(data);

            resp.getWriter().print(jsonObject);
    }

}
