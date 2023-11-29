/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package listners;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import provider.MailServiceProvider;

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
        context.setAttribute("ADMIN_BASE_URL", context.getContextPath() + "/admin/api/");
        context.setAttribute("APP_NAME", "Green Tech");
        
        MailServiceProvider.getInstance().start();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }
}
