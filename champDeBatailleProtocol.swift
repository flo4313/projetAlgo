//  Created by Alexia Ognard on 30/11/2018.
//
// type Champ de Bataille et ses propriétés

import Foundation

// Champ de Bataille est une collection
// Cette collection peut être parcouru par un itérateur
protocol CDBProtocol : Sequence{
    associatedtype ItCDB : IteratorProtocol where ItCDB.Element == Position

    //créer un champ de Bataille
    //init : () -> CDB
    init()
    
    
    //renvoie un booléen si le CDB est vide ou non
    //estvideCDB : CDB -> bool
    //pré : on prend en paramètre un champ de bataille
    //post: renvoie True si le CDB est vide, False sinon
    func estvideCDB () -> bool
    
    
    //ajouter une carte dans le CDB
    //ajouterCarte_CDB: CDB x Carte x String -> CDB
    //pré : prend en paramètre une carte, sa position et le champ de bataille
    //post : renvoie le champ de bataille avec la nouvelle carte
    // si la position demandée est déjà prise par une carte alors on remplace celle-ci et on place l'autre carte dans la main
    mutating func ajouterCarte_CDB (carte : Carte, position : String )
    
    
    //enlève une carte du CDB
    //enleverCarte_CDB: CDB x Carte x String -> CDB
    //pré: on prend en paramètre un champ de bataille, une carte et sa position actuelle
    //post: renvoie le champ de bataille sans la carte
    mutating func enleverCarte_CDB (carte : Carte, position : String)
    
    
    //renvoie le nombre de carte dans le CDB
    //nombreCarte_CDB : CDB -> int
    //pré: prend en paramètre un champ de bataille
    //post : renvoie le nombre de cartes présentes dans le champ de bataille
    func nombreCarte_CDB () -> int
    
    //renvoie la position d'une carte dans le CDB
    //getPosition : CDB x Carte -> String
    //pré: on prend en argument une carte et le champ de bataille
    //post : on renvoie une chaine de caractère correspondant
    func getPosition(carte: Carte) -> String

    // crée un itérateur sur le champ de bataille pour itérer avec for in. L’itération se fait sur les différentes positions possibles sur le champ de bataille (A1,A2,A3,F1,F2,F3)
    // makeIterator : CDB -> ItCDB
    func makeIterator() -> ItCDB

}
