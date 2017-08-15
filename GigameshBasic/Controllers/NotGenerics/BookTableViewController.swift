//
//  BookTableViewController.swift
//  GigameshBasic
//
//  Created by Manuel Colmenero Navarro on 15/8/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

class BookTableViewController: UITableViewController {
    
    // Propiedad para el modelo
    let model : Book
    
    
    init (model: Book) {
        self.model  = model
        super.init(nibName: nil, bundle: nil)
        title = "Detalle"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Se crea el identificador de celda
        let cellID = "BookCell"
        
        // Se averiguar cual es el objeto House que se ha de mostrar
        let book = model
        
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? BookFirstCustomTableViewCell
        
        if cell == nil {
            cell = UITableViewCell(style: .default,
                                   reuseIdentifier: cellID) as? BookFirstCustomTableViewCell
        }
        
        // Sincronizar House -> Cell
        cell?.coverImage?.image = book.cover.image
        cell?.titleLabel?.text  = book.title
        
        
        return cell!
        
    }
    
}
