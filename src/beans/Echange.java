package beans;

import java.util.Date;

public class Echange {
	private int idMonObjet;
	private int idAutreObjet;
	private String state;
	private Date date;
	
	public Echange(int i1, int i2, String s, Date d) {
		this.idMonObjet = i1;
		this.idAutreObjet = i2;
		this.state = s;
		this.date = d;
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
}
