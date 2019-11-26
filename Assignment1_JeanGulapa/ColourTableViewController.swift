//
//  ColourTableViewController.swift
//  Assignment1_JeanGulapa
//
//  Created by Jean on 2019-09-27.
//  Email: gulapaj@sheridancollege.ca
//  Copyright © 2019 Jean. All rights reserved.
//
//  ColourTableViewController is where all back end coding happens. This is where all event is called for each cell - how to resize, add background colour, and manipulate data from plist.

import UIKit

class ColourTableViewController: UITableViewController {

    //properties
    var colours: [Any] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "Colours", withExtension: "plist"),
            let data = try? Data(contentsOf: url),
            let array = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [Any] {
            colours = array
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colours.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColourCell", for: indexPath) as! ColourTableViewCell

        //get a colours from array
        let index = indexPath.row
        let colourDict = colours[index] as? [String : Any]
        let name = colourDict?["Name"] as? String
        let RGB = colourDict?["RGB"] as? [Int]
        let hexadecimal = colourDict?["Hexa"] as? String
        let red = RGB?[0]
        let green = RGB?[1]
        let blue = RGB?[2]
        
        //print the value in the appropriate label names
        cell.name?.text = "\(name ?? "")"
        cell.decimalValue?.text = "(\(red ?? 0), \(green ?? 0), \(blue ?? 0))"
        cell.hexaDecimal?.text = "\(hexadecimal ?? "")"
        
        //change the background colour corresponding to each decimal value
        cell.backgroundColor = UIColor(red: CGFloat(red ?? 0)/255, green: CGFloat(green ?? 0)/255, blue: CGFloat(blue ?? 0)/255, alpha: 1)

        return cell
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //resizing each cell to fit needed values
        return 85
    }

}
