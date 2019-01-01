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
//2.Function to delete a file from the documentsDirectory using NSFileCoordinator

func deleteDocumentAtUrl(url: URL){
    // Function deletes the document at a file location using NSFileCoordinator.
    let fileCoordinator = NSFileCoordinator(filePresenter: nil)
    fileCoordinator.coordinate(writingItemAt: url, options: .forDeleting, error: nil, byAccessor: {
        (urlForModifying) -> Void in
        
        do {
            try FileManager.default.removeItem(at: urlForModifying)
        }catch let error {
            CrashlyticsHelper.reportCrash(err: error as NSError, strMethodName: "deleteDocumentAtUrl")
        }
    })
}

//3. Function to calculate difference between two dates.as


func getDifferenceBetweenTwoDates(firstDateString:Date,secondDateString:String) -> String? {
    
    var returnString         : String? = nil
    let calendar             = Calendar.current
    let serverDateFormat     = "yyyy-MM-dd HH:mm:ss"
    let dateFormatter        = DateFormatter()
    dateFormatter.dateFormat = serverDateFormat
    let firstDateString      = "2016-11-30 22:22:20"
    let secondDateString     = "2016-11-30 22:22:22"
    
    guard let firstDate      = dateFormatter.date(from: firstDateString)  else { return nil }
    guard let secondDate     = dateFormatter.date(from: secondDateString) else { return nil }
    
    let yearComponents       = calendar.dateComponents([.year],   from: firstDate, to: secondDate)
    let monthComponents      = calendar.dateComponents([.month],  from: firstDate, to: secondDate)
    let dayComponents        = calendar.dateComponents([.day],    from: firstDate, to: secondDate)
    let hourComponents       = calendar.dateComponents([.hour],   from: firstDate, to: secondDate)
    let minuteComponents     = calendar.dateComponents([.minute], from: firstDate, to: secondDate)
    let secondComponents     = calendar.dateComponents([.second], from: firstDate, to: secondDate)
    
    if let years = yearComponents.year, years > 0 {
        returnString = "\(years)Y ago"
    }
    else if let months =  monthComponents.month, months > 0 {
        returnString = "\(months)M ago"
    }
    else if let days = dayComponents.day, days > 0 {
        returnString = "\(days)D ago"
    }
    else if let hours = hourComponents.hour, hours > 0 {
        returnString = "\(hours)H ago"
    }
    else if let minutes = minuteComponents.minute, minutes > 0 {
        returnString = "\(minutes)m ago"
    }
    else if let seconds = secondComponents.second, seconds > 0 {
        returnString = "\(seconds) sec ago"
    }
    return returnString
}

//4.Function to retrieve set of words from a string.

func setOfWords(string: String, language: inout String?) -> Set<String> {
    var wordSet = Set<String>()
    string.enumerateSubstrings(in: string.startIndex ..< string.endIndex, options: .byWords) {
        word, _, _, _ in
        guard let word = word else {return}
        wordSet.insert(word.lowercased())
    }
    return wordSet
}

extension String {
    func subString(from: Int, to: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: from)
        let endIndex = self.index(self.startIndex, offsetBy: to)
        return String(self[startIndex...endIndex])
    }
    
    func isPalindrome() -> Bool {
        return self == self.reverse()
    }
    
    func reverse() -> String {
        let reversed = String(self.reversed())
        return reversed
    }
    
    func allSubstrings() -> [String] {
        var substrings = [String]()
        for i in 0..<self.count {
            for j in i..<self.count {
                substrings.append(self.subString(from: i, to: j))
            }
        }
        return substrings
    }
}

func countAllPalindromicSubstrings(s:String) -> Int {
    var count = 0
    let substrings = s.allSubstrings()
    for string in substrings {
        if string.isPalindrome() {
            count += 1
        }
    }
    return count
}






