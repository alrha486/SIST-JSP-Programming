import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/ForwardDemo")
public class ForwardDemoServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		//RequestDispatcher rd = req.getRequestDispatcher("/pagecontextdemo.jsp");
		ServletContext context = req.getServletContext();
		RequestDispatcher rd = context.getRequestDispatcher("/pagecontextdemo.jsp");
		rd.forward(req, res);
	}

}
