package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Echange;
import beans.Utilisateur;

/**
 * Servlet implementation class MesEchangesServlet
 */
@WebServlet("/MesEchangesServlet")
public class MesEchangesServlet extends AbstractServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<Integer, Echange> myExchange = new HashMap<>();
	private HashMap<Integer, Utilisateur> users = new HashMap();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MesEchangesServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		myExchange.clear();
		users.clear();
		HttpSession session = request.getSession();
		String urlDB = props.getProperty("jdbc.url");
		String loginDB = props.getProperty("jdbc.login");
		String passwordDB = props.getProperty("jdbc.password");
		try(Connection connection = DriverManager.getConnection(urlDB, loginDB, passwordDB)){
			System.out.println("CONNECTED");
			String strSQL = "select id,nom,prenom,telephone from utilisateur";
			try(PreparedStatement statement1 = connection.prepareStatement(strSQL)){
				try(ResultSet result1 = statement1.executeQuery()){
					while(result1.next()) {
						Utilisateur u = new Utilisateur();
						u.setNom(result1.getString(2));
						u.setPrenom(result1.getString(3));
						u.setTelephone(result1.getString(4));
						users.put(result1.getInt(1), u);
					}
					strSQL = "select * from echange";

					try(PreparedStatement statement = connection.prepareStatement(strSQL)){
						try(ResultSet result = statement.executeQuery()){
							while(result.next()) {
								if(result.getInt(3) == (int) session.getAttribute("idUtilisateur") || result.getInt(2) == (int) session.getAttribute("idUtilisateur")) {
									String name = users.get(result.getInt(3)).getPrenom()+" " + users.get(result.getInt(3)).getNom();
									String phone = users.get(result.getInt(3)).getTelephone();
									myExchange.put(result.getInt(1), new Echange(result.getInt(3), result.getInt(2), name, phone, result.getInt(4), result.getInt(5), result.getString(7), result.getDate(6)));
								}}
							session.setAttribute("users", users);
							session.setAttribute("myExchange", myExchange);
							request.getRequestDispatcher("mesEchanges.jsp").forward(request, response);
						}				
					}

				}}} catch (SQLException e) {
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
