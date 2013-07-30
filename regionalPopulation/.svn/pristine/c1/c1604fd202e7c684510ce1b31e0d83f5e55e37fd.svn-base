package kxcom.hd.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kxcom.hd.common.PersonService;

/**
 * Servlet implementation class CategoryServlet
 */
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jing=request.getParameter("jing");
		String wei=request.getParameter("wei");
		String distince=request.getParameter("distince");
		
		double jingdu=Double.parseDouble(jing);
		double weidu=Double.parseDouble(wei);
		int my_distince=Integer.parseInt(distince);
		
		
		try {
			String str=PersonService.CategoryNum(jingdu, weidu, my_distince);
			response.getWriter().print(str);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}


}
