package provider;

import jakarta.mail.Authenticator;
import jakarta.mail.PasswordAuthentication;
import java.util.Properties;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import mail.Mailable;



public class MailServiceProvider {
    private ThreadPoolExecutor executor;
    private final Properties properties = new Properties();
    private Authenticator authenticator;
    private static MailServiceProvider mailServiceProvider;
    private BlockingQueue<Runnable> blockingQueue = new LinkedBlockingQueue<>();

    private MailServiceProvider(){
        properties.put("mail.smtp.auth","true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "sandbox.smtp.mailtrap.io");
        properties.put("mail.smtp.port", "2525");
    }

    public static MailServiceProvider getInstance(){
        if(mailServiceProvider == null){
            mailServiceProvider = new MailServiceProvider();
        }
        return mailServiceProvider;
    }

    public void start(){
        authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("9e4788c1f744dd","dd34fe606cc968");
            }
        };

        executor = new ThreadPoolExecutor(2,5,5, TimeUnit.SECONDS, blockingQueue, new ThreadPoolExecutor.AbortPolicy());
        executor.prestartAllCoreThreads();
        System.out.println("MailServiceProvider : Running...");
    }

    public void sendMail(Mailable mailable){
        blockingQueue.offer(mailable);
    }

    public Properties getProperties(){
        return properties;
    }

    public Authenticator getAuthenticator(){
        return authenticator;
    }

    public void shutdown(){
        if(executor != null){
            executor.shutdown();
        }
    }

}
