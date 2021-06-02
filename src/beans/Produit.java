package beans;

public class Produit {
	private int idProduct;
	private int idUtilisateur;
	private String nom;
	private double prix;
	private String image;
	private String categorie;
	private String sousCategorie;
	private String description;
	private String etat;
	private int disponibilite;

	public Produit(int idProduct,int idUser, String name, double price, String pic, String category, String subCategory, String description, String state, int available) {
		this.idProduct = idProduct;
		this.idUtilisateur = idUser;
		this.nom = name;
		this.prix = price;
		this.image = pic;
		this.categorie = category;
		this.sousCategorie = subCategory;
		this.description = description;
		this.etat = state;
		this.disponibilite = available;
	}
	
	public Produit() {
		this.idUtilisateur = -1;
	}
	
	public String getImage() {
		return image;
	}


	public String toString() {
		return "Product : " + this.nom + " prix : " + this.prix + " euros";
	}

	public String getNom() {
		return this.nom;
	}
	
	public double getPrix() {
		return this.prix;
	}
	
	public String getCategorie() {
		return this.categorie;
	}
	
	public String getSousCategorie() {
		return this.sousCategorie;
	}
	
	public String getDescription() {
		return this.description;
	}
	
	public String getEtat() {
		return this.etat;
	}
	
	public int getDispo() {
		return this.disponibilite;
	}
	
	public int getIdProduct() {
		return this.idProduct;
	}
	
	public int getIdUser() {
		return this.idUtilisateur;
	}

}
