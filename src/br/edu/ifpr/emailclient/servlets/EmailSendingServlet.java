package br.edu.ifpr.emailclient.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifpr.emailclient.utils.EmailUtility;

@WebServlet("/EmailSendingServlet")
public class EmailSendingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String host = "smtp.gmail.com";
		String port = (String) request.getSession().getAttribute("port");
		String email = (String) request.getSession().getAttribute("email");
		String password = (String) request.getSession().getAttribute("password");
		
		String recipient = request.getParameter("recipient");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		response.setCharacterEncoding("UTF-8");

		try {
			EmailUtility.sendEmail(host, port, email, password, recipient, subject, content);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			PrintWriter out = response.getWriter();
			out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>\r\n" + 
					"	$(document).ready(function() {\r\n" + 
					"		swal('Mensagem Enviada!', 'Agora é só relaxar!', 'success');\r\n" + 
					"	});\r\n" + 
					"	\r\n" + 
					"</script>");

			getServletContext().getRequestDispatcher("/").include(request, response);
		}
	}
}