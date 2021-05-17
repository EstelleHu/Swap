package controller;

public class Product {
	private int idUtilisateur;
	private String nom;
	private double prix;
	private String categorie;
	private String sousCategorie;
	private String description;
	private String etat;
	private boolean disponibilité;

	public Product(int idUser, String name, double price, String category, String subCategory, String description, String state, boolean available) {
		this.idUtilisateur = idUser;
		this.nom = name;
		this.prix = price;
		this.categorie = category;
		this.sousCategorie = subCategory;
		this.description = description;
		this.etat = state;
		this.disponibilité = available;
	}
	
	public boolean isEmpty() {
		return this.isEmpty();
	}


}
