//
//  Russia.swift
//  Regions-Application
//
//  Created by Anton Smirnov on 03.09.2021.
//

import Foundation

struct Descriptions {
    struct Russia {
        static let Person = "Необходимо ввести регион который отображен на автомобильном номере частного пользования."
        static let Diplomatic = "В данном разделе можно узнать о принадлежности дипломатических номеров. Необходимо ввести первые три цифры."
        static let Military = "В данном разделе можно узнать о принадлежности военных номеров."
    }
    
    struct Ukraine {
        static let Person = "Необходимо ввести буквенный регион который отображен на автомобильном номере частного пользования."
    }
    
    struct Belarus {
        static let Person = "Необходимо ввести номер региона который отображен на автомобильном номере частного пользования."
    }
    
    struct EuropaUnion {
        static let Person = "You must enter the region that is displayed on the private car license plate."
    }
    
    struct Recognition {
        static let Description = "Данный функционал необходим для распознавания автомобильного региона. Работает только для Российских номеров."
    }
}
