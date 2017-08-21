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
    
    // Se crea el identificador de celda
    let cellID = "Book"
    
    init (model: Book) {
        self.model  = model
        super.init(nibName: nil, bundle: nil)
        title = model.title
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
        return 10
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 275
        }else{
            return UITableViewAutomaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 275
        }else{
            return UITableViewAutomaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Se averiguar cual es el objeto House que se ha de mostrar
        let book = model
        
        if indexPath.row == 0 {
            
            // Crear una celda
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1") as! BookFirstCustomTableViewCell
            
            // Sincronizar Modelo -> Celda
            cell.imageViewCell?.image = book.cover.image
            
            return cell
        }else if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! BookSecondCustomTableViewCell
            
            cell.literalText.text = "Titulo original:"
            cell.dataText.text    = model.originalTitle
            
            return cell
        }else if indexPath.row == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! BookSecondCustomTableViewCell
            
            cell.literalText.text = "Autores:"
            cell.dataText.text    = model.authors.fullName
            
            return cell
        }else if indexPath.row == 3 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! BookSecondCustomTableViewCell
            
            cell.literalText.text = "Colección:"
            cell.dataText.text    = model.collection
            
            return cell
        }else if indexPath.row == 4 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! BookSecondCustomTableViewCell
            
            cell.literalText.text = "Formato:"
            cell.dataText.text    = model.format
            
            return cell
        }else if indexPath.row == 5 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! BookSecondCustomTableViewCell
            
            cell.literalText.text = "Num. Paginas:"
            cell.dataText.text    = "\(model.pages)"
            
            return cell
        }else if indexPath.row == 6 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! BookSecondCustomTableViewCell
            
            cell.literalText.text = "Idioma:"
            cell.dataText.text    = model.idiom
            
            return cell
        }else if indexPath.row == 7 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! BookSecondCustomTableViewCell
            
            cell.literalText.text = "ISBN-10:"
            cell.dataText.text    = model.ISBN10
            
            return cell
        }else if indexPath.row == 8 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! BookSecondCustomTableViewCell
            
            cell.literalText.text = "ISBN-13:"
            cell.dataText.text    = model.ISBN13
            
            return cell
        }else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3") as! DescCustomTableViewCell
            
            cell.titleDescViewCell.text    = "Sinopsis:"
            cell.descriptionViewCell.text  = model.description
            
            return cell
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "BookFirstCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell1")
        tableView.register(UINib(nibName: "BookSecondCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell2")
        tableView.register(UINib(nibName: "DescCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell3")
    }
    
}
