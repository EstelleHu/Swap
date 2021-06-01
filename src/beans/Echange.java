package beans;

import java.util.Date;

public class Echange {
	private int idAutreUser;
	private int idMine;
	private String nomAutreUser;
	private String telephoneAutreUser;
	private int idMonObjet;
	private int idAutreObjet;
	private String state;
	private Date date;
	
	public Echange(int i0, int i, String name, String phone, int i1, int i2, String s, Date d) {
		this.idAutreUser = i0;
		this.idMine = i;
		this.nomAutreUser = name;
		this.telephoneAutreUser = phone;
		this.idMonObjet = i1;
		this.idAutreObjet = i2;
		this.state = s;
		this.date = d;
	}
	
	public int getIdAutreUser() {
		return this.idAutreUser;
	}
	
	public int getIdMonObjet() {
		return this.idMonObjet;
	}
	
	public int getIdAutreObjet() {
		return this.idAutreObjet;
	}
	
	public String getState() {
		return this.state;
	}
	
	public Date getDate() {
		return this.date;
	}
	
	public String getNom() {
		return this.nomAutreUser;
	}
	
	public String getPhone() {
		return this.telephoneAutreUser;
	}
	
	public int getIdDest() {
		return this.idMine;
	}
}
