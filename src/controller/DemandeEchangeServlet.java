package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Product;

/**
 * Servlet implementation class DemandeEchangeServlet
 */
@WebServlet("/DemandeEchangeServlet")
public class DemandeEchangeServlet extends AbstractServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<Product> myProd = new ArrayList<>();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DemandeEchangeServlet() {
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
		String chosenProduct = request.getParameter("chosenProduct");
		System.out.println("Mon produit :" + chosenProduct);
		HttpSession session = request.getSession();

		String urlDB = props.getProperty("jdbc.url");
		String loginDB = props.getProperty("jdbc.login");
		String passwordDB = props.getProperty("jdbc.password");
		try(Connection connection = DriverManager.getConnection(urlDB, loginDB, passwordDB)){
			System.out.println("CONNECTED");
			String strSQL = "insert into echange(idDestinataire,idReceveur, idObjetDest, idObjetRec, dateEchange,etat) values (?, ?, ?,?,?,?)";
			System.out.println(strSQL);
			try(PreparedStatement statement1 =connection.prepareStatement(strSQL)){
				ArrayList<Product> prod = (ArrayList<Product>) session.getAttribute("products");
				Product toEx = new Product();
				for(Product p1 : prod){

					if(p1.getNom().equals(chosenProduct)) {
						System.out.println("Dans le if je suis : " + p1.getIdProduct());
						toEx = p1;
					}
				}
				Product p = (Product) session.getAttribute("productToExchange");
				statement1.setInt(1, (int) session.getAttribute("idUtilisateur"));
				statement1.setInt(2, p.getIdUser());
				statement1.setInt(3, toEx.getIdProduct());
				statement1.setInt(4, p.getIdProduct());
				java.sql.Date sqlDate = new java.sql.Date(Calendar.getInstance().getTime().getTime());
				statement1.setDate(5, sqlDate);
				statement1.setString(6, "En attente");
				statement1.executeQuery();

				request.setAttribute("demandeReussie","Votre demande a bien été envoyée ! Surveillez le statut de votre demande dans l'onglet Mes échanges.");
				request.getRequestDispatcher("accueil.jsp?id=accueil").forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

	} }
