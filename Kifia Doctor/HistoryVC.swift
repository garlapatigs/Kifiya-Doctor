//
//  HistoryVC.swift
//  Kifia Doctor
//
//  Created by apple on 07/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class HistoryVC: UIViewController {
    var prescriptionData: PrescriptionModelDataClass?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

   

}
extension HistoryVC:UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)) //set these values as necessary
        returnedView.backgroundColor = .white

        let label = UILabel(frame: CGRect(x: 10, y: -5, width: 200, height: 40))

        label.text = "Mon 10 | 03 : 50 PM"
        label.textColor = UIColor.darkGray
        returnedView.addSubview(label)

        return returnedView
    }

    

     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 131 //
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath)as! HistoryTableViewCell
       // cell.imageView?.image = UIImage(named: "profile placeholder")
        return cell
    }
    
    
    
    
}
