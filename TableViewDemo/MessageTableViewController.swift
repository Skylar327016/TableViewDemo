

import UIKit

class MessageTableViewController: UITableViewController {
    
    //tableView的dequeueReusableCell方法的參數，用常數定義Cell的identifier避免打字打錯
    struct PropertyKeys{
        static let messageCell = "messageCell"
    }
    //用來儲存假資料的Message陣列
    var messages = [Message]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //載入假資料
        loadMessages()
        //將tableView轉動到資料最後一筆的畫面，row參數用Message陣列的長度-1
        DispatchQueue.main.async {
            self.tableView.scrollToRow(at: IndexPath(row: self.messages.count - 1, section: 0), at: .bottom, animated: false)
        }
    }
    func loadMessages(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        guard let image = UIImage(named: "systemPhoto") else{return}

        let message1 = Message(date: dateFormatter.date(from: "2020-07-03T14:23")!, messageContent: """
期間限定!
■凡使用「藝FUN券」或紙本「振興三倍券」
至全台威秀影城臨櫃購買「2張電影票+2杯中杯可樂+1份大爆米花」 即享影迷價
600元 台北信義、台北京站、板橋大遠百、新竹大遠百、新竹巨城
550元 林口M.O.P、台北日新、桃園統領、頭份尚順、台中TIGER CITY、台中大遠百
500元 台南大遠百、台南FOCUS、台南南紡、高雄大遠百、花蓮新天堂樂園

至GOLD CLASS頂級影廳臨櫃購買「1張電影票+200元餐飲抵用券+1杯迎賓飲料」 即享影迷價 550元。至MUVIE CINEMAS臨櫃購買「2張電影票+2杯中杯可樂+1份中爆米花」，即享影迷價700元。
(如所持「藝FUN券」或紙本「振興三倍券」金額不足者，可補差額享優惠)■加碼回饋！使用「藝FUN券」消費不限金額再加贈「威秀寶寶萬用桶」乙個！
■信用卡綁定振興三倍券，線上購票行得通！
""", systemPhoto: image)
        
        
        let message2 = Message(date: dateFormatter.date(from: "2020-07-07T16:39")!, messageContent: """
07/10-08/16購買【魔鬼剋星1984】或【魔鬼剋星1989】電影票出示官方APP虛擬條碼或持實體卡過卡消費累點，並於活動網頁上登錄參加，即有機會獲得電影贈品「魔鬼剋星6吋電爆系列人物組 (共6個角色)」。
""", systemPhoto: image)
        
        let message3 = Message(date: dateFormatter.date(from: "2020-07-15T15:30")!, messageContent: """
凡至GOLD CLASS頂級影廳購買『單人套票』，並點購$300(含以上)餐點或飲料，即可獲得
『GOLD CLASS皮革鑰匙扣』乙個。數量有限，送完為止。凡iShow卡友至GOLD CLASS觀影，出示iShow卡或官方APP虛擬條碼消費累積點數，即有機會獲得『【 CENTURION】Playground系列 29吋旅行箱』乙個(價值$3620)！
""", systemPhoto: image)
        
        let message4 = Message(date: dateFormatter.date(from: "2020-07-15T11:00")!, messageContent: """
活動期間，凡至MUCROWN影廳購買單人套票，即可獲得「【寬宏藝術】展覽票」乙張(價值$300元)，數量有限，送完為止。展覽票可直接至全台【寬宏藝術】主辦之展覽(不限展覽場次、地點)持票入場。活動期間內，於MUCROWN享用餐點，累積消費金額達$3,000元(含以上)，並使用iShow卡或官方APP虛擬條碼消費累積點數，即有機會獲得「【台中大毅老爺行旅】旅人客房雙人住宿券」乙張 (價值$4571元)！
""", systemPhoto: image)
        
        let message5 = Message(date: dateFormatter.date(from: "2020-08-01T10:50")!, messageContent: """
活動期間，凡新申辦iShow卡並使用儲值金消費滿100元且累點成功，即有機會獲得「HAPPY GO點數50點」，把握良機，回饋立即得。

""", systemPhoto: image)
        
        let message6 = Message(date: dateFormatter.date(from: "2020-08-07T14:32")!, messageContent: """
08/07-08/17購買【怪胎】電影票出示官方APP虛擬條碼或持實體卡過卡消費累點，並於活動網頁上登錄參加，即有機會獲得「Plain me包包」。
""", systemPhoto: image)
        messages.append(message1)
        messages.append(message2)
        messages.append(message3)
        messages.append(message4)
        messages.append(message5)
        messages.append(message6)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return messages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.messageCell, for: indexPath) as? MessageTableViewCell else{
            
            return UITableViewCell()
        }
        cell.systemImage.contentMode = .scaleAspectFill
        cell.systemImage.layer.cornerRadius = cell.systemImage.frame.width / 2
        cell.systemImage.image = messages[indexPath.row].systemPhoto
        cell.dateLabel.text = messages[indexPath.row].messageDate
        cell.textMessage.text = messages[indexPath.row].messageContent
        cell.messageBox.layer.cornerRadius = 10
        cell.timeLabel.text = messages[indexPath.row].messageTime
        cell.selectionStyle = .none
        return cell
    }
    @IBAction func showContactInfo(_ sender: UIBarButtonItem) {
        guard let image = UIImage(named: "systemPhoto") else{return}
        let info = Message(date: Date(), messageContent: """
大仁資訊
技術支援專線:0800-070-751
服務時間:週一至週五09:00-18:00
""", systemPhoto: image)
        messages.append(info)
        tableView.reloadData()
        tableView.scrollToRow(at: IndexPath(row: messages.count - 1, section: 0), at: .bottom, animated: true)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
