//
//  FeedTableViewCell.swift
//  UIFun
//
//  Created by eric yu on 6/5/18.
//  Copyright © 2018 eric yu. All rights reserved.
//

import UIKit


class FeedTabeViewCell:UITableViewCell{
    
    let bottomContainerHeight:CGFloat = 50
    //let cellViewRatio:CGFloat = 335.0/468.6
    //use ratio so UI will feel more the same in different
    //iphone screen
  
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        bottomLayer()
        layoutLevel1()
        layoutLevel2()
        layoutLevel3()
        topLayer()
  
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var shadowViewContainer: UIView = {
        //and another view
        var view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize.zero
        view.frame = view.frame.integral
        return view
    }()
    
    private lazy var viewContainer: UIView = {
       //and another view
        var view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
//        view.layer.shadowColor = UIColor.gray.cgColor
//        view.layer.shadowOpacity = 0.5
//        view.layer.shadowOffset = CGSize.zero
//        view.layer.shadowRadius = 4
        view.clipsToBounds = true
        view.frame = view.frame.integral
        return view
    }()
    
    var feedImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.frame = imageView.frame.integral
        
        return imageView
    }()
    
    //city name can be too long, this can be solve by making
    //the uilabel width depending on the city, shrink the text
    //or combination of the time.

    lazy var city: UILabel = {
        let label = UILabel()
        label.text = "Tahoe"
        label.textColor = .white
        label.layer.cornerRadius = 5
        label.backgroundColor = .gray
        label.clipsToBounds = true
        label.textAlignment = .center
        label.frame = label.frame.integral
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    private var bottomViewContainer: UIView = {
        var view = UIView()
        view.backgroundColor = .green
        view.frame = view.frame.integral
        return view
    }()
    
    
    private var headContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.frame = view.frame.integral
        return view
    }()
    
    private var firstRowContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.frame = view.frame.integral
        
        return view
    }()
    private var secondRowContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.frame = view.frame.integral
        return view
    }()
    
    var faceImageHeight:CGFloat = 24
    lazy var faceImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .white
        //(bottomContainerHeight/3) height and width of faceImage
        imageView.layer.cornerRadius = faceImageHeight/2.0
        imageView.clipsToBounds = true
        return imageView
    }()

    var address: UILabel = {
        let label = UILabel()
        label.text = "5120 Black Diamond Way"
        label.font = UIFont.systemFont(ofSize: 17)
        label.frame = label.frame.integral
        return label
    }()
    
    let indicatorDotHeight:CGFloat = 4
    private lazy var indicatorDot: UIView = {
        var view = UIView()
        view.backgroundColor = .orange
        view.layer.cornerRadius = indicatorDotHeight/2.0
        return view
    }()
    private lazy var seperationDot1: UIView = {
        var view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = seperationDotRadius
        view.clipsToBounds = true
        return view
    }()
    
    let seperationDotRadius:CGFloat = 1.5
    private lazy var seperationDot2: UIView = {
        var view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = seperationDotRadius
        view.clipsToBounds = true
        return view
    }()
    var price: UILabel = {
        let label = UILabel()
        label.text = "$6,200 / mo"
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    var bed: UILabel = {
        let label = UILabel()
        label.text = "8 Bed"
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    var bath: UILabel = {
        let label = UILabel()
        label.text = "3Bath"
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    let messageImageHeight:CGFloat = 16
    lazy var messageImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = messageImageHeight/2.0
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "message")
        return imageView
    }()
    

    let leftPadding:CGFloat = 20
    let cellPadding:CGFloat = 18.4
    func bottomLayer(){
        addSubview(shadowViewContainer)
        shadowViewContainer.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: leftPadding , paddingBottom: cellPadding, paddingRight: 20, width: 0, height: 0)
    }
    func layoutLevel1(){
        addSubview(viewContainer)
        viewContainer.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: leftPadding , paddingBottom: cellPadding, paddingRight: 20, width: 0, height: 0)
    }
    func layoutLevel2(){
        viewContainer.addSubview(feedImage)
        feedImage.anchor(top: viewContainer.topAnchor, left: viewContainer.leftAnchor, bottom: viewContainer.bottomAnchor, right: viewContainer.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: bottomContainerHeight, paddingRight: 0, width: 0, height: 0)
        
        viewContainer.addSubview(bottomViewContainer)
        bottomViewContainer.anchor(top: feedImage.bottomAnchor, left: leftAnchor, bottom: viewContainer.bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
    func layoutLevel3(){
        
        //refactor number to varibles for city
        feedImage.addSubview(city)
        city.anchor(top: nil, left: nil, bottom: feedImage.bottomAnchor, right: feedImage.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 14, paddingRight: 15, width: 95, height: 0)
        
        bottomViewContainer.addSubview(headContainer)
        headContainer.anchor(top: bottomViewContainer.topAnchor, left: bottomViewContainer.leftAnchor, bottom: bottomViewContainer.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: leftPadding , paddingBottom: 0, paddingRight: 0, width: bottomContainerHeight, height: 0)
     
        bottomViewContainer.addSubview(firstRowContainer)
        firstRowContainer.anchor(top: bottomViewContainer.topAnchor, left: headContainer.rightAnchor, bottom: nil, right: bottomViewContainer.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: bottomContainerHeight/2)
        
        bottomViewContainer.addSubview(secondRowContainer)
        secondRowContainer.anchor(top: firstRowContainer.bottomAnchor, left: headContainer.rightAnchor, bottom: bottomViewContainer.bottomAnchor, right: bottomViewContainer.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        

    }
    func topLayer(){
        
        let faceImageTopPadding:CGFloat = 10
        let faceImageLeftPadding:CGFloat = 8
        headContainer.addSubview(faceImage)
      
        faceImage.anchor(top: headContainer.topAnchor, left: headContainer.leftAnchor, bottom: nil, right: nil, paddingTop: faceImageTopPadding, paddingLeft: faceImageLeftPadding, paddingBottom: 0, paddingRight: 0, width: faceImageHeight, height: faceImageHeight
        )
        
        let messageImageTopPadding:CGFloat = 22
        let messageImageLeftPadding:CGFloat = 27
        headContainer.addSubview(messageImage)
        messageImage.anchor(top: headContainer.topAnchor, left: headContainer.leftAnchor, bottom: nil, right: nil, paddingTop: messageImageTopPadding, paddingLeft: messageImageLeftPadding, paddingBottom: 0, paddingRight: 0, width: messageImageHeight, height: messageImageHeight
        )
       
        
        firstRowContainer.addSubview(address)
        address.anchor(top:firstRowContainer.topAnchor , left: firstRowContainer.leftAnchor, bottom: firstRowContainer.bottomAnchor, right: firstRowContainer.rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
 
        secondRowContainer.addSubview(indicatorDot)
        indicatorDot.centerYAnchor.constraint(equalTo: secondRowContainer.centerYAnchor).isActive = true
        indicatorDot.anchor(top: nil, left: secondRowContainer.leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: indicatorDotHeight, height: indicatorDotHeight)
        
        secondRowContainer.addSubview(price)
        price.centerYAnchor.constraint(equalTo: secondRowContainer.centerYAnchor).isActive = true
        price.anchor(top: nil, left: indicatorDot.rightAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
       
        secondRowContainer.addSubview(seperationDot1)
        seperationDot1.centerYAnchor.constraint(equalTo: secondRowContainer.centerYAnchor).isActive = true
        seperationDot1.anchor(top: nil, left: price.rightAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: seperationDotRadius*2, height: seperationDotRadius*2)
        
        secondRowContainer.addSubview(bed)
        bed.centerYAnchor.constraint(equalTo: secondRowContainer.centerYAnchor).isActive = true
        bed.anchor(top: nil, left: seperationDot1.rightAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        secondRowContainer.addSubview(seperationDot2)
        seperationDot2.centerYAnchor.constraint(equalTo: secondRowContainer.centerYAnchor).isActive = true
        seperationDot2.anchor(top: nil, left: bed.rightAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: seperationDotRadius*2, height: seperationDotRadius*2)
       
        secondRowContainer.addSubview(bath)
        bath.centerYAnchor.constraint(equalTo: secondRowContainer.centerYAnchor).isActive = true
        bath.anchor(top: nil, left: seperationDot2.rightAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
  
    
}
