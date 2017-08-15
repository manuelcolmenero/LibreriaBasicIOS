//
//  Repository.swift
//  GigameshBasic
//
//  Created by Manuel Colmenero Navarro on 6/8/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation

// Clase con propiedad estatica
final class Repository {
    
    static let local = LocalFactory()
}

// Mark: - AuthorFactory

// Protocolo de crear casas independiente del canal
protocol AuthorFactory {
    
    // Se crea un typealias de función (clausura) que recibe un modelo y devuelve un Bool
    typealias FilterAuthor  = (Author)  -> Bool
    typealias FilterBook    = (Book)  -> Bool
    
    var authors  : [Author]  {get}
    var books    : [Book]    {get}
    
    // Función que devuelve un modelo a partir de su nombre
    func author(named : String)  -> Author?
    func book(named : String)    -> Book?
    
    // Función que trata de obtener modelos filtrados por algun criterio.
    func authors(filteredBy: FilterAuthor)  -> [Author]
    func books(filteredBy: FilterBook)      -> [Book]
}

// Mark: - LocalFactory
// Función para crear modo local casas
final class LocalFactory : AuthorFactory {
    // MARK: - Authors Repository
    var authors: [Author]{
        get{
            // Aquí es donde se crean los registros
            
            // Authors
            
            let GeorgeRRMartin = Author(id: 1,
                                        firstName: "George",
                                        lastName: "Raymond Richard Martin",
                                        alias: "George R. R. Martin",
                                        dateBorn: Date.getDateFromString("1948/09/20"),
                                        dateDied: Date.getDateFromString("9999/12/31"),
                                        nacionality: "Estadounidense",
                                        bio: "George R. R. Martin nació en 1948 en Bayonne (Nueva Jersey, EE.UU.), y en la actualidad reside en Santa Fe (Nuevo México, EE.UU.). Hijo de un estibador de familia humilde, su anhelo por conocer los destinos exóticos de los navíos que veía zarpar de Nueva York fue uno de los motivos que lo impulsaron a escribir fantasía y ciencia ficción. Licenciado en periodismo en 1970, en 1977 publicó su primera novela, Muerte de la luz, libro de culto dentro del género y obra cumbre de la ciencia ficción romántica. Desde 1979 se dedica por completo a la escritura, y de su pluma han surgido títulos como Una canción para Lya o Sueño del Fevre, donde su prosa sugerente y poética aborda temas tan poco usuales en el género como la amistad, la lealtad, el amor o la traición, desde una perspectiva despojada de manierismos pero cargada de sensibilidad. Como antologista cabe destacar su trabajo a cargo de Wild Cards, antología de mundos compartidos con temática de superhéroes, de gran prestigio. A partir de 1986 escribe guiones y colabora en series televisivas como En los límites de la realidad o La bella y la bestia, además de realizar tareas de producción en diversos telefilmes. En 1996 empieza a publicar la serie de fantasía épica Canción de hielo y fuego, éxito de ventas en Estados Unidos y auténtico revulsivo del género fantástico.")
            let RichardBMatheson = Author(id: 2,
                                          firstName: "Richard",
                                          lastName: "Burton Matheson",
                                          alias: "Logan Swanson",
                                          dateBorn: Date.getDateFromString("1926-02-20"),
                                          dateDied: Date.getDateFromString("2013-06-23"),
                                          nacionality: "Estadounidense",
                                          bio: "Richard Burton Matheson nació en 1926 en Allendale (Nueva Jersey, EE.UU.) y creció en Brooklyn. Durante la Segunda Guerra Mundial luchó en Europa, donde resultó herido. En 1949 se licenció en periodismo por la Universidad de Misuri. Las dificultades laborales para ejercer su profesión determinaron su dedicación a la narrativa. En 1950 se publicó su primer relato, “Nacido de hombre y mujer”, en The Magazine of Fantasy & Science Fiction; cuatro años después, su primera novela fantástica, Soy leyenda, eludía clichés e incorporaba por primera vez una explicación racional al vampirismo. En 1956 llegó a un acuerdo con la Universal sobre los derechos cinematográficos de El hombre menguante con la condición de hacerse cargo de la adaptación, lo que marcó el comienzo de su carrera en la industria del cine y la televisión. Cabe destacar en este campo los catorce guiones que firmó para La dimensión desconocida, así como las adaptaciones de obras de Edgar Allan Poe para Roger Corman y de su cuento “Duelo” para la ópera prima de Steven Spielberg El diablo sobre ruedas. Residió en Los Ángeles desde 1951, donde falleció en el año 2013. A pesar de haber empezado escribiendo para pulps de ciencia ficción, Matheson fue abandonando los elementos más arquetípicos del género, con que dotaba de verosimilitud los terrores más dispares, para dar mayor relevancia a las características centrales de su obra: la irrupción de lo extraordinario en la realidad, la cotidianidad del miedo y la paranoia, y la angustia vital.")
            
            
            return [RichardBMatheson, GeorgeRRMartin].sorted()
        }
    }
    
    // MARK: - Funtions - Authors
    
    // se recibe como parametro un String y devuelve un objeto opcional House dado que puede devolver nil
    func author(named: String) -> Author? {
        
        // Se parte de un array de Author y se le aplica una clausura filter
        
        /*
         Si el objeto con nombre puesto en mayusculas coincide con el parametro recibido en
         mayusculas devuelve el objeto primero encontrado dado que se trabaja con un array de
         objetos y hay que devolver uno
         */
        let author = authors.filter{$0.firstName.uppercased() == named.uppercased()}.first
        return author
        
    }
    
    // Función que recibe Author y devuelve un bool (Si pasa o no) y despues devuelve un array Author con todos aquellos registros que han dado positivo
    func authors(filteredBy: FilterAuthor) -> [Author] {
        let filtered = Repository.local.authors.filter(filteredBy)
        return filtered
    }
    
    // MARK: - Books Repository
    var books: [Book]{
        get{
            
            // Se cargan los autores
            let authorGRRMartin = Repository.local.author(named: "George")
            
            // Se crean los Covers
            let caballero7ReinosCover = Cover(image: #imageLiteral(resourceName: "el-caballero-de-los-siete-reinos-67.jpg"), description: "El caballero de los siete reinos")
            
            // Se crean los Books
            
            let caballero7Reinos = Book(title: "El caballero de los siete reinos",
                                        originalTitle: "A Knight of the Seven Kingdoms",
                                        authors: authorGRRMartin!,
                                        format: "Tapa blanda",
                                        pages: 288,
                                        publicationDate: Date.getDateFromString("2015-09-04"),
                                        collection: "Gigamesh Ficción",
                                        idiom: "Español",
                                        ISBN10: "8416035377",
                                        ISBN13: "978-8416035373",
                                        cover: caballero7ReinosCover,
                                        description: "Las andanzas de un caballero de Poniente. Los tres primeros relatos de Dunk y Egg. Muchas son las historias que se cuentan sobre Aegon V el Improbable y ser Duncan el Alto, su leal comandante de la Guardia Real. Pero la magia y la épica de la leyenda esconden la verdadera naturaleza de los héroes: la determinación de un huérfano del Lecho de Pulgas que llegó a caballero, el arrojo de un príncipe que cambió la corte por los caminos y una amistad inquebrantable capaz de vencer intrigas, traiciones... y revueltas. Durante los reinados de Daeron II y Aerys I, cuando las heridas de la rebelión de los Fuegoscuro todavía estaban abiertas, tienen lugar las primeras aventuras de un caballero fornido y bonachón y de su escudero, un infante real, fiel y de fuerte temperamento. A medio camino entre la fantasía heroica y la novela de caballerías, El caballero de los Siete Reinos narra las peripecias de dos héroes bondadosos en una tierra despiadada. «En la tradición epicofantástica, Martin es el mejor con diferencia.» Time Magazine. El encuentro de dos héroes improbables que se ganaron el corazón de su pueblo. Dunk creció huérfano en los callejones del Lecho de Pulgas y salió adelante gracias a su corpulencia. Vivió en la calle hasta que ser Arlan del Árbol de la Moneda lo tomó a su servicio como escudero. Con él recorrió los Siete Reinos y, a pesar de su corto intelecto, aprendió la esencia, que no las muchas artes, de la caballería. Justo antes de morir, el viejo ser Arlan lo arma caballero, con la luna y las estrellas como únicos testigos. De modo que, con dos caballos y una espada por toda posesión, Dunk el Tocho, ahora ya ser Duncan, fía a su fuerza ganar alguna justa y embolsarse unas monedas, y sueña con llegar a ser un gran caballero. Pero hete aquí que un día tropieza en el camino con un niño insolente a quien acabará aceptando como escudero... Y así comienza la leyenda. Con tono ligero y un desarrollo ejemplar, El caballero de los Siete Reinos retoma algunos de los temas centrales de Canción de hielo y fuego, como la lealtad, la justicia y la reflexión sobre el poder, pero desde la perspectiva cotidiana de la gente común y de su incidencia en escenarios desprovistos de fasto y oropel. El autor crea dos de sus personajes más entrañables y nos presenta una época mítica y terrible, cuyos conflictos dejarán impronta en la historia de los Siete Reinos y acarrearán consecuencias en los hechos narrados a partir de Juego de tronos. Una puerta abierta a Poniente y un delicioso recordatorio de por qué nos cautiva Martin.")
            
            return [caballero7Reinos].sorted()
        }
    }
    
    // MARK: - Funtions - Books
    func book(named: String) -> Book? {
        let book = books.filter{$0.title.uppercased() == named.uppercased()}.first
        return book
    }
    
    
    func books(filteredBy: (Book) -> Bool) -> [Book] {
        let filtered = Repository.local.books.filter(filteredBy)
        return filtered
    }
}
