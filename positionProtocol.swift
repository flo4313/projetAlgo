enum NomPosition{
	case F1
	case F2
	case F3
	case A1
	case A2
	case A3
}

protocol Position{
	private nomPos : NomPosition
	private carte : Carte?
	private carteadverse : Bool

	// Fonction pour avoir le nom de la position
	//getNomPos: Position -> String
	//post : renvoie la position correspondante dans F1, F2, F3, F4, F5, F6
	func getNomPos()->String{}

	//Fonction qui dit s'il y a une carte ou non sur la position
	//estPositionVide : Position -> Bool
	//post : renvoie True s'il y a une carte, False sinon
	func estPositionVide()->Bool{}

	// Fonction pour avoir la carte sur la position correspondante
	//getCarte : Position -> Carte
	//
	func getCarte()->Carte{}

	// Fonction qui dit si c'est une carte adverse
	//getCarteAdverse : Position -> Bool
	func getCarteAdverse()->Bool{}

}
