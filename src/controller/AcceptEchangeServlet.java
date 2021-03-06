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
 * Servlet implementation class AcceptEchangeServlet
 */
@WebServlet("/AcceptEchangeServlet")
public class AcceptEchangeServlet extends AbstractServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AcceptEchangeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String urlDB = props.getProperty("jdbc.url");
		String loginDB = props.getProperty("jdbc.login");
		String passwordDB = props.getProperty("jdbc.password");
		try(Connection connection = DriverManager.getConnection(urlDB, loginDB, passwordDB)){
			System.out.println("CONNECTED");
			String strSQL = "select idObjetDest, idObjetRec from echange where id=?";
			try(PreparedStatement statement =connection.prepareStatement(strSQL)){
				statement.setInt(1, (int) session.getAttribute("monEchange"));
				System.out.println(strSQL);
				try(ResultSet resultSET = statement.executeQuery()){
					int idObjetRec = 0;	
					int idObjetDest = 0;
					if(resultSET.next()) {
						idObjetDest = resultSET.getInt(1);
						idObjetRec = resultSET.getInt(2);
						strSQL = "update objet set disponibilité='0' where id=?";
						try(PreparedStatement statement1 =connection.prepareStatement(strSQL)){
							statement1.setInt(1, idObjetDest);
							statement1.executeQuery();
						}
						try(PreparedStatement statement1 =connection.prepareStatement(strSQL)){
							statement1.setInt(1, idObjetRec);
							statement1.executeQuery();
						}
						ArrayList<Produit> prods = new ArrayList<Produit>();
						String strSQL1 = "select * from objet";
						PreparedStatement statement1 = connection.prepareStatement(strSQL1);
						ResultSet result = statement.executeQuery();
						while(result.next()) {
							prods.add(new Produit(result.getInt(1), result.getInt(2), result.getString(3), result.getDouble(4), result.getString(5), result.getString(6), result.getString(7), result.getString(8), result.getString(9), result.getInt(10)));
						}
						session.setAttribute("products", prods);
							
					}
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			strSQL = "update echange set etat='En cours' where id=?";
			try(PreparedStatement statement =connection.prepareStatement(strSQL)){
				statement.setInt(1, (int) session.getAttribute("monEchange"));
				statement.executeQuery();
				request.setAttribute("acceptEchange","Vous avez accepté l'échange !");
				request.getRequestDispatcher("accueil.jsp?id=accueil").forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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
