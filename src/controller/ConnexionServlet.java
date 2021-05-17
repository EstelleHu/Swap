package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

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
		String loginID = request.getParameter("inputEmail");
		String passwordID = request.getParameter("inputMdp");
		HttpSession session = request.getSession(true);
		session.setAttribute("loginID", loginID);
		session.setAttribute("passwordID", passwordID);

		String urlDB = props.getProperty("jdbc.url");
		String loginDB = props.getProperty("jdbc.login");
		String passwordDB = props.getProperty("jdbc.password");
		try(Connection connection = DriverManager.getConnection(urlDB, loginDB, passwordDB)){
			
			System.out.println("CONNECTED ! ");
			String strSQL = "select * from utilisateur where mail=? and mdp =?";
			System.out.println(strSQL);
			try(PreparedStatement statement =connection.prepareStatement(strSQL)){
				statement.setString(1, loginID);
				statement.setString(2, passwordID);
				System.out.println(statement);
				try(ResultSet resultSET = statement.executeQuery()){
					if(resultSET.next()) {
						session.setAttribute("idUtilisateur", resultSET.getInt(1));
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
