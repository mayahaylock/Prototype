//
//  ViewController.swift
//  prototype
//
//  Created by Maya Haylock on 6/19/17.
//  Copyright © 2017 MayaHaylock. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var aSongs : [[String : String]] = [["Name": "Hello", "Artist": "Adele"], ["Name": "Walk This Way", "Artist": "Aerosmith"]]
    var bSongs : [[String : String]] = [["Name": "Elenor Rigby", "Artist": "Beatles"], ["Name": "Some Bruno Mars Song", "Artist": "Bruno Mars"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        refresh()
    }
    
    func refresh() {
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (section == 0) {
            return aSongs.count
        }
        
        if (section == 1) {
            return bSongs.count
        }
        
        else{
            return 0
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if (indexPath.section == 0) {
            
            let songDictionary = aSongs[indexPath.row]
            
            let artistName = songDictionary["Artist"]
            let songName = songDictionary["Name"]
            
            cell?.textLabel?.text = artistName
            cell?.detailTextLabel?.text = songName
            
        }
        
        if (indexPath.section == 1) {
            
            let songDictionary = bSongs[indexPath.row]
            
            let artistName = songDictionary["Artist"]
            let songName = songDictionary["Name"]
            
            cell?.textLabel?.text = artistName
            cell?.detailTextLabel?.text = songName
        }
        
        return cell!
    }
    
    //delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let frame = CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: 50)
        
        let theView = UIView(frame: frame)
        theView.backgroundColor = UIColor.gray
        
        return theView
    }
}

extension ViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}

