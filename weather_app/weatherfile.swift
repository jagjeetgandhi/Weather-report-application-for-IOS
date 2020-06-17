import Foundation
import CoreLocation

protocol weatherforecastDelegate {
    func shouldUpdateUI(wobj:weathermodel)
}

class weatherforecast {
    
        var weatherurl = "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=a0bb199b57d79834220c7cddfd4b5262"
    
     var delegate:weatherforecastDelegate?
    
    func cityweather(cityname:String)->URL {
        let curl = "\(weatherurl)&q=\(cityname)"
        print(curl)
       let cityurl = URL(string: curl)
        return cityurl!
        }
    func createURL(_ lat:CLLocationDegrees,_ long:CLLocationDegrees)->URL {
         let curl = "\(weatherurl)&lat=\(lat)&lon=\(long)"
        let cityurl = URL(string: curl)
        print(cityurl)
        return cityurl!
    }
    
   func searching(urlstring:URL) {
        let session = URLSession(configuration: .default)
    let task = session.dataTask(with: urlstring) {(data,response,error) in
        if(error != nil) {
            print(error as Any)
            return
        }
        if let safedata=data {
            if let weatherobj = self.parseJSON(weatherdata: safedata){
                self.delegate?.shouldUpdateUI(wobj: weatherobj)
                
            }
            let  apidata = String(data:safedata,encoding: .utf8)
            print(apidata)
            
        }
}
    task.resume()
    
}
    func parseJSON(weatherdata:Data)->weathermodel? {
        let decoder = JSONDecoder()
        do {
            let odata = try decoder.decode(orignaldata.self, from: weatherdata)
            let temprature = odata.main.temp
          let id = odata.weather[0].id
            let name = odata.name
            let weathermod = weathermodel(name: name, id: id, temp: temprature)
            weathermod.conditionname
            return weathermod
            
         }
        catch {
            print("error found")
            return nil
        }
    }
   
}
