package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Utilisateur;

/**
 * Servlet implementation class ProfilServlet
 */
@WebServlet("/ProfilServlet")
public class ProfilServlet extends AbstractServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfilServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(true);
		String urlDB = props.getProperty("jdbc.url");
		String loginDB = props.getProperty("jdbc.login");
		String passwordDB = props.getProperty("jdbc.password");
			
		Utilisateur u = new Utilisateur(); 
		
		try(Connection connection = DriverManager.getConnection(urlDB, loginDB, passwordDB)){
			
			System.out.println("CONNECTED ! ");
			String strSQL = "SELECT * FROM utilisateur WHERE id=?";
			System.out.println(strSQL);
			try(PreparedStatement statement =connection.prepareStatement(strSQL)){
				
				statement.setInt(1, (int)session.getAttribute("idUtilisateur"));
				System.out.println(statement);
				try(ResultSet resultSET = statement.executeQuery()){
					while(resultSET.next()) {
						u.setId(resultSET.getInt(1));
						u.setNom(resultSET.getString(2));
						u.setPrenom(resultSET.getString(3));
						u.setDateNaissance(resultSET.getDate(4));
						u.setMail(resultSET.getString(5));
						u.setMdp(resultSET.getString(6));
						u.setAddresse(resultSET.getString(7));
						u.setCodePostal(resultSET.getString(8));
						u.setVille(resultSET.getString(9));
						u.setTelephone(resultSET.getString(10));
						u.setPhoto(resultSET.getBlob(11));
						request.setAttribute( "utilisateur", u);
						System.out.println(u.getCodePostal());
						request.getRequestDispatcher("profil.jsp").forward(request, response);
					}
					
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
