//  Created by Alexia Ognard on 30/11/2018.
//
// type Champ de Bataille et ses propriétés

import Foundation

// Champ de Bataille est une collection
// Cette collection peut être parcouru par un itérateur
protocol ChampDeBatailleProtocol : Sequence{
    associatedtype ItCDB : IteratorProtocol where ItCDB.Element == Position

    //créer un champ de Bataille
    init(){}
    
    //renvoie un booléen si le CDB est vide ou non
    //pré : on prend en paramètre un champ de bataille
    //post: renvoie True si le CDB est vide, False sinon
    func estvideCDB() -> Bool{}
    
    //ajouter une carte dans le CDB
    //pré : prend en paramètre une carte, sa position. La position doit être vide pour pouvoir ajouter une carte dans celle-ci
    //post : renvoie le champ de bataille avec la nouvelle carte
    // si la position demandée est déjà prise par une carte alors on remplace celle-ci et on place l'autre carte dans la main
    mutating func ajouterCarteCDB (carte : Carte, position : Position) -> Self{}
    
    //enlève une carte du CDB
    //pré: on prend en paramètre une position
    //post: renvoie le champ de bataille sans la carte
    mutating func enleverCarteCDB(position: Position)-> Carte{}
    
    //renvoie le nombre de carte dans le CDB
    //pré: prend en paramètre un champ de bataille
    //post : renvoie le nombre de cartes présentes dans le champ de bataille
    func nombreCarteCDB (cdb : CDB) -> Int {}
    
    //renvoie la carte qui est à une positiondans le CDB
    //pré: on prend en argument une carte et le champ de bataille
    //post : on renvoie une chaine de caractère correspondant
    func getCarteCDB(position: Position)->Carte?{}

    // crée un itérateur sur le champ de bataille pour itérer avec for in. L’itération se fait sur les différentes positions possibles sur le champ de bataille (A1,A2,A3,F1,F2,F3)
    // makeIterator : CDB -> ItCDB
    func makeIterator()->ItCDB{}


    // Retourne les positions du champ de bataille
    func getPositions()->ChampDeBataille{}
}
