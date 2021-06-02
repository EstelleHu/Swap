package controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import beans.Product;
import beans.Utilisateur;

/**
 * Servlet implementation class ModifierProfilServlet
 */
@WebServlet("/ModifierProfilServlet")
@MultipartConfig(fileSizeThreshold = 1048576, maxFileSize = 10485760, maxRequestSize = 10485760 * 5)
public class ModifierProfilServlet extends AbstractServlet {
	private static final long serialVersionUID = 1L;
	//private static final String IMAGES_FOLDER = "/Images";
	public String uploadPath;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifierProfilServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    @Override
    public void init() throws ServletException {
    	System.out.println("Vérification dossier créé");
        uploadPath = "C:\\Fac\\Swap\\Swap\\WebContent\\docs\\img"; // A modifier avec votre path
        
        System.out.println(uploadPath);
        File uploadDir = new File( uploadPath );
        if ( ! uploadDir.exists() ) uploadDir.mkdir();
        System.out.println("- dossier créé ok" + uploadPath);
		
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
		HttpSession session = request.getSession();
		Utilisateur u = (Utilisateur) session.getAttribute("utilisateur");
		String nom = request.getParameter("inputNom");
		String prenom = request.getParameter("inputPrenom");
		String dateNaissance = request.getParameter("inputDateNaissance");
		
		String mdp = request.getParameter("inputMdp");
		String addresse = request.getParameter("inputAdresse");
		String codePostal = request.getParameter("inputCodePostal");
		String ville = request.getParameter("inputVille");
		String telephone = request.getParameter("inputTelephone");
		String photo = "";
		if(nom==null || nom.isBlank()) {
			nom=u.getNom();
		}
		if(prenom==null || prenom.isBlank()) {
			prenom=u.getPrenom();
		}
		if(dateNaissance==null || dateNaissance.isBlank()) {
			dateNaissance=u.getDateNaissance();
		}

		if(dateNaissance==null || dateNaissance.isBlank()) {
			dateNaissance=u.getDateNaissance();
		}
		if(mdp==null || mdp.isBlank()) {
			mdp=u.getMdp();
		}
		if(addresse==null || addresse.isBlank()) {
			addresse=u.getAddresse();
		}
		if(codePostal==null || codePostal.isBlank()) {
			codePostal=u.getCodePostal();
		}
		if(ville==null || ville.isBlank()) {
			ville=u.getVille();
		}
		if(telephone==null || telephone.isBlank()) {
			telephone=u.getTelephone();
		}
		
		for (Part part : request.getParts()) {
			System.out.println(part.getName());
			if (part.getName().equals("formFile")) {
				
				
				System.out.println(part.getName());
				
				String nomFichier = getFileName(part);
				System.out.println("nom du fichier : "+ nomFichier);
				nomFichier = nomFichier.substring( nomFichier.lastIndexOf( '/' ) + 1 ).substring( nomFichier.lastIndexOf( '\\' ) + 1 );
				
				String cheminComplet  = uploadPath + File.separator + nomFichier;
				part.write(cheminComplet);
				System.out.println((cheminComplet));
				
				photo="docs/img/"+nomFichier;
				
			}
			
		}
		String urlDB = props.getProperty("jdbc.url");
		String loginDB = props.getProperty("jdbc.login");
		String passwordDB = props.getProperty("jdbc.password");
		try(Connection connection = DriverManager.getConnection(urlDB, loginDB, passwordDB)){
			System.out.println("CONNECTED ! ");
			
			
						String strSQLUpdate = "UPDATE utilisateur SET nom =?, prenom=?, dateNaissance=?, mdp=?, addresse=?, codePostal=?, ville=?, telephone=?, photo=? WHERE id="+u.getId()+"";
						
						try(PreparedStatement statement2=connection.prepareStatement(strSQLUpdate)){
							try {
								statement2.setString(1, nom);
								statement2.setString(2, prenom);
								statement2.setString(3, dateNaissance);
								statement2.setString(4, mdp);
								statement2.setString(5, addresse);
								statement2.setString(6, codePostal);
								statement2.setString(7, ville);
								statement2.setString(8, telephone);
								statement2.setString(9, photo);
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
						request.setAttribute("modificationReussie","Vous avez bien modifié vos informations");
						request.getRequestDispatcher("modifierProfil.jsp").forward(request, response);
						
					} catch (SQLException e2) {
						// TODO Auto-generated catch block
						e2.printStackTrace();
					}
				
			
		
	
	
		
		
	}
	private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                System.out.println("getfile return = "+content.substring(content.indexOf("=") + 2, content.length() - 1));
                return content.substring(content.indexOf("=") + 2, content.length() - 1); // foncitonne chrome
            }
        }
        return "Default.file";
		
    
    }
}
