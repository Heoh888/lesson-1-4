
import Foundation
// Возможные действия с автомобилем
enum TrunkCarIllumination: String{
    case enabled = "Включена"
    case disabled = "Выключена"
}
enum SportCarSpoiler: String{
     case raised = "Поднят"
     case retracted = "Убран"
}
enum EngineStatus: String {
    case started = "Заведен"
    case muted = "Заглушен"
}
// Общий класс автомобилей
class Car{
    let carBrand: String
    let carColor: String
    let yearRelease: Int
    let carNumber: String
    var engine: EngineStatus
    init(carBrand: String, carColor: String, yearRelease: Int, carNumber: String, engine: EngineStatus ) {
        self.carBrand = carBrand
        self.carColor = carColor
        self.carNumber = carNumber
        self.yearRelease = yearRelease
        self.engine = engine
    }
    func autoData() -> String {
        return "\(self.carNumber)"
    }
}
// Класс наследник TrunkCar от класса Car
class TrunkCar: Car {
    let bodyVolume: Double
    var loadedBodyVolume: Double
    let detailsOfTheCarOwner: String
    var illumination: TrunkCarIllumination
    init(carBrand: String, carColor: String, yearRelease: Int, carNumber: String, engine: EngineStatus, bodyVolume: Int, loadedBodyVolume: Int, illumination: TrunkCarIllumination, detailsOfTheCarOwner: String) {
        self.bodyVolume = Double(bodyVolume)
        self.loadedBodyVolume = Double(loadedBodyVolume)
        self.illumination = illumination
        self.detailsOfTheCarOwner = detailsOfTheCarOwner
        super.init(carBrand: carBrand, carColor: carColor, yearRelease: yearRelease, carNumber: carNumber, engine: engine)
    }
    // Функция расчета заполненность кузова
    func filledBody() -> String{
        let volumePercentage = (loadedBodyVolume/bodyVolume*100*100).rounded()/100
        var messages: String = ""
        if volumePercentage > 0{
            messages = "Кузов заполнен на \(volumePercentage) процентов"
        }else if volumePercentage == 0{
            messages = "Кузов пуст"
        }else if bodyVolume < loadedBodyVolume{
            messages = "Кузов переполнен"
        }
        return messages
    }
    override func autoData() -> String {
        return "Номер авто - \(self.carNumber) Название компании - \(self.detailsOfTheCarOwner)"
    }
    func printConsol(){
        print("Марка авто - \(carBrand), Цвет авто - \(carColor), Год выпуска - \(yearRelease), \(autoData()), Статус двигателя - \(engine.rawValue), Объем кузова - \(bodyVolume) м³, \(filledBody()), Иллюминация - \(illumination.rawValue).")
    }
    func SettingAuto (loadedBodyVolume: Int, illumination: TrunkCarIllumination, engine: EngineStatus){
        self.loadedBodyVolume = Double(loadedBodyVolume)
        self.illumination = illumination
        self.engine = engine
    }
}
// Класс наследник SportСar от класса Car
class SportСar: Car{
    let enginePower: Double
    let weightCar: Double
    let detailsOfTheCarOwner: String
    var spoiler: SportCarSpoiler
    init(carBrand: String, carColor: String, yearRelease: Int, carNumber: String, engine: EngineStatus, weightCar: Double, spoiler: SportCarSpoiler, enginePower: Int, detailsOfTheCarOwner: String) {
        self.spoiler = spoiler
        self.weightCar = Double(weightCar)
        self.enginePower = Double(enginePower)
        self.detailsOfTheCarOwner = detailsOfTheCarOwner
        super.init(carBrand: carBrand, carColor: carColor, yearRelease: yearRelease, carNumber: carNumber, engine: engine)
    }
    // Функция определения разгона от 0 до 100 км
    func overclockingTime() -> String{
        let time = (weightCar/enginePower*100).rounded()/100
        var messages: String = ""
        if engine == .started{
            messages = "Разгон от 0 до 100 км за \(time) секунд."
        }else if engine == .muted {
            messages = "Заведите машину!"
        }
        return messages
    }
    override func autoData() -> String {
        return "Номер авто - \(self.carNumber) Ф.И.О владельца - \(self.detailsOfTheCarOwner)"
    }
    func printConsol(){
        print("Марка авто - \(carBrand), Цвет авто - \(carColor), Год выпуска - \(yearRelease), \(autoData()), Вес авто - \(weightCar) кг., Статус двигателя - \(engine.rawValue), Мощность двигателя - \(enginePower) лс., Статус споллера - \(spoiler.rawValue), \(overclockingTime())")
    }
    func SettingAuto (spoiler: SportCarSpoiler, engine: EngineStatus){
        self.engine = engine
        self.spoiler = spoiler
    }
}

//  Инициализируем экземпляры
var lotus = SportСar(carBrand: "Lotus", carColor: "Белый", yearRelease: 2018, carNumber: "м567ар777", engine: .muted,  weightCar: 1550, spoiler: .retracted, enginePower: 360, detailsOfTheCarOwner: "Жуков Анатолий Иванович")
lotus.SettingAuto(spoiler: .raised, engine: .started)

var ferari = SportСar(carBrand: "Ferari", carColor: "Красный", yearRelease: 2019, carNumber: "г010ар797", engine: .muted, weightCar: 1750, spoiler: .retracted, enginePower: 460, detailsOfTheCarOwner: "Петров Василий Кротов")
// ferari.SettingAuto(spoiler: .raised, engine: .started)

var volvo = TrunkCar(carBrand: "Volvo", carColor: "Желтый", yearRelease: 2017, carNumber: "в865ру77", engine: .muted, bodyVolume: 75, loadedBodyVolume: 0, illumination: .disabled, detailsOfTheCarOwner: "ООО Доставим  Быстро")
volvo.SettingAuto(loadedBodyVolume: 22, illumination: .enabled, engine: .started)

var kamaz = TrunkCar(carBrand: "Камаз", carColor: "Черный", yearRelease: 2020, carNumber: "к432ло99", engine: .muted, bodyVolume: 75, loadedBodyVolume: 0, illumination: .disabled, detailsOfTheCarOwner: "ЗАО ТрансКонтинент")
//kamaz.SettingAuto(loadedBodyVolume: 22, illumination: .enabled, engine: .started)

// Распечатаем в консоль
lotus.printConsol()
ferari.printConsol()
volvo.printConsol()
kamaz.printConsol()
