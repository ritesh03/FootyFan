//
//  MyClubResultsViewController.swift
//  FootyFan
//
//  Created by Loveneet Sharma on 06/01/17.
//  Copyright © 2017 Ritesh Chopra. All rights reserved.
//

import UIKit

class RantViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
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
        return 5
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell:RantCustomCell = tableView.dequeueReusableCell(withIdentifier: "dataView") as! RantCustomCell
            
            return cell

        } else if indexPath.row == 1 {
            let cell:RantCustomCell = tableView.dequeueReusableCell(withIdentifier: "facebookView") as! RantCustomCell
            
            return cell
            
        }  else if indexPath.row == 2{
            let cell:RantCustomCell = tableView.dequeueReusableCell(withIdentifier: "likeView") as! RantCustomCell
            
            return cell
        } else if indexPath.row == 3{
            let cell:RantCustomCell = tableView.dequeueReusableCell(withIdentifier: "reportView") as! RantCustomCell
            
            return cell
        } else {
            let cell:RantCustomCell = tableView.dequeueReusableCell(withIdentifier: "followView") as! RantCustomCell
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UITableViewAutomaticDimension
        }
        
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        
//        let VC = self.storyboard?.instantiateViewController(withIdentifier: "resultsDetailView") as! ClubResultsDetailViewController
//        VC.selectedClub = headersArray[indexPath.row]
//        self.navigationController?.pushViewController(VC, animated: true)
        
    }
    
    @IBAction func backButtonClicked(button: UIButton) {
        
        _ = self.navigationController?.popViewController(animated: true)
        
    }

}
