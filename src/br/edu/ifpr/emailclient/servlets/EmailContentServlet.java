package br.edu.ifpr.emailclient.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifpr.emailclient.utils.ReceiverUtility;

@WebServlet("/EmailContentServlet")
public class EmailContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Message[] messages = (Message[]) request.getSession().getAttribute("messages");
		PrintWriter out = response.getWriter();
		
		String[] query = request.getParameterMap().get("id");
		
		int index = Integer.parseInt(query[0]);
		
		ReceiverUtility receiver = new ReceiverUtility();
		try {
			out.println("<div class=\"modal fade\" id=\"contentModal\" tabindex=\"-1\"  \n" + 
					"						role=\"dialog\" aria-labelledby=\"exampleModal\" aria-hidden=\"true\">  \n" + 
					"						<div class=\"modal-dialog\" role=\"document\">  \n" + 
					"							<div class=\"modal-content\">  \n" + 
					"								<div class=\"modal-header\">  \n" + 
					"									<div class=\"row\">  \n" + 
					"										<div class=\"col-md-4\">  \n" + 
					"											<h5>E-mail:</h5>  \n" + 
					"										</div>  \n" + 
					"										<div class=\"col-md-8\">  \n" + 
					"											<button type=\"button\" class=\"close\" data-dismiss=\"modal\"  \n" + 
					"												aria-label=\"Close\">  \n" + 
					"												<span aria-hidden=\"true\">&times;</span>  \n" + 
					"											</button>  \n" + 
					"										</div>  \n" + 
					"									</div>  \n" + 
					"								</div>  \n" + 
					"								<div class=\"modal-body\">	");
			
			if (!messages[index].isMimeType("text/*")) {
				Multipart mp = (Multipart) messages[index].getContent();
				for (int j=0; j< mp.getCount(); j++) {
					Part part = mp.getBodyPart(j);
					if (receiver.getText(part) != null) {
						out.println(receiver.getText(part));
					}
				}
			} else {
				out.println(messages[index].getContent());
			}
			out.println("</div>\n" + 
					"								\n" + 
					"								<div class=\"modal-footer\">  \n" + 
					"									<button type=\"button\" class=\"btn btn-secondary\"  \n" + 
					"										data-dismiss=\"modal\">Voltar</button>  \n" + 
					"								</div>  \n" + 
					"							</div>  \n" + 
					"						</div>  \n" + 
					"					</div>			");
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		response.getWriter().append(request.getContextPath());
	}
}
