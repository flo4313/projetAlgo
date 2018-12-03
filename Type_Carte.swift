//  Created by Alexia Ognard on 30/11/2018.
//
// Type Carte et ses propriétés

import Foundation


enum TypedeCarte {
    case Roi
    case Garde
    case Soldat
    case Archer
}

protocol Carte{
    
    init()


    //renvoie le nom de la Carte
    //getnomCarte : Carte -> String
    //post : renvoie "Roi","Garde","Soldat","Archer" en fonction du type de Carte
    func getNomCarte () -> String

    //renvoie la valeur défensive de la Carte
    //getvalDef : Carte -> int
    //post : renvoie 2 si Carte = { Soldat, Archer }, 3 si Carte = Garde, 4 si Carte = Roi
    func getvalDef () -> int

    //renvoie la valeur offensive de la Carte
    //getvalOff : Carte -> int
    //post : renvoie 1 si Carte = { Soldat, Archer }, 2 si Carte = Garde, 4 si Carte = Roi
    func getvalOff () -> int

    //renvoie un booléen si la carte est en position défensive ou d'offensive
    //getestpositionDef : Carte -> bool
    //post : renvoie True si la carte est en position défensive, False si elle est en position offensive
    func getestpositionDef () -> bool

    //renvoie la portée de la Carte
    //getPortee : Carte -> (String | Vide)
    //post : renvoie A1,A2,A3,F1,F2,F3 ou vide en fonction des positions possibles d'attaque
    func getPortee () -> String?

    //met la carte en position offensive
    //mettrepositionOff : Carte -> Carte
    mutating func mettrepositionOff ()

    //met la carte en position défensive
    //mettrepositionDef : Carte -> Carte
    mutating func mettrepositionDef ()

    //fais des dégâts sur une carte lorsque celle-ci est attaquée
    //FaireDegats : Carte -> Carte
    mutating func FaireDegats () -> Self

    //renvoie la valeur de dégats causée à une carte
    //NombreDegats : Carte -> int
    //post : la valeur de dégats finale doit être plus petite que la valeur d'attaque ou de défense (en fonction de la position de la carte) de la carte
    func NombreDegats () -> int

    //enlève les dégâts d'une carte
    //sauver : Carte -> Carte
    //post : les dégats de la carte sont nuls et la valeur d'attaque ou de défense (en fonction de la position de la carte) est remise à sa valeur initiale (valeur de la carte par défaut)
    mutating func sauver () -> Carte
}
