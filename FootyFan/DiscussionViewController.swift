//
//  MyClubResultsViewController.swift
//  FootyFan
//
//  Created by Loveneet Sharma on 06/01/17.
//  Copyright © 2017 Ritesh Chopra. All rights reserved.
//

import UIKit

class DiscussionViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    var headersArray = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.headersArray = ["Rant Title","Another Rant Title","More Rants","More Rants Down The Page"]
        
        
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
        return self.headersArray.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:RantCustomCell = tableView.dequeueReusableCell(withIdentifier: "dataView") as! RantCustomCell
        
        cell.headerLabel.text = self.headersArray[indexPath.row]
        //cell.subLabel.text = "hhks mjw djd mdjbd iuhh igiu ih"
        
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "rantdetailView") as! RantViewController
        self.navigationController?.pushViewController(VC, animated: true)
   
    }
    
    @IBAction func backButtonClicked(button: UIButton) {
        
        _ = self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func newRantButtonClicked(button: UIButton) {
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "newRantView") as! NewRantPostViewController
        self.navigationController?.pushViewController(VC, animated: true)
    }

}
