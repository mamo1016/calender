import UIKit

class DateManager: NSObject {
    
    var selectDay = Date()
    var biginDay = Date()
    var endDay = Date()
    
    let calendar = Calendar.current
    
    
    //月カレンダーの始点になる日を求める
    func BeginOfMonthCalender() -> Date{
        
        //日付の要素を1日にする
        var components = calendar.dateComponents([.year,.month,.day], from: selectDay)
        components.day = 1
        let firstOfMonth = Calendar.current.date(from: components)
        
        //曜日を調べて、その要素数だけ戻ったものがカレンダーの左上(日曜日=1 土曜日=7　なので1足した状態で戻る)
        let dayOfWeek = calendar.component(.weekday,from:firstOfMonth!)
        
        return calendar.date(byAdding: .day, value: 1-dayOfWeek, to: firstOfMonth!)!
    }
    
    
    //月カレンダーの終点になる日を求める
    func EndOfMonthCalendar() ->Date{
        
        //次の月初めを取得
        let nextmonth = calendar.nextDate(after: selectDay, matching: DateComponents(day:1), matchingPolicy: Calendar.MatchingPolicy.nextTime)
        
        //曜日を調べて、その要素数だけ進んだものが右下(次の月の初めで計算している事に注意)
        let dayOfWeek = calendar.component(.weekday,from: nextmonth!)
        return calendar.date(byAdding: .day, value: 7-dayOfWeek, to: nextmonth!)!
    }
    
    
    //月ごとのセルの数を出すメソッド
    func daysAcquisition() -> Int{
        
        //始まりの日と終わりの日を取得
        biginDay = BeginOfMonthCalender()
        endDay = EndOfMonthCalendar()
        //始点から終点の日数
        return calendar.dateComponents([.day], from:biginDay ,to:endDay).day! + 1
    }
    
    
    //カレンダーの始点から指定した日数を加算した日付を返す
    func conversionDateFormat(index: Int)->String{
        
        let currentday = calendar.date(byAdding: .day, value: index, to: biginDay)
        
        return calendar.component(.day, from: currentday!).description
    }
    
    func rangeOfMonth(number: Int) -> Int{
        let calendar = Calendar.current
        let date = calendar.date(from: DateComponents(year: 2017, month: number))!
        // その月が何日あるかを計算します
//      日数
        let range: Int = (calendar.range(of: .day, in: .month, for: date)?.count)!
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return range
    }
//    //指定した月から現在の月までのセルの数を返すメソッド
//    func cellCount(startDate:Date) -> Int{
//        let startDateComponents = NSCalendar.current.dateComponents([.year ,.month], from:startDate)
//        let currentDateComponents = NSCalendar.current.dateComponents([.year ,.month], from:selectedDate)
//        //作成月と現在の月が違う時はその分表示    components.monthではなれた月分
//        let components = NSCalendar.current.dateComponents([.year,.month], from: startDateComponents, to: currentDateComponents)
//        let numberOfMonth = components.month! + components.year! * 12
//
//        for i in 0 ..< numberOfMonth + 1{
//            let dateComponents = NSDateComponents()
//            dateComponents.month = i
//            let date = NSCalendar.current.date(byAdding: dateComponents as DateComponents, to: startDate)
//            //in(その月)にof(日)が何個あるか
//            let dateRange = NSCalendar.current.range(of: .weekOfMonth, in: .month, for: date!)
//            //月の初日が何曜日かを取得 日曜日==1
//            let ordinalityOfFirstDay = NSCalendar.current.ordinality(of: .day, in: .weekOfMonth, for: firstDateOfMonth(date:date!))
//            if(ordinalityOfFirstDay == 1 || i == 0){
//                numberOfItems = numberOfItems + dateRange!.count * daysPerWeek
//            }else{
//                numberOfItems = numberOfItems + (dateRange!.count - 1) * daysPerWeek
//            }
//        }
//        print(startDateComponents)
//        return numberOfItems
//    }
    
    
    //今セレクトされているselectDayの年月をテキストで出力
    func CalendarHeader()->String{
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY/MM/dd"
        
        return formatter.string(from: selectDay)
    }
    
    
    /*
     表示月を変える操作
     */
    
    //SelectDayを一ヶ月戻す
    func preMonthCalendar(){
        selectDay = calendar.date(byAdding: .month, value: -1, to: selectDay)!
    }
    
    //SelectDayを1か月進ませる
    func nextMonthCalendar(){
        selectDay = calendar.date(byAdding: .month, value: 1, to: selectDay)!
    }
    
    
    //SelectDayを1日戻す
    func preDayCalendar(){
        selectDay = calendar.date(byAdding: .day, value: -1, to: selectDay)!
    }
    
    //SelectDayを1日進む
    func nextDayCalendar(){
        selectDay = calendar.date(byAdding: .day, value: 1, to: selectDay)!
    }
}
