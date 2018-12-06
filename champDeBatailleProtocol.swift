import Foundation

// Champ de Bataille est une collection
// Cette collection peut être parcouru par un itérateur
protocol ChampDeBatailleProtocol : Sequence{
    associatedtype ItCDB : IteratorProtocol where ItCDB.Element == PositionProtocol

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
    mutating func ajouterCarteCDB (carte : CarteProtocol, position : PositionProtocol) -> Self{}
    
    //enlève une carte du CDB
    //pré: on prend en paramètre une position
    //post: renvoie le champ de bataille sans la carte
    mutating func enleverCarteCDB(position: PositionProtocol)-> CarteProtocol{}

    //renvoie la carte qui est à une positiondans le CDB
    //pré: on prend en argument une carte et le champ de bataille
    //post : on renvoie une chaine de caractère correspondant
    func getCarteCDB(position: PositionProtocol)->CarteProtocol?{}

    // crée un itérateur sur le champ de bataille pour itérer avec for in. L’itération se fait sur les différentes positions possibles sur le champ de bataille (A1,A2,A3,F1,F2,F3)
    // makeIterator : CDB -> ItCDB
    func makeIterator()->ItCDB{}


    // Reinitialise tout les degats des cartes
    // remet les degats des cartes qui sont sur des positions a 0 
    func reinitCartes()->Self{}

    //Defini si des cartes sont en position defensives pour pouvoir attaque
    // return true si la carte peut attaquer false sinon
    func estPosDef()->Bool{}

    // mettre une carte en position offensive
    mutating func mettrePositionOffensive(pos: PositionProtocol)->Self{}


}
