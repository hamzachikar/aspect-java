package application.beans;

public class Compte {
	private double solde;
	
	
	public double getSolde() {
	 return solde;
	}
	public void setSolde(double solde) {
	 this.solde = solde;
	}
	public void debiter(double mt){
	 solde-=mt;
	 }
	public void approvisionner(double mt){
	 solde+=mt;
	} 


}
