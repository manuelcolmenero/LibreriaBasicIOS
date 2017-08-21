//
//  BookListTableViewController.swift
//  GigameshBasic
//
//  Created by Manuel Colmenero Navarro on 20/8/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

class BookListTableViewController: UITableViewController {
    
    // Propiedad para el modelo
    private let _model : [Book]
    let cellID = "List"
    
    init (model: [Book]) {
        self._model  = model
        super.init(nibName: nil, bundle: nil)
        
        title       = "Catálogo"
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
        return _model.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Se crea el identificador de celda

        
        // Se averiguar cual es el objeto House que se ha de mostrar
        let book = _model[indexPath.row]
        
        // Crear una celda
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! ListCustomTableViewCell
        
        cell.imageList.image      = book.cover.image
        cell.titleList.text       = book.title
        cell.descriptionList.text = book.description
        
        return cell
    }
    
    
//    // MARK: - Table View Controller
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        // Se averigua la celda
        let model   = _model[indexPath.row]
        
        // Se muestra la celda
        let modelVC = BookTableViewController(model: model)
        navigationController?.pushViewController(modelVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ListCustomTableViewCell", bundle: nil), forCellReuseIdentifier: cellID)
        
    }
}
