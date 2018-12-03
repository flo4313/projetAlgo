import Foundation

protocol Joueur{
    //lors de l'initialisation du joueur on crée une pioche, une main, un cimetière et un royaume associé à ce joueur
	init(nom: String)
    
    
    
    // renvoie le nom du joueur
    //getNom : Joueur -> String
    func getNom() -> String
    
    //renvoie la main du joueur
    //getMain : Joueur -> CollectiondeCarte
	func getMain() -> CollectiondeCarte
    
    //renvoie le cimetière du joueur
    //getCimetiere: Joueur -> CollectiondeCarte
	func getCimetiere() -> CollectiondeCarte
    
    //renvoie le royaume du joueur
    //getRoyaume : Joueur -> CollectiondeCarte
	func getRoyaume() -> CollectiondeCarte
    
    //renvoie la pioche du joueur
    //getPioche : Joueur -> CollectiondeCarte
	func getPioche() -> CollectiondeCarte
    
    //renvoie le champ de bataille du joueur
    //getCdB : Joueur -> ChampDeBataille
	func getCdB() -> ChampDeBataille

	//Ajoute les cartes dans la main du joueur et dans la pioche au debut de la partie
    //pré : la main du joueur contient un roi, la pioche contient 20 cartes
    //post : la main du joueur contient 4 cartes (3 cartes de la pioche + 1 roi), la pioche contient les 17 autres cartes
	func initialisationJoueur()
    
}
