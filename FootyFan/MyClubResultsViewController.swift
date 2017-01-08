//
//  MyClubResultsViewController.swift
//  FootyFan
//
//  Created by Loveneet Sharma on 06/01/17.
//  Copyright © 2017 Ritesh Chopra. All rights reserved.
//

import UIKit

class MyClubResultsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    var headersArray = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        headersArray = ["This is a results heading","3-2-1 Voting","Other Heading","Last Heading"]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headersArray.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "dataView") as! CustomTableViewCell
        
        cell.headerLabel.text = headersArray[indexPath.row]
        //cell.subLabel.text = "hhks mjw djd mdjbd iuhh igiu ih"
        
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "resultsDetailView") as! ClubResultsDetailViewController
        VC.selectedClub = headersArray[indexPath.row]
        self.navigationController?.pushViewController(VC, animated: true)
   
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        
        let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "headerView") as! CustomTableViewCell
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "footerView") as! CustomTableViewCell
        cell.backBtn.addTarget(self, action: #selector(backButtonClicked(button:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    func backButtonClicked(button: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
        
        
    }

}
