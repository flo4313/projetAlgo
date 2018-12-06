enum NomPosition{
	case F1
	case F2
	case F3
	case A1
	case A2
	case A3
}

protocol PositionProtocol{

	// Fonction pour avoir le nom de la position
	func getNomPos()->String{}

	//Fonction qui dit si la position, avec ou sans carte
	func estPositionVide()->Bool{}

	// Fonction pour avoir la carte de la position
	func getCarte()->CarteProtocol{}

	// Fonction qui dit si c'est une carte adverse
	func getCarteAdverse()->Bool{}

}