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

/**
 * Servlet implementation class AccueilServlet
 */
@WebServlet("/AjoutProduitServlet")
public class AjoutProduitServlet extends AbstractServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<Produit> myProducts = new ArrayList<Produit>();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AjoutProduitServlet() {
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
		String subCategory = request.getParameter("SubCategory");
		String description = request.getParameter("Description");
		String state = request.getParameter("State");

		HttpSession session = request.getSession(true);
		session.setAttribute("SubCategory", subCategory);
		session.setAttribute("Description", description);
		session.setAttribute("State", state);

		String urlDB = props.getProperty("jdbc.url");
		String loginDB = props.getProperty("jdbc.login");
		String passwordDB = props.getProperty("jdbc.password");
		try(Connection connection = DriverManager.getConnection(urlDB, loginDB, passwordDB)){
			String strSQL = "insert into objet(idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilit?) values (?,?,?,?,?,?,?,?,?)";
			System.out.println(strSQL);
			try(PreparedStatement statement1 =connection.prepareStatement(strSQL)){
				statement1.setInt(1, (int) session.getAttribute("idUtilisateur"));
				statement1.setString(2, (String) session.getAttribute("NameProduct"));
				double price = Double.parseDouble((String) session.getAttribute("Price"));
				statement1.setDouble(3, price);
				statement1.setString(4, (String) session.getAttribute("Image"));
				statement1.setString(5, (String) session.getAttribute("Category"));
				statement1.setString(6, subCategory);
				statement1.setString(7, description);
				statement1.setString(8, state);
				statement1.setBoolean(9, true);
				System.out.println(statement1);
				statement1.executeQuery();

				session.setAttribute("isAdded", true);


				ArrayList<Produit> myProducts = new ArrayList<>();
				strSQL = "select * from objet";
				PreparedStatement statement = connection.prepareStatement(strSQL);
				ResultSet result = statement.executeQuery();
				while(result.next()) {
					myProducts.add(new Produit(result.getInt(1), result.getInt(2), result.getString(3), result.getDouble(4), result.getString(5), result.getString(6), result.getString(7), result.getString(8), result.getString(9), result.getInt(10)));
				}
				
				strSQL = "SELECT o.id, o.idUtilisateur, o.nom, o.prix,o.photo, o.categorie,o.sousCategorie,o.etat,o.description, o.disponibilit? FROM utilisateur u INNER JOIN objet o ON u.id=o.idUtilisateur WHERE u.id=?";
				try(PreparedStatement statement2 =connection.prepareStatement(strSQL)){

					statement2.setInt(1, (int)session.getAttribute("idUtilisateur"));

					try(ResultSet resultSET = statement2.executeQuery()){
						ArrayList<Produit> myProd = new ArrayList<>();
						while(resultSET.next()) {
							myProd.add(new Produit(resultSET.getInt(1), resultSET.getInt(2), resultSET.getString(3), resultSET.getDouble(4), resultSET.getString(5), resultSET.getString(6), resultSET.getString(7), resultSET.getString(8), resultSET.getString(9), resultSET.getInt(10)));
						}
						
						session.setAttribute("myProfilProducts", myProd);
					}
				session.setAttribute("products", myProducts);
				
				request.getRequestDispatcher("accueil.jsp?id=accueil").forward(request, response);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}}}


