//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.

//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.

//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

//5. Создать несколько объектов каждого класса. Применить к ним различные действия.

//6. Вывести значения свойств экземпляров в консоль.

import Foundation

enum TrunkCarSettings{
    case download, upload // Статус кузова (Загружен / Выгружен)
    
}

enum SportCarSettings{
     case raised, retracted // Статус спойлера (Поднят / Убран)
}

enum EngineStatus {
    case started, muted
}

class Car{
    var carBrand: String
    var carColor: String
    var yearRelease: Int
    var mileage: Int
    var engine: EngineStatus
    
    init(carBrand: String, carColor: String, yearRelease: Int, mileage: Int, engine: EngineStatus ) {
        self.carBrand = carBrand
        self.carColor = carColor
        self.yearRelease = yearRelease
        self.mileage = mileage
        self.engine = engine
    }
   
}

class TrunkCar: Car {
    
}

class SportСar: Car{
    var overclockingTime: Double
    var spoiler: SportCarSettings
    
    init(carBrand: String, carColor: String, yearRelease: Int, mileage: Int, overclockingTime: Double, engine: EngineStatus, spoiler: SportCarSettings ) {
        self.overclockingTime = overclockingTime
        self.spoiler = spoiler
        super.init(carBrand: carBrand, carColor: carColor, yearRelease: yearRelease, mileage: mileage, engine: engine)
    }
    
}
