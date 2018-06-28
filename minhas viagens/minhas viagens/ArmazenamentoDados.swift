//
//  ArmazenamentoDados.swift
//  minhas viagens
//
//  Created by Hicharles Rocha on 27/06/2018.
//  Copyright © 2018 Hicharles. All rights reserved.
//

import UIKit

class ArmazenamentoDados {
    
    let chaveArmazenamento = "locaisViagem"
    var viagens: [Dictionary<String, String>] = []
    
    func getDefaults() -> UserDefaults {
        return UserDefaults.standard
    }
    func salvarViagem(viagem: Dictionary<String, String>) {
        viagens = listarViagens()
        viagens.append(viagem)
        getDefaults().set(viagens, forKey: chaveArmazenamento)
        getDefaults().synchronize()
    }
    
    func listarViagens()  -> [Dictionary<String, String>]{
        let dados = getDefaults().object(forKey: chaveArmazenamento)
        if dados != nil {
            return dados as! [Dictionary<String, String>]
        }else {
            return []
        }
    }
    
    func removerViagem(indice: Int) {
        viagens = listarViagens()
        viagens.remove(at: indice)
        
        getDefaults().set(viagens, forKey: chaveArmazenamento)
        getDefaults().synchronize()
    }
}
