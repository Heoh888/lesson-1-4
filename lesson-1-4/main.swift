//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.

//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.

//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

//5. Создать несколько объектов каждого класса. Применить к ним различные действия.

//6. Вывести значения свойств экземпляров в консоль.

import Foundation

enum TrunkCarSettings{
    case download, upload
}

enum SportCarSettings: String{
     case raised = "Поднят"
     case retracted = "Убран"
}

enum EngineStatus: String {
    case started = "Заведен"
    case muted = "Заглушен"
}

class Car{
    let carBrand: String
    let carColor: String
    let yearRelease: Int
    let weightCar: Double // вес авто
    var engine: EngineStatus
    init(carBrand: String, carColor: String, yearRelease: Int, weightCar: Int, engine: EngineStatus ) {
        self.carBrand = carBrand
        self.carColor = carColor
        self.yearRelease = yearRelease
        self.weightCar = Double(weightCar)
        self.engine = engine
    }
}

class TrunkCar: Car {

}

class SportСar: Car{
    let enginePower: Double
    var spoiler: SportCarSettings
    init(carBrand: String, carColor: String, yearRelease: Int, weightCar: Int, engine: EngineStatus, spoiler: SportCarSettings, enginePower: Int) {
        self.spoiler = spoiler
        self.enginePower = Double(enginePower)
        super.init(carBrand: carBrand, carColor: carColor, yearRelease: yearRelease, weightCar: weightCar, engine: engine)
    }
    func overclockingTime() -> String{
        let greeting = weightCar/enginePower
        let time = (greeting*100).rounded()/100
        var messages: String = ""
        if engine == .started{
            messages = "Разгон от 0 до 100 км за \(time) секунд"
        }else if engine == .muted {
            messages = "Заведите машну!"
        }
        return messages
    }
    func printConsol(){
        print("Марка авто - \(carBrand), Цвет авто - \(carColor), Год выпуска - \(yearRelease), Вес авто - \(weightCar) кг., Статус двигателя - \(engine.rawValue), Мощность двигателя - \(enginePower) лс., Статус сполера - \(spoiler.rawValue), \(overclockingTime())")
    }
    func SettingAuto (spoiler: SportCarSettings, engine: EngineStatus){
        self.engine = engine
        self.spoiler = spoiler
    }
}



var lotus = SportСar(carBrand: "Lotus", carColor: "Белый", yearRelease: 2018, weightCar: 1550, engine: .started, spoiler: .raised, enginePower: 360)
lotus.SettingAuto(spoiler: .retracted, engine: .muted)

var ferari = SportСar(carBrand: "Ferari", carColor: "Красный", yearRelease: 2019, weightCar: 1750, engine: .started, spoiler: .raised, enginePower: 460)


lotus.printConsol()
ferari.printConsol()
