import Foundation

protocol CollectiondeCarteProtocol : Sequence{
    associatedtype ItCollection : IteratorProtocol where ItCollection.Element == CarteProtocol

	//renvoie un booléen si la collection est vide ou non
    //estvideCollection : CollectiondeCarte -> bool
	//post: renvoie True si la collection est vide, False sinon
	func estvideCollection () -> Bool{}

	//ajouter une carte dans la collection choisie
    //ajouterCarteCollection : CollectiondeCarte x Carte -> CollectiondeCarte
    // pré: prend comme argument la carte qu'on veut mettre dans la collection
    //post : renvoie la collection de carte initiale avec la carte choisie en plus
	mutating func ajouterCarteCollection (carte : CarteProtocol) -> Self{}


	//enlever une carte de la collection
    //supprimerCarteCollection : CollectiondeCarte x Carte -> CollectiondeCarte
    // pré : prend en paramètre une carte qu'on veut retirer de la collection
    //post : renvoie la collection de carte initiale avec la carte choisie en moins
	mutating func supprimerCarteCollection (carte : CarteProtocol) -> Self{}


	//renvoie le nombre de carte dans la collection
    //nombreCarteCollection : CollectiondeCarte -> int
    //post : renvoie le nombre de cartes contenue dans la collection
	func nombreCarteCollection () -> Int{}

    
    // crée un itérateur sur la collection pour itérer avec for in. L’itération se fait dans l’ordre d'arrivée des cartes dans la collection
    // makeIterator : CollectiondeCarte -> ItCollection
    func makeIterator() -> ItCollection{}

    //renvoie la 1ere carte de la liste et la supprime de la collection
    //getFirst(): CollectiondeCarte -> Carte
    //post : renvoie la 1ere carte si la collection n'est pas vide
    func getFirst() -> CarteProtocol {}

}