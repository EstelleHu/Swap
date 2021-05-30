package controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class AjoutObjetServlet
 */
@WebServlet("/AjoutObjetServlet")
@MultipartConfig(fileSizeThreshold = 1048576, maxFileSize = 10485760, maxRequestSize = 10485760 * 5)
public class AjoutObjetServlet extends HttpServlet {
	private static final String IMAGES_FOLDER = "/Images/";
	public String uploadPath;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjoutObjetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    @Override
    public void init() throws ServletException {
    	System.out.println("Vérification dossier créé");
        uploadPath = getServletContext().getRealPath( IMAGES_FOLDER );
        
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
		System.out.println("dans DOPOST");
		for (Part part : request.getParts()) {
			System.out.println(part.getName());
			if (part.getName().equals("formFile")) {
				System.out.println("PAS dans le if");
				
				System.out.println(part.getName());
				
				String nomFichier = getFileName(part);
					System.out.println("nom du fichier : "+ nomFichier);
					nomFichier = nomFichier.substring( nomFichier.lastIndexOf( '/' ) + 1 ).substring( nomFichier.lastIndexOf( '\\' ) + 1 );
					
					String cheminComplet  = uploadPath + File.separator + nomFichier;
					part.write(cheminComplet);
					System.out.println((cheminComplet));

			}
			
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
