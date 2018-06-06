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
        return self.view.bounds.width * 468.6/335
        //keep ratio 3.5/5 for different iphone screen
    }
   
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.allowsSelection = false
        table.rowHeight = tableCellHeight
        table.delegate = self
        table.dataSource = self
        table.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0) //table start 44 make room for nav bar
        return table
    }()

    //should be optional in a real app
    var feed:[TestPost]!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(FeedTabeViewCell.self, forCellReuseIdentifier: "cell")
        feed = TestPost.getTestFeed()
        setupNavigationBarStyle()
        setupTableViewLayout()

    }
  
    
    private func setupNavigationBarStyle(){
        self.navigationController?.navigationBar.tintColor = .white
        
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.95
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.white.cgColor
        self.navigationController?.navigationBar.layer.shadowRadius = 5
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 20)
        self.navigationController?.navigationBar.layer.masksToBounds =  false
        
        //setup image
        
        
    
        
        //setup buttons
        navigationItem.title = ""
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "camera")
            .withRenderingMode(.alwaysOriginal),style: .plain, target: self,action: #selector(cameraClicked))
        
       navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "prof")
            .withRenderingMode(.alwaysOriginal),style: .plain, target: self,action: #selector(profileClicked))
    }
    
    @objc func cameraClicked(){
        print("camera clicked")
        
    }
    @objc func profileClicked(){
        print("profile clicked")
        
    }
    private func setupTableViewLayout(){

        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
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
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedTabeViewCell
        
        cell.address.text = feed![indexPath.row].addressText
        cell.city.text = feed![indexPath.row].city
        cell.bath.text = String(feed![indexPath.row].numberBathrooms)
        cell.bed.text = String(feed![indexPath.row].numberBedrooms)

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


