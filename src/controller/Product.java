package controller;

import java.sql.Blob;

public class Product {
	private int idUtilisateur;
	private String nom;
	private double prix;
	private String image;
	private String categorie;
	private String sousCategorie;
	private String description;
	private String etat;
	private boolean disponibilité;

	public Product(int idUser, String name, double price, String pic, String category, String subCategory, String description, String state, boolean available) {
		this.idUtilisateur = idUser;
		this.nom = name;
		this.prix = price;
		this.image = pic;
		this.categorie = category;
		this.sousCategorie = subCategory;
		this.description = description;
		this.etat = state;
		this.disponibilité = available;
	}
	
	public Product() {
		this.idUtilisateur = -1;
	}
	
	public String toString() {
		return "Product : " + this.nom + " prix : " + this.prix + " euros";
	}
	
	public boolean isEmpty() {
		return this.isEmpty();
	}


}
