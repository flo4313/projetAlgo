//
//  CollectiondeCarte.swift
//  
//
//  Created by Alexia Ognard on 02/12/2018.
// Collection de Cartes

import Foundation

enum TypeCollectiondeCarte {
    case Royaume, Pioche, Cimetiere, Main
}

protocol CollectiondeCarteProtocol : Sequence{
    associatedtype ItCollection : IteratorProtocol
        where ItCollection.Element == Carte


	init(type:TypeCollectiondeCarte){
		self.typeCollection = type
		
	}

	//renvoie un booléen si la collection est vide ou non
	//post: renvoie True si la collection est vide, False sinon
	func estvideCollection () -> booléen

	//ajouter une carte dans la collection choisie
    // pré: prend comme argument la carte qu'on veut mettre dans la collection
    //post : renvoie la collection de carte initiale avec la carte choisie en plus
	mutating func ajouterCarteCollection (carte : Carte) -> Self


	//enlever une carte de la collection
    // pré : prend en paramètre une carte qu'on veut retirer de la collection
    //post : renvoie la collection de carte initiale avec la carte choisie en moins
	mutating func supprimerCarteCollection (carte : Carte) -> Self


	//renvoie le nombre de carte dans la collection
    //post : renvoie le nombre de cartes contenue dans la collection
	func nombreCarteCollection () -> int

    
    // crée un itérateur sur la collection pour itérer avec for in. L’itération se fait dans l’ordre d'arrivée des cartes dans la collection
    // makeIterator : CollectiondeCarte -> ItCollection
    func makeIterator() -> ItCollection

}
	
