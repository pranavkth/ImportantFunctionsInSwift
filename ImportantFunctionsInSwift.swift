//Important Functions In Swift :

//1.Function to convert date from IST to current time zone:

    func convertDateTimeToCurrentTimeZoneFromIST(inDate: String) -> String {
        
        let dateFormatterInput = DateFormatter()
        dateFormatterInput.timeZone = TimeZone(abbreviation: "IST")
        dateFormatterInput.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let inputDate = dateFormatterInput.date(from: inDate) else { return ""}
        
        let dateFormatterOutput = DateFormatter()
        dateFormatterOutput.timeZone = TimeZone.current
        dateFormatterOutput.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let outDate = dateFormatterOutput.string(from: inputDate)
        return outDate
    }
    
