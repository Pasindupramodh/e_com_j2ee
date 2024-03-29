/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author pasin
 */
@WebFilter(filterName = "AuthenticationFilter", urlPatterns = {"/admin/pages/*"})
public class AuthenticationFilter implements Filter {

    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;

    public AuthenticationFilter() {
    }

    @Override
    public void init(FilterConfig fc) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        
        System.out.println("Filter called");
        HttpServletRequest req = (HttpServletRequest) request;

        HttpSession session = req.getSession();
        if (session.getAttribute("user") == null) {
            System.out.println("No Users");
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            httpResponse.sendRedirect("../index.jsp");
        }else{
            chain.doFilter(request, response);
        }
        

    }

    @Override
    public void destroy() {
    }

}
