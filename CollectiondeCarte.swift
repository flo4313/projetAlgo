//
//  CollectiondeCarte.swift
//  
//
//  Created by Alexia Ognard on 02/12/2018.
// Collection de Cartes

import Foundation


protocol CollectiondeCarteProtocol : Sequence{
    associatedtype ItCollection : IteratorProtocol where ItCollection.Element == Carte


	init()

	//renvoie un booléen si la collection est vide ou non
    //estvideCollection : CollectiondeCarte -> booléen
	//post: renvoie True si la collection est vide, False sinon
	func estvideCollection () -> bool

	//ajouter une carte dans la collection choisie
    //ajouterCarteCollection : CollectiondeCarte x Carte -> CollectiondeCarte
    // pré: prend comme argument la carte qu'on veut mettre dans la collection
    //post: si la collection est la pioche alors on retourne une Erreur
    //post : si la carte est un roi et la collection est un royaume on renvoie une erreur
    //post : renvoie la collection de carte initiale avec la carte choisie en plus
	mutating func ajouterCarteCollection (carte : Carte)


	//enlever une carte de la collection
    //supprimerCarteCollection : CollectiondeCarte x Carte -> CollectiondeCarte
    // pré : prend en paramètre une carte qu'on veut retirer de la collection demandée
    //post: si la collection est un cimetière on renvoie une erreur
    //post : renvoie la collection de carte initiale avec la carte choisie en moins
	mutating func supprimerCarteCollection (carte : Carte)


	//renvoie le nombre de carte dans la collection
    //nombreCarteCollection : CollectiondeCarte -> int
    //post : renvoie le nombre de cartes contenue dans la collection demandée
	func nombreCarteCollection () -> int

    
    // crée un itérateur sur la collection pour itérer avec for in. L’itération se fait dans l’ordre d'arrivée des cartes dans la collection
    // makeIterator : CollectiondeCarte -> ItCollection
    func makeIterator() -> ItCollection

}
	
