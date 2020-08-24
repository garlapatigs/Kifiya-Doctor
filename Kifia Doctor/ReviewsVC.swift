//
//  ReviewsVC.swift
//  Kifia Doctor
//
//  Created by apple on 08/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ReviewsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backBtnAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
extension ReviewsVC:UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)) //set these values as necessary
        headerView.backgroundColor = .white

        let label = UILabel(frame: CGRect(x: 10, y: -5, width: 200, height: 40))

        label.text = "Mon 10 | 03 : 50 PM"
        label.textColor = UIColor.darkGray
        headerView.addSubview(label)

        return headerView
    }

    

     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 160 //
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewsTableViewCell", for: indexPath)as! ReviewsTableViewCell
       // cell.imageView?.image = UIImage(named: "profile placeholder")
        return cell
    }
    
    
    
    
}
