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

/**
 * Servlet implementation class InscriptionServlet
 */
@WebServlet("/InscriptionServlet")
public class InscriptionServlet extends AbstractServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InscriptionServlet() {
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
		String nom = request.getParameter("inputNom");
		String prenom = request.getParameter("inputPrenom");
		System.out.println(prenom);
		String dateNaissance = request.getParameter("inputDateNaissance");
		String mail = request.getParameter("inputEmail");
		String mdp = request.getParameter("inputMdp");
		String addresse = request.getParameter("inputAdresse");
		String codePostal = request.getParameter("inputCodePostal");
		String ville = request.getParameter("inputVille");
		String telephone = request.getParameter("inputTelephone");
		
		
		String urlDB = props.getProperty("jdbc.url");
		String loginDB = props.getProperty("jdbc.login");
		String passwordDB = props.getProperty("jdbc.password");
		try(Connection connection = DriverManager.getConnection(urlDB, loginDB, passwordDB)){
			
			System.out.println("CONNECTED ! ");
			
			String strSQL1 = "SELECT * FROM utilisateur WHERE mail=?";
			try(PreparedStatement statement =connection.prepareStatement(strSQL1)){
				try {
					statement.setString(1, mail);
					System.out.println(strSQL1);
				} catch (SQLException e2) {
					e2.printStackTrace();
					
				}
				try(ResultSet resultSET = statement.executeQuery()){
					if(resultSET.next()) {//le mail existe déjà
						request.setAttribute("errorDoublon","L'email que vous avez tapé est déjà utilisé.");
						request.getRequestDispatcher("inscription.jsp").forward(request, response);
					}else {
						String strSQLInsert = "insert into utilisateur(nom, prenom, dateNaissance, mail, mdp, addresse, codePostal, ville, telephone) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
						
						try(PreparedStatement statement2=connection.prepareStatement(strSQLInsert)){
							try {
								statement2.setString(1, nom);
								statement2.setString(2, prenom);
								statement2.setString(3, dateNaissance);
								statement2.setString(4, mail);
								statement2.setString(5, mdp);
								statement2.setString(6, addresse);
								statement2.setString(7, codePostal);
								statement2.setString(8, ville);
								statement2.setString(9, telephone);
								System.out.println(statement2);
								statement2.executeQuery();
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}catch (SQLException e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}
						request.setAttribute("inscriptionReussie","Vous vous êtes bien inscrit ! Vous pouvez maintenant vous connecter.");
						request.getRequestDispatcher("index.jsp").forward(request, response);
						
					}
				} catch (SQLException e2) {
					// TODO Auto-generated catch block
					e2.printStackTrace();
				}
			} catch (SQLException e3) {
				// TODO Auto-generated catch block
				e3.printStackTrace();
			}
		} catch (SQLException e4) {
			// TODO Auto-generated catch block
			e4.printStackTrace();
		}
	}
}
