package beans;

public class Don {
	
    private int UtilisateurId;
    private float total;
 
    public Don(int UtilisateurId, String total) {
        this.UtilisateurId = UtilisateurId;
        this.total = Float.parseFloat(total);
    }
 
    public int getUtilisateurId() {
        return UtilisateurId;
    }
 

     
    public String getTotal() {
        return String.format("%.2f", total);
    }
	
}
