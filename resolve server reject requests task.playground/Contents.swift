import Foundation

// HACKERRANK: Server requests task:
// Request format: requestNumber requestIP timestamp
// Ex: "1 172.253.115.138 50000"

func GetRejectedRequests(requests: [String], limit_per_second: Int) -> [Int] {
    typealias requestsInPeriod = [String: Int]
    var period = [Int : requestsInPeriod ]()
    var rejectedRequestIds = [Int]()
    
    for request in requests {
        let parts = request.components(separatedBy: " ")
        guard parts.count == 3, let id = Int(parts[0]), let time = Int(parts[2]) else { continue }
        
        let ip = parts[1]
        
        if let lastPeriodRequests = period.first {
            let lastPeriodKey = lastPeriodRequests.key
            if time - lastPeriodKey < 1000 {
                if var requestsInPeriodCount = period[lastPeriodKey]?[ip] {
                    requestsInPeriodCount += 1
                    period[lastPeriodKey]?[ip] = requestsInPeriodCount
                    if requestsInPeriodCount > limit_per_second {
                        rejectedRequestIds.append(id)
                    }
                } else {
                    period[lastPeriodKey]?[ip] = 1
                }
            } else {
                period.removeAll()
                period[time] = [ip: 1]
            }
        } else {
            period[time] = [ip: 1]
        }
    }
    
    return rejectedRequestIds
}

let sampleRequests = [
    "1 172.253.115.138 50000", 
    "2 172.253.115.138 50900", 
    "3 172.253.115.138 51000", 
    "4 172.253.115.138 51500",
    "5 172.253.115.138 52300", 
    "6 172.253.115.138 52700", 
    "7 172.253.115.138 53500", 
    "8 172.253.115.138 54100",
    "9 172.253.115.138 56200", 
    "10 172.253.115.138 56500", 
    "11 172.253.115.138 57000", 
    "12 172.253.115.138 57800",
    "13 172.253.115.138 58100", 
    "14 172.253.115.138 58500", 
    "15 172.253.115.138 59000", 
    "16 172.253.115.138 59500"
]

print(GetRejectedRequests(requests: sampleRequests, limit_per_second: 2))
