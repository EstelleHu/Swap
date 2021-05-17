package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ConnexionServlet
 */
@WebServlet("/ConnexionServlet")
public class ConnexionServlet extends AbstractServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<Product> myProducts = new ArrayList<>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConnexionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		myProducts.clear();
		
		String loginID = request.getParameter("inputEmail");
		String passwordID = request.getParameter("inputMdp");
		HttpSession session = request.getSession(true);
		session.setAttribute("loginID", loginID);
		session.setAttribute("passwordID", passwordID);
		session.setAttribute("products", myProducts);

		String urlDB = props.getProperty("jdbc.url");
		String loginDB = props.getProperty("jdbc.login");
		String passwordDB = props.getProperty("jdbc.password");
		try(Connection connection = DriverManager.getConnection(urlDB, loginDB, passwordDB)){
			String strSQL = "select * from objet";
			PreparedStatement statement = connection.prepareStatement(strSQL);
			ResultSet result = statement.executeQuery();
			while(result.next()) {
				myProducts.add(new Product(result.getInt(2), result.getString(3), result.getDouble(4), result.getString(5), result.getString(6), result.getString(7), result.getString(8), result.getString(9), result.getBoolean(10)));
			}
			for(Product p : myProducts) {
				System.out.println(p.toString());
			}
			System.out.println("CONNECTED ! ");
			strSQL = "select * from utilisateur where mail=? and mdp =?";
			System.out.println(strSQL);
			try(PreparedStatement statement1 =connection.prepareStatement(strSQL)){
				statement1.setString(1, loginID);
				statement1.setString(2, passwordID);
				System.out.println(statement1);
				try(ResultSet resultSET = statement1.executeQuery()){
					if(resultSET.next()) {
						session.setAttribute("isConnected", true);
						
						request.getRequestDispatcher("accueil.jsp").forward(request, response);
					}else {
						session.setAttribute("isConnected", false);
						request.setAttribute("error","Identifiants invalides.");
						request.getRequestDispatcher("index.jsp").forward(request, response);
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
