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

/**
 * Servlet implementation class AccueilServlet
 */
@WebServlet("/AjoutProduitServlet")
public class AjoutProduitServlet extends AbstractServlet {
    private static final long serialVersionUID = 1L;

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
            String strSQL = "insert into objet(idUtilisateur,nom,prix,photo,categorie,sousCategorie,description,etat,disponibilit�) values (?,?,?,?,?,?,?,?,?)";
            System.out.println(strSQL);
            try(PreparedStatement statement1 =connection.prepareStatement(strSQL)){
                statement1.setInt(1, (int) session.getAttribute("idUtilisateur"));
                statement1.setString(2, (String) session.getAttribute("ProductName"));
                double price = Double.parseDouble((String) session.getAttribute("Price"));
                statement1.setDouble(3, price);
                statement1.setString(4, (String) session.getAttribute("Image"));
                statement1.setString(5, (String) session.getAttribute("Category"));
                statement1.setString(6, subCategory);
                statement1.setString(7, description);
                statement1.setString(8, state);
                statement1.setBoolean(9, true);

                try(ResultSet resultSET = statement1.executeQuery()){
                    if(resultSET.next()) {
                        session.setAttribute("isAdded", true);

                        request.getRequestDispatcher("accueil.jsp?id=accueil").forward(request, response);
                    }else {
                        session.setAttribute("isAdded", false);
                        request.setAttribute("error","Objet non ajout� � la BD");
                        request.getRequestDispatcher("ajoutObjet.jsp").forward(request, response);
                    }
                }
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
