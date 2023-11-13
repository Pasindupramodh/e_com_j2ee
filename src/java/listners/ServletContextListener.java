/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package listners;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;

/**
 * Web application lifecycle listener.
 *
 * @author pasin
 */
public class ServletContextListener implements javax.servlet.ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        context.setAttribute("BASE_URL", context.getContextPath() + "/");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }
}
