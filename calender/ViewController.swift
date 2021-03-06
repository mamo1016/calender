import UIKit

class ViewController: UIViewController ,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{     let dateManager = DateManager()
    
    let weekArray = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    let numOfDays = 7       //1週間の日数
    let cellMargin : CGFloat = 2.0  //セルのマージン。セルのアイテムのマージンも別にあって紛らわしい。アイテムのマージンはゼロに設定し直してる
    var monthArray: [Int] = []
    
    //OUTLET
    @IBOutlet weak var calenderCollectionView: UICollectionView!
    @IBOutlet weak var headerTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calenderCollectionView.delegate = self
        calenderCollectionView.dataSource = self
        
        headerTitle.text = dateManager.CalendarHeader()
        for i in 2..<13 {
            let monthRange = dateManager.rangeOfMonth(number: i)
            monthArray.append(monthRange)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //コレクションビューのセクション数　今回は2つに分ける
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    //セルの総数
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return dateManager.cellCount(startDate:startDate)
//    }
    //データの個数（DataSourceを設定した場合に必要な項目）
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(section == 0){   //section:0は曜日を表示
            return numOfDays
        }else{
//            return dateManager.daysAcquisition()       //section:1は日付を表示 　※セルの数は始点から終点までの日数
            dateManager.daysAcquisition()
            return 365
        }
    }
    
    //データを返すメソッド（DataSourceを設定した場合に必要な項目）
    //動作確認の為セルの背景を変える。曜日については表示する
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //コレクションビューから識別子「CalendarCell」のセルを取得する
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        if(indexPath.section == 0){             //曜日表示
            cell.backgroundColor = UIColor.green
            cell.textLabel.text = weekArray[indexPath.row]
            
        }else{                                  //日付表示
            cell.backgroundColor = UIColor.white
            cell.textLabel.text = dateManager.conversionDateFormat(index: indexPath.row)   //Index番号から表示する日を求める
            
        }
        return cell
    }
    
    //セルをクリックしたら呼ばれる
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
　        print("Num：\(indexPath.row) Section:\(indexPath.section)")
        var displayNum: Int = 0
        if indexPath.row > monthArray[0] + monthArray[1] {
            displayNum = indexPath.row - monthArray[0] - monthArray[1] - 3
        }
        if indexPath.row < 4{//2月
            displayNum = indexPath.row + monthArray[0] - 3
        }else if indexPath.row < monthArray[1] + 4{//3月
            displayNum = indexPath.row - 3
        }else if indexPath.row < monthArray[2] + monthArray[1] + 4{//4月
            displayNum = indexPath.row - monthArray[1] - 3
        }else if indexPath.row < monthArray[3] + monthArray[2] + monthArray[1] + 4{
            displayNum = indexPath.row - monthArray[2] - monthArray[1] - 3
        }
        print(displayNum)
    }
    /*
     
     セルのレイアウト設定
     
     */
    //セルサイズの指定（UICollectionViewDelegateFlowLayoutで必須）　横幅いっぱいにセルが広がるようにしたい
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfMargin:CGFloat = 8.0
        let widths:CGFloat = (collectionView.frame.size.width - cellMargin * numberOfMargin)/CGFloat(numOfDays)
        let heights:CGFloat = widths * 0.8
        
        return CGSize(width:widths,height:heights)
    }
    
    //セルのアイテムのマージンを設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0.0 , 0.0 , 0.0 , 0.0 )  //マージン(top , left , bottom , right)
    }
    
    //セルの水平方向のマージンを設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellMargin
    }
    //セルの垂直方向のマージンを設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellMargin
    }
    /*
     
     Action
     
     */
    
    //前月ボタン
    @IBAction func prevMonthBtn(_ sender: UIButton) {
        dateManager.preMonthCalendar()
        calenderCollectionView.reloadData()
        headerTitle.text = dateManager.CalendarHeader()
    }
    
    //次月ボタン
    @IBAction func nextMonthBtn(_ sender: UIButton) {
        dateManager.nextMonthCalendar()
        calenderCollectionView.reloadData()
        headerTitle.text = dateManager.CalendarHeader()
    }
    
    //前日ボタン
    @IBAction func preDayBtn(_ sender: UIButton) {
        dateManager.preDayCalendar()
        calenderCollectionView.reloadData()
        headerTitle.text = dateManager.CalendarHeader()
    }
    
    //次の日ボタン
    @IBAction func nextDayBtn(_ sender: UIButton) {
        dateManager.nextDayCalendar()
        calenderCollectionView.reloadData()
        headerTitle.text = dateManager.CalendarHeader()
    }
}
