//
//  PokemonDetailVC.swift
//  PokedexApp
//
//  Created by Darko Spasovski on 6/25/16.
//  Copyright © 2016 Irina Smokvarska. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD


class PokemonDetailVC: UIViewController {
    
    
    var pokemon: Pokemon!

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var pokedexIdLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
   
    
    
    @IBOutlet weak var nextEvoLabel: UILabel!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var currentEvoImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name.capitalizedString
        mainImg.image = UIImage(named: "\(pokemon.pokedexId)")
        
        let loadingNotification = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        loadingNotification.mode = MBProgressHUDMode.Indeterminate
        loadingNotification.labelText = "Loading"

        
        pokemon.downloadPokemonDetails { () -> () in
            
            self.baseAttackLbl.text = self.pokemon.attack
            self.weightLbl.text = self.pokemon.weight
            self.heightLbl.text = self.pokemon.height
            self.defenseLbl.text = self.pokemon.defense
            self.typeLbl.text = self.pokemon.type
            self.descLbl.text = self.pokemon.description
            
            if self.pokemon.nextEvolutionId == "" {
                self.nextEvoLabel.text = "No Evolutions"
                self.nextEvoImg.hidden = true
            } else {
                self.nextEvoImg.hidden = false
                self.nextEvoImg.image = UIImage(named: self.pokemon.nextEvolutionId)
                var str = "Next Evolution: \(self.pokemon.nextEvolution)"
                
                if self.pokemon.nextEvolutionLvl != "" {
                    str += " - LVL \(self.pokemon.nextEvolutionLvl)"
                    
                }
                self.nextEvoLabel.text = str
            }
            
            self.pokedexIdLbl.text = "\(self.pokemon.pokedexId)"
            self.currentEvoImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
            
            
            
            MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
            
            
            
        }
        
    }

   
    @IBAction func backBtn(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
       
    }
      
}

