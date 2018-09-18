package br.edu.ifpr.emailclient.servlets;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.URLName;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private Session session;
	private Store store;
	private Folder folder;

	// O protocolo e a pasta podem ser personalizados
	private String protocol = "imaps";
	private String file = "INBOX";
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String host = "imap.gmail.com";
		String port = "587";
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		request.getSession().setAttribute("host", host);
		request.getSession().setAttribute("port", port);
		request.getSession().setAttribute("email", email);
		request.getSession().setAttribute("password", password);

		try {
			login(host, email, password);
			response.sendRedirect("client/index.jsp");
			request.getSession().setAttribute("msgCount", getMessageCount());
			request.getSession().setAttribute("messages", getMessages());			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean isLoggedIn() {
		return store.isConnected();
	}

	public void login(String host, String username, String password) throws Exception {
		URLName url = new URLName(protocol, host, 993, file, username, password);

		if (session == null) {
			Properties props = null;
			try {
				props = System.getProperties();
			} catch (SecurityException sex) {
				props = new Properties();
			}
			session = Session.getInstance(props, null);
		}
		store = session.getStore(url);
		store.connect();
		folder = store.getFolder(url);

		folder.open(Folder.READ_WRITE);
	}

	public void logout() throws MessagingException {
		folder.close(false);
		store.close();
		store = null;
		session = null;
	}

	public int getMessageCount() {
		int messageCount = 0;
		try {
			messageCount = folder.getMessageCount();
		} catch (MessagingException me) {
			me.printStackTrace();
		}
		return messageCount;
	}

	public Message[] getMessages() throws MessagingException {
		return folder.getMessages();
	}

}
