//
//  AuthorTableViewController.swift
//  GigameshBasic
//
//  Created by Manuel Colmenero Navarro on 21/8/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

class AuthorTableViewController: UITableViewController {
    
    // Propiedad para el modelo
    private let _model : Author
    private var _books : [Book]
    
    init (model: Author) {
        self._model  = model
        self._books  = Repository.local.book(author: _model.fullName)!
        super.init(nibName: nil, bundle: nil)
        title        = _model.fullName

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "BookFirstCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell1")
        tableView.register(UINib(nibName: "BookSecondCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell2")
        tableView.register(UINib(nibName: "DescCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell3")
        
        tableView.register(UINib(nibName: "ListCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell4")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
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
        let model = _model
        
        if indexPath.row == 0 {
            
            // Crear una celda
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1") as! BookFirstCustomTableViewCell
            
            // Sincronizar Modelo -> Celda
            cell.imageViewCell?.image = model.photo.image
            
            return cell
        }else if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! BookSecondCustomTableViewCell
            
            cell.literalText.text = "Fecha nacimiento:"
            cell.dataText.text    = model.dateBorn.getStringFromDate()
            return cell
        }else if indexPath.row == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! BookSecondCustomTableViewCell
            
            if (model.dateDied.getStringFromDate() == "9999/12/31")
            {
                cell.literalText.text = ""
                cell.dataText.text    = ""
            } else {
                cell.literalText.text = "Fecha fallecimiento:"
                cell.dataText.text    = model.dateDied.getStringFromDate()
            }
            return cell
        }else if indexPath.row == 3 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! BookSecondCustomTableViewCell
            
            cell.literalText.text = "Nacionalidad:"
            cell.dataText.text    = model.nationality
            return cell

        }else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3") as! DescCustomTableViewCell
            
            cell.titleDescViewCell.text    = "Biografía:"
            cell.descriptionViewCell.text  = model.bio
            
            return cell
        }
    }
    
    // Cuando aparece la vista se llama a sincronizar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
    }
    
    func setupUI() {
        // Se crea un botón a la barra de navigationController
        
        var buttonsArray = [UIBarButtonItem]()
//        let books = Repository.local.book(author: _model.fullName)
        
        // UIBarButtonItem >>> clase que representa un botón
        // target >>> Donde se va a ejecutar
        // action >>> Método que se ha de ejecutar

        
        if _books != [] {
            let booksButton    = UIBarButtonItem(title: "Libros",
                                             style: .plain,
                                             target: self,
                                             action: #selector(displayBooks))
            buttonsArray.append(booksButton)
            
        }
        
        // Se añaden los botones a la barra de navigationController
        navigationItem.rightBarButtonItems = buttonsArray
    }
    
    @objc func displayBooks() {
        
//        let books = Repository.local.book(author: _model.fullName)
        let booksVC = BookListTableViewController(model: _books)
        
        // Se carga el wikiVC en el navigationController
        navigationController?.pushViewController(booksVC,
                                                 animated: true)
    }

}
