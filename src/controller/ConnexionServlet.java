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

import beans.Produit;
import beans.Utilisateur;

/**
 * Servlet implementation class ConnexionServlet
 */
@WebServlet("/ConnexionServlet")
public class ConnexionServlet extends AbstractServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<Produit> myProducts = new ArrayList<>();
	private ArrayList<Produit> myProfilProducts  = new ArrayList<>();

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
		myProfilProducts.clear();
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
			System.out.println("CONNECTED");
			String strSQL = "select * from objet";
			PreparedStatement statement = connection.prepareStatement(strSQL);
			ResultSet result = statement.executeQuery();
			while(result.next()) {
				myProducts.add(new Produit(result.getInt(1), result.getInt(2), result.getString(3), result.getDouble(4), result.getString(5), result.getString(6), result.getString(7), result.getString(8), result.getString(9), result.getInt(10)));
			}
			for(Produit p : myProducts) {
				System.out.println(p.toString());
			}
			System.out.println("CONNECTED ! ");
			strSQL = "select * from utilisateur where mail=? and mdp =?";
			System.out.println(strSQL);
			Utilisateur u = new Utilisateur(); 
			try(PreparedStatement statement2 =connection.prepareStatement(strSQL)){
				statement2.setString(1, loginID);
				statement2.setString(2, passwordID);
				System.out.println(statement2);
				try(ResultSet resultSET = statement2.executeQuery()){
					if(resultSET.next()) {
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
						session.setAttribute( "utilisateur", u);
						session.setAttribute("idUtilisateur", resultSET.getInt(1));
						session.setAttribute("isConnected", true);
						strSQL = "SELECT o.id, o.idUtilisateur, o.nom, o.prix,o.photo, o.categorie,o.sousCategorie,o.etat,o.description, o.disponibilité FROM utilisateur u INNER JOIN objet o ON u.id=o.idUtilisateur WHERE u.id=?";
						try(PreparedStatement statement1 =connection.prepareStatement(strSQL)){

							statement1.setInt(1, (int)session.getAttribute("idUtilisateur"));

							try(ResultSet resultSET1 = statement1.executeQuery()){
								while(resultSET1.next()) {
									myProfilProducts.add(new Produit(resultSET1.getInt(1), resultSET1.getInt(2), resultSET1.getString(3), resultSET1.getDouble(4), resultSET1.getString(5), resultSET1.getString(6), resultSET1.getString(7), resultSET1.getString(8), resultSET1.getString(9), resultSET1.getInt(10)));
								}

								session.setAttribute("myProfilProducts", myProfilProducts);
							}


							request.getRequestDispatcher("accueil.jsp?id=accueil").forward(request, response);}}
					else {
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

