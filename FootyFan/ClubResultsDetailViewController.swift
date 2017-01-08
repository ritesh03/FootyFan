//
//  ClubResultsDetailViewController.swift
//  FootyFan
//
//  Created by Loveneet Sharma on 06/01/17.
//  Copyright © 2017 Ritesh Chopra. All rights reserved.
//

import UIKit

class ClubResultsDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    var sectionArray = [String]()
    var selectedClub = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        sectionArray = ["Gary","Ritesh","Other Heading","Last Heading","Bill","Craig","Nitish","Test"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1+sectionArray.count
    }
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "dataView") as! CustomTableViewCell
        
        
        //cell.subLabel.text = "hhks mjw djd mdjbd iuhh igiu ih"
        
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        if section == 0
        {
            let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "headerView") as! CustomTableViewCell
            cell.headerLabel.text = selectedClub
            return cell
        }
        
        let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "dataView") as! CustomTableViewCell
        cell.headerLabel.text = "\(section). \(sectionArray[section-1])(2)"
        cell.subLabel.text = "Total: 200 Votes"
        
        return cell
        
      
        
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        if section == sectionArray.count
        {
        let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "footerView") as! CustomTableViewCell
        cell.backBtn.addTarget(self, action: #selector(backButtonClicked(button:)), for: .touchUpInside)
        return cell
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0
        {
        return 68.0
        }
        return 85
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == sectionArray.count

        {
            return 44.0
        }
        return 0
    }
    
    func backButtonClicked(button: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
        
        
    }


}
