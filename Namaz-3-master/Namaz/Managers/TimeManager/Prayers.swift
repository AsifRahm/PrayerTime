
//  Namaz
//
//  Created by Asif on 07.03.2021.
//  Copyright © 2021 Asif. All rights reserved.
//

import Foundation
import Adhan

public enum Prayer {
    
    case fajr(Date)
    case sunrise(Date)
    case dhuhr(Date)
    case asr(Date)
    case maghrib(Date)
    case isha(Date)
    
    var date: Date {
        switch self {
        case .fajr(let date): 	    return date
        case .sunrise(let date):    return date
        case .dhuhr(let date):      return date
        case .asr(let date):        return date
        case .maghrib(let date):    return date
        case .isha(let date):       return date
        }
    }
    
    var name: String {
        switch self {
        case .fajr:     return "Fajr"
        case .sunrise:  return "Sunrise"
        case .dhuhr:    return "Dhuhr"
        case .asr:      return "Asr"
        case .maghrib:  return "Maghrib"
        case .isha:     return "Isha"
        }
    }
    var pray: String {
        switch self {
        case .fajr:     return "Fajr - \(format: .HHmm, date: date)"
        case .sunrise:  return "Sunrise - \(format: .HHmm, date: date)"
        case .dhuhr:    return "Dhuhr - \(format: .HHmm, date: date)"
        case .asr:      return "Asr - \(format: .HHmm, date: date)"
        case .maghrib:  return "Maghrib - \(format: .HHmm, date: date)"
        case .isha:     return "Isha - \(format: .HHmm, date: date)"
        }
    }
    
}





extension Prayer {
    
    static func make(players: PrayerTimes) -> [Prayer] {
        return [.fajr(players.fajr), .sunrise(players.sunrise),
         .dhuhr(players.dhuhr), .asr(players.asr),
         .maghrib(players.maghrib), .isha(players.isha)]
    }
}


extension Array where Element == Prayer {
    var nearest: Element? {
        self.first(where: { $0.date > Date() })
    }
}



