//
//  FeedTableViewController.swift
//  UIFun
//
//  Created by eric yu on 6/5/18.
//  Copyright © 2018 eric yu. All rights reserved.
//

import UIKit

class FeedTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
   
    
    let tableRowNumber:Int = 1
    var tableCellHeight:CGFloat {
        return self.view.bounds.width * 5/3.5
        //keep ratio 3.5/5 for different iphone screen
    }
   
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.allowsSelection = false
        table.rowHeight = tableCellHeight
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    lazy var navigtionBar: UINavigationBar = {
        let navigationBar = UINavigationBar()
        return navigationBar
    }()

    var testView: UIView = {
        var v = UIView()
        v.backgroundColor = .red
        return v
    }()
    
    
    
    var feed:[TestPost]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //register table
        tableView.register(FeedTabeViewCell.self, forCellReuseIdentifier: "cell")
       
        
        feed = TestPost.getTestFeed()
        setupViews()
        

    }
 
    
    private func setupViews(){
        view.addSubview(navigtionBar)
        navigtionBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
        view.addSubview(tableView)
        tableView.anchor(top: navigtionBar.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
}

// MARK: - Table view data source
extension FeedTableViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return tableRowNumber
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return feed!.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return tableCellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //edit row add view here to text
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        
        print("one of the feed is selected")
 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedTabeViewCell
        
        
   
         var url = feed![indexPath.row].imageURL
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                DispatchQueue.main.async {
                    cell.feedImage.image = UIImage(data: data!)
                }
            }).resume()
        
        url = feed![indexPath.row].profileImageURL
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                cell.faceImage.image = UIImage(data: data!)
            }
        }).resume()
        
      
        return cell
    }
    

       
    
   
}

