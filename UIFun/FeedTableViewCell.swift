//
//  FeedTableViewCell.swift
//  UIFun
//
//  Created by eric yu on 6/5/18.
//  Copyright © 2018 eric yu. All rights reserved.
//

import UIKit


class FeedTabeViewCell:UITableViewCell{
    
    let bottomContainerHeight:CGFloat = 80
  
 
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
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 4
        view.clipsToBounds = true
        view.frame = view.frame.integral
        return view
    }()
    
    var feedImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.frame = imageView.frame.integral
        
        return imageView
    }()
    
    lazy var city: UILabel = {
        let label = UILabel()
        label.text = "Tahoe"
        label.textColor = .white
        label.layer.cornerRadius = 5
        label.backgroundColor = .gray
        label.clipsToBounds = true
        label.textAlignment = .center
        label.frame = label.frame.integral
   
        return label
    }()
    
    private var bottomViewContainer: UIView = {
        var view = UIView()
        view.backgroundColor = .green
        view.frame = view.frame.integral
        return view
    }()
    
    //bottomViewConainer subViews containers
    
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
    
    //bottomViewContainer subViews
    lazy var faceImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .white
        //(bottomContainerHeight/3) height and width of faceImage
        imageView.layer.cornerRadius = (bottomContainerHeight/2.5)/2
        imageView.clipsToBounds = true
        return imageView
    }()

    private var address: UILabel = {
        let label = UILabel()
        label.text = "5120 Black Diamond Way"
        label.font = UIFont.systemFont(ofSize: 20)
        label.frame = label.frame.integral
      
        return label
    }()
    
    let indicatorDotRadius:CGFloat = 2
    private lazy var indicatorDot: UIView = {
        var view = UIView()
        view.backgroundColor = .orange
        view.layer.cornerRadius = 2
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
    

    let leftPadding:CGFloat = 20
    func bottomLayer(){
        addSubview(shadowViewContainer)
        shadowViewContainer.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: leftPadding , paddingBottom: 20, paddingRight: 20, width: 0, height: 0)
    }
    func layoutLevel1(){
        addSubview(viewContainer)
        viewContainer.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: leftPadding , paddingBottom: 20, paddingRight: 20, width: 0, height: 0)
    }
    
    func layoutLevel2(){
        viewContainer.addSubview(feedImage)
        feedImage.anchor(top: viewContainer.topAnchor, left: viewContainer.leftAnchor, bottom: viewContainer.bottomAnchor, right: viewContainer.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: bottomContainerHeight, paddingRight: 0, width: 0, height: 0)
        
        viewContainer.addSubview(bottomViewContainer)
        bottomViewContainer.anchor(top: feedImage.bottomAnchor, left: leftAnchor, bottom: viewContainer.bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
    
    func layoutLevel3(){
        feedImage.addSubview(city)
        city.anchor(top: nil, left: nil, bottom: feedImage.bottomAnchor, right: feedImage.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 10, paddingRight: 30, width: 100, height: 0)
        
        bottomViewContainer.addSubview(headContainer)
        headContainer.anchor(top: bottomViewContainer.topAnchor, left: bottomViewContainer.leftAnchor, bottom: bottomViewContainer.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: leftPadding , paddingBottom: 0, paddingRight: 0, width: bottomContainerHeight, height: 0)
     
        bottomViewContainer.addSubview(firstRowContainer)
        firstRowContainer.anchor(top: bottomViewContainer.topAnchor, left: headContainer.rightAnchor, bottom: nil, right: bottomViewContainer.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: bottomContainerHeight/2)
        
        bottomViewContainer.addSubview(secondRowContainer)
        secondRowContainer.anchor(top: firstRowContainer.bottomAnchor, left: headContainer.rightAnchor, bottom: bottomViewContainer.bottomAnchor, right: bottomViewContainer.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)

    }

    func topLayer(){

        headContainer.addSubview(faceImage)
        faceImage.anchorToCenter(x: headContainer.centerXAnchor, y: headContainer.centerYAnchor, offsetX: 0, offsetY: 0, width: bottomContainerHeight/2.5, height: bottomContainerHeight/2.5)
       
        firstRowContainer.addSubview(address)
        address.anchor(top:firstRowContainer.topAnchor , left: firstRowContainer.leftAnchor, bottom: firstRowContainer.bottomAnchor, right: firstRowContainer.rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
 
        secondRowContainer.addSubview(indicatorDot)
        indicatorDot.centerYAnchor.constraint(equalTo: secondRowContainer.centerYAnchor).isActive = true
        indicatorDot.anchor(top: nil, left: secondRowContainer.leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: indicatorDotRadius*2, height: indicatorDotRadius*2)
        
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
