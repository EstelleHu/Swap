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

import beans.Product;
import beans.Utilisateur;

/**
 * Servlet implementation class ProfilServlet
 */
@WebServlet("/ProfilServlet")
public class ProfilServlet extends AbstractServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<Product> myProfilProducts = new ArrayList<>();   
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
		myProfilProducts.clear();
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
						u.setDateNaissance(resultSET.getString(4));
						u.setMail(resultSET.getString(5));
						u.setMdp(resultSET.getString(6));
						u.setAddresse(resultSET.getString(7));
						u.setCodePostal(resultSET.getString(8));
						u.setVille(resultSET.getString(9));
						u.setTelephone(resultSET.getString(10));
						u.setPhoto(resultSET.getString(11));
						request.setAttribute( "utilisateur", u);


					}
				}
				
			}
			strSQL = "SELECT o.id, o.idUtilisateur, o.nom, o.prix,o.photo, o.categorie,o.sousCategorie,o.etat,o.description, o.disponibilité FROM utilisateur u INNER JOIN objet o ON u.id=o.idUtilisateur WHERE u.id=?";
			try(PreparedStatement statement =connection.prepareStatement(strSQL)){

				statement.setInt(1, (int)session.getAttribute("idUtilisateur"));

				try(ResultSet resultSET = statement.executeQuery()){
					while(resultSET.next()) {
						myProfilProducts.add(new Product(resultSET.getInt(1), resultSET.getInt(2), resultSET.getString(3), resultSET.getDouble(4), resultSET.getString(5), resultSET.getString(6), resultSET.getString(7), resultSET.getString(8), resultSET.getString(9), resultSET.getInt(10)));
					}
					
					request.setAttribute("myProfilProducts", myProfilProducts);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher("profil.jsp").forward(request, response);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

		/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
