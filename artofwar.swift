// Programme principal
// Art of War
// Ognard-Smague
// 01/12/2018

import Foundation


//Fonction d'interaction avec l'utilisateur. Demande à l'utilisateur d'entrer un entier pour répondre
// Si il entre 0, il lui sera demander de valider pour quitter le jeu
// Paramètre en entré: text:String --> contient la question posé à l'utilisateur
//					   valMax:Int --> contient l'entier maximum que l'utilisateur peut entré
// Valeur retournée: Int --> retourne la réponse de l'utilisateur qui est obligatoirement un entier
func demande(text:String, valMax:Int)->Int{
	print(text)
	while let rep = readLine(){
		if let ret = Int(rep){
			if  ret <= valMax && ret > 0 {
				return ret
			}
			if ret == 0 {
				print("Voulez-vous vraiment annuler? (o/O pour valider)")
				let val = readLine()
				if val == "o" || val == "O" {
					return 0
				}
			}
		}
		print("Erreur de saisie. Veuillez saisir un nombre correspondant a la reponse de votre choix ou 0 pour annuler\n")
		print(text)
	}
	return 0
}


//Programme principal qui fait jouer une partie du jouer
func programmePrincipal(){
	print("Debut du jeu Art of War.")

	//Création des joueurs
	var j1 : Joueur 
	j1 = creerJoueur(1)
	var j2 : Joueur
	j2 = creerJoueur(2)

	// Initialise la pioche et la main des joueurs
	j1.initialisationJoueur()
	j2.initialisationJoueur()

	// Demande aux joueurs de placer une carte de leur main sur le champ de bataille
	while !deployer(j1){
		print("Deploiement obligatoire")
	}
	while !deployer(j2){
		print("Deploiement obligatoire")
	}

	var partieF : Bool = false
	var joueurActuel : Joueur = j1
	var joueurAdverse Joueur = j2
	print("Debut de la partie")

	//Debut du tour d'un joueur
	while !partieF{
		print("\nAu tour de", joueurActuel.getNom())

		//Preparation
		passerCartesModeDefensive(joueurActuel.getCdB())
		print("Cartes en position defensive")

		if !joueurActuel.estPiocheVide(){
			joueurActuel.piocherCarte()
		}

		// Phase d'action
		print("Phase d'action")
		if joueur.getMain().nbCartes() == 6{
			print("Vous avez trop de cartes en main, il va falloir deployer une carte")
			rep = 2
		}
		else {
			rep = demande(text:"Que voulez-vous faire? \n1: Ne rien faire \n2: Deployer une carte \n3:Attaquer\n", valMax:3)
		}
		if rep == 0 {
			print("Le joueur a décidé de quitter la partie")
			return
		}
		if rep == 2{
			if !deployer(joueurActuel){
				print("Deploiement impossible vous allez pouvoir attaquer")
				rep = 3
			}
		}
		if rep == 3{
			attaquer(joueurActuel)
		}

		partieF = partieFinit(j1:joueurActuel, j2:joueurAdverse){
		}
	}
	print("Partie finit")
}


//----------------------------------------Partie deploiement-----------------------------------------------------------
// Deployer une carte de la main du joueur sur le champ de bataille si il le peut

func deployer(joueur: Joueur) -> Bool {
	if joueur.estMainVide(){
		return false
	}
	cartes = joueur.getMain().getCartes() // retourne un tableau de cartes
	var i : Int = 0
	for carte in cartes{
		i = i + 1
		print(i,":",carte.getNom())
	}
	val = demande(text:"Quel carte voulez-vous deployer?",valMax:i)
	while val == 0 && i > 5{
		val = demande(text: "Vous devez obligatoirement choisir une carte:",valMax:i)
	}
	if val == 0 {
		return false
	}
	cartechoisie = joueur.getMain().retirerCarte(cartes[val-1])

	while joueur.getCdB().estPlein(){
		suppCarteCDB(joueur: joueur)
		joueur.getRoyaume().ajouterCarte(carteMV)
	}

	ajouterCarte(joueur: joueur, cartechoisie: Carte)
	return true
}

//Afficher le champ de bataille des deux joueurs
func afficherChampDeBataille(j1: Joueur, j2: Joueur){
	afficherChampDeBatailleJoueur(joueur:j1)
	afficherChampDeBatailleJoueur(joueur:j2)
}

//Aficher le champ de bataille d'un joueur
func afficherChampDeBatailleJoueur(joueur:Joueur){
	var i :Int = 0
	print("Champ de bataille Joueur",joueur.getNom())
	var itPos1 = joueur.getCdB().makeIterator()
	while let pos = itPos.next(){
		if !pos.estCarteAdverse()
		tabPos[pos.getNomPos()] = pos.getCarte().getNomCarte()
	}
	print("Joueur",joueur.getNom())
	print("\nFront")
	print("F1	F2	F3")
	print(tabPos[NomPosition.F1],"	",tabPos[NomPosition.F2],"	",tabPos[NomPosition.F3])
	print("Arriere")
	print("A1	A2	A3")
	print(tabPos[NomPosition.A1],"	",tabPos[NomPosition.A2],"	",tabPos[NomPosition.A3])
}

//Supprime un carte du champ de bataille du joueur
func suppCarteCDB(joueur: Joueur)->Carte{
	var i :Int = 0
	var tabPos : [Position]
	var itPos = joueur.getCdB().makeIterator()
	while let pos = itPos.next(){
		tabPos.append(pos)
	}

	print("Champ de bataille du Joueur", joueur.getNom())
	for position in tabPos{
		if !position.estCarteAdverse(){
			i = i + 1
			print(i,": Carte",position.getCarte().getNomCarte(),"en",position.getNomPos())
		}
			
	}
	val = demande(text:"Quel carte voulez-vous mettre au Royaume?",valMax:joueur.getCdB().getnbCartes())
	while val == 0 {
		print("Vous devez obligatoirement choisir une carte")
		val = demande(text:"Quel carte voulez-vous mettre au Royaume?",valMax:joueur.getCdB().getnbCartes())
	}
	carteMV =  joueur.getCdB().enleverCarte(position:tabPos[val-1])
	return carteMV
}


//ajoute une carte sur le champ de bataille
func ajoutCarteCDB(joueur: Joueur, cartechoisie: Carte){
	var i : Int = 0
	var tabPos : [Position]
	print("Position disponible:")
	var itPos = joueur.getCdB().makeIterator()
	while let pos = itPos.next(){
		if !pos.estCarteAdverse() && pos.estPositionVide(){
			tabPos.append(pos)
			i = i + 1
			print(i,":",pos.getNomPos())
		}
	}

	var cartePose : Bool = false
	while !cartePose{
		val = demande(text:"Position de deploiement?",valMax: i)
		if val != 0{	
			joueur.getCdB.ajouterCarte(carte:cartechoisie, position: tabPos[val-1])
			cartePose = true	
		}
	}
}

//-------------------------------------------Partie attaque -------------------------------------------------------------------

func attaquer(j1: Joueur, j2: Joueur){
	var attaque : Bool = true
	var i : Int 
	var j : Int 

	var tabPos : [Position]
	var itPos = j1.getCdB().makeIterator()
	var itJ2 = j2.getCdB().makeIterator()
	var tabposAtt = [Position]
	
	j2.getCdB().reinitCartes()

	while let pos = itPos.next(){
		tabPos.append(pos)
	}

	while let p = itJ2 = itPos.next(){
		tabposAtt.append(p)
	}

	while attaque && j1.getCdB().estPosDef(){
		print("Carte qui peuvent attaquer:")
		i = 0
		j = 0
		while i < tabPos.count(){
			if tabPos[i].estCarteAdverse() && tabPos[i].estPositionVide() && tabPos[i].getCarte().estPosDef{
				j = j + 1
				print(j,":",tabPos[i].getNomPos(), "-->",tabPos[i].getCarte().getNomCarte())
			}
			i = i + 1
		}
		val = demande(text: "Choix de la carte avec laquelle vous souhaitez attaquer", valMax: j)
		if val==0 {
			v = demande(text:"Voulez-vous interrompre la phase d'action?(0:Non / 1: Oui)",valMax:1)
			if v == 1 {
				return
			}
		}
		else{
			carteattaque = tabPos[val-1]
			i = 0
			j = 0
			while i < tabposAtt[i].count(){
				if tabposAtt[i].estCible(carte: carteattaque){
					j = j + 1 
					print(j,":",tabPos[i].getNomPos(), "-->",tabPos[i].getCarte().getNomCarte())
				}
				i = i + 1
			}
			if j == 0 {
				print("Aucune cible disponible")
			}
			else{
				val = demande(text : "Choix de la carte que vous souhaitez attaquer", valMax : j)
				if val==0 {
					v = demande(text :"Voulez-vous interrompre la phase d'action?(0:Non / 1: Oui)",valMax:1)
					if v == 1 {
						return
					}
				}
				j1.getCdB().mettrePositionOffensive(pos: carteattaque)
				j2.getCdB().subirAttaque(carteA: carteattaque.getCarte(), posSubit: tabposAtt[val-1])


			}
		}
		rep = demande(text: "Voulez-vous poursuivre la phase d'attaque? (0: Non / 1: Oui)",valMax : 1)
		if rep == 0{
			attaque = false
		}
		if partieFinit(j1: j1, j2: j2){
			return
		}

	}
	print("Fin de l'attaque")
}

//---------------------------------------------Fin de partie -----------------------------------------------------------------------

func partieFinit(j1: Joueur, j2: Joueur)->Bool{
	if j1.estRoiMort() && j2.estRoiMort(){
		return true
	}
}