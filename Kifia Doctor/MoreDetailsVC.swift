//
//  MoreDetailsVC.swift
//  Kifia Doctor
//
//  Created by apple on 08/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class MoreDetailsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageBackView: UIView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mobNoLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        imageBackView.roundBorder(view: imageBackView)
        profileImg.roundedImg(imageView: profileImg)
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

}
extension MoreDetailsVC:UITableViewDelegate, UITableViewDataSource {

 func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
{
    return 50 //
}
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MoreDetailsTableViewCell", for: indexPath)as! MoreDetailsTableViewCell
   // cell.imageView?.image = UIImage(named: "profile placeholder")
    return cell
}
}
