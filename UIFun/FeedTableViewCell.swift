//
//  FeedTableViewCell.swift
//  UIFun
//
//  Created by eric yu on 6/5/18.
//  Copyright © 2018 eric yu. All rights reserved.
//

import UIKit


class FeedTabeViewCell:UITableViewCell{
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
    private var viewContainer: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 4
        view.layer.shouldRasterize = true
        view.clipsToBounds = true
        return view
    }()
    
    private var feedImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .red
        //imageView.clipsToBounds = true
        return imageView
    }()
    
    private var bottomViewContainer: UIView = {
        var view = UIView()
        view.backgroundColor = .green
        //view.clipsToBounds = true
        return view
    }()
    
    //bottomViewConainer subViews containers
    
    private var headContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private var firstRowContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    private var secondRowContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    //bottomViewContainer subViews
    private lazy var faceImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .yellow
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageView.bounds.width/2
        return imageView
    }()

    private var address: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var indicatorDot: UIView = {
        var view = UIView()
        view.backgroundColor = .orange
        view.layer.cornerRadius = view.bounds.width/2
        return view
    }()
    private lazy var seperationDot: UIView = {
        var view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = view.bounds.width/2
        return view
    }()
    private var price: UILabel = {
        let label = UILabel()
        label.text = "$6,200 / mo"
        return label
    }()
    private var bed: UILabel = {
        let label = UILabel()
        label.text = "8 Bed"
        return label
    }()
    private var bath: UILabel = {
        let label = UILabel()
        label.text = "3Bath"
        return label
    }()
    


   
    func setupViews(){
        addSubview(viewContainer)
        
        //viewContainer consist of two main views
        viewContainer.addSubview(feedImage)
        viewContainer.addSubview(bottomViewContainer)
        
        //bottomViewContainer consist of 3 main views
        bottomViewContainer.addSubview(headContainer)
        bottomViewContainer.addSubview(firstRowContainer)
        bottomViewContainer.addSubview(secondRowContainer)
        
        //headerContainer consist of only 1 faceImage
        headContainer.addSubview(faceImage)
        
        //firstRowContainer consist of only 1 address
        firstRowContainer.addSubview(address)
        
        
        //Stack view can be use here for the sake of simplicity but it will make it harder to change in the future
        
        //secondRowContainer consist of 5 view parts
        secondRowContainer.addSubview(indicatorDot)
        secondRowContainer.addSubview(price)
        secondRowContainer.addSubview(seperationDot)
        secondRowContainer.addSubview(bed)
        secondRowContainer.addSubview(seperationDot)
        secondRowContainer.addSubview(bath)
        
        let bottomContainerHeight:CGFloat = 60
        let leftPadding:CGFloat = 20
        
        viewContainer.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: leftPadding , paddingBottom: 20, paddingRight: 20, width: 0, height: 0)

        //viewContainer SubViewlayout
        feedImage.anchor(top: viewContainer.topAnchor, left: viewContainer.leftAnchor, bottom: viewContainer.bottomAnchor, right: viewContainer.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: bottomContainerHeight, paddingRight: 0, width: 0, height: 0)
     
        bottomViewContainer.anchor(top: feedImage.bottomAnchor, left: leftAnchor, bottom: viewContainer.bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
        //bottomViewContainer SubViewLayout
        headContainer.anchor(top: bottomViewContainer.topAnchor, left: bottomViewContainer.leftAnchor, bottom: bottomViewContainer.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: leftPadding , paddingBottom: 0, paddingRight: 0, width: bottomContainerHeight, height: 0)
        firstRowContainer.anchor(top: bottomViewContainer.topAnchor, left: headContainer.rightAnchor, bottom: nil, right: bottomViewContainer.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: bottomContainerHeight/2)
        secondRowContainer.anchor(top: firstRowContainer.bottomAnchor, left: headContainer.rightAnchor, bottom: bottomViewContainer.bottomAnchor, right: bottomViewContainer.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
        
  
    }
    
}
