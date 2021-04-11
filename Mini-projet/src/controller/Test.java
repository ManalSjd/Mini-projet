package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import model.ConnectionDao;

@WebServlet("/Test")
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Test() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom=request.getParameter("name");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		String adresse=request.getParameter("adresse");
		
		User us=new User();
		us.setName(nom);
		us.setPassword(password);
		us.setEmail(email);
		us.setAdresse(adresse);
		
		ConnectionDao c=new ConnectionDao();
		
		String val=c.ajouter(us);
		if (val.equals("success")) {
			request.setAttribute("userName", val);
			request.getRequestDispatcher("/login-success.jsp").forward(request, response);
			
			
		}else {
			request.setAttribute("messageerror", val);
			request.getRequestDispatcher("/login-error.jsp").forward(request, response);
		}
		
	}

}
