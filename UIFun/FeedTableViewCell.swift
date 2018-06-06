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
    
    var feedImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .red
        imageView.layer.shouldRasterize = true
        
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
        label.layer.shouldRasterize = true
        label.frame = label.frame.integral
   
        return label
    }()
    
    private var bottomViewContainer: UIView = {
        var view = UIView()
        view.backgroundColor = .green
        view.layer.shouldRasterize = true
        return view
    }()
    
    //bottomViewConainer subViews containers
    
    private var headContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        return view
    }()
    
    private var firstRowContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private var secondRowContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
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
    


   
    func setupViews(){
        
        
        
        addSubview(viewContainer)
        
        //viewContainer consist of two main views
        viewContainer.addSubview(feedImage)
        viewContainer.addSubview(bottomViewContainer)
        
        //FeedImage contain a city label subview
        feedImage.addSubview(city)

        //bottomViewContainer consist of 3 main views
        bottomViewContainer.addSubview(headContainer)
        bottomViewContainer.addSubview(firstRowContainer)
        bottomViewContainer.addSubview(secondRowContainer)
        
        //headerContainer consist of only 1 faceImage
        headContainer.addSubview(faceImage)
        
        //firstRowContainer consist of only 1 address
        firstRowContainer.addSubview(address)

        
        //secondRowContainer consist of 5 view parts
        secondRowContainer.addSubview(indicatorDot)
        secondRowContainer.addSubview(price)
        secondRowContainer.addSubview(seperationDot1)
        secondRowContainer.addSubview(bed)
        secondRowContainer.addSubview(seperationDot2)
        secondRowContainer.addSubview(bath)
        
         let leftPadding:CGFloat = 20
        
        viewContainer.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: leftPadding , paddingBottom: 20, paddingRight: 20, width: 0, height: 0)

        //viewContainer SubViewlayout
        feedImage.anchor(top: viewContainer.topAnchor, left: viewContainer.leftAnchor, bottom: viewContainer.bottomAnchor, right: viewContainer.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: bottomContainerHeight, paddingRight: 0, width: 0, height: 0)
        
        city.anchor(top: nil, left: nil, bottom: feedImage.bottomAnchor, right: feedImage.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 10, paddingRight: 30, width: 100, height: 0)
        
     
        bottomViewContainer.anchor(top: feedImage.bottomAnchor, left: leftAnchor, bottom: viewContainer.bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
        //bottomViewContainer Layout Model
        headContainer.anchor(top: bottomViewContainer.topAnchor, left: bottomViewContainer.leftAnchor, bottom: bottomViewContainer.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: leftPadding , paddingBottom: 0, paddingRight: 0, width: bottomContainerHeight, height: 0)
        firstRowContainer.anchor(top: bottomViewContainer.topAnchor, left: headContainer.rightAnchor, bottom: nil, right: bottomViewContainer.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: bottomContainerHeight/2)
        secondRowContainer.anchor(top: firstRowContainer.bottomAnchor, left: headContainer.rightAnchor, bottom: bottomViewContainer.bottomAnchor, right: bottomViewContainer.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
        //bottomViewContainer detail layout
        //faceImage.anchor(top: headContainer.topAnchor, left: headContainer.leftAnchor, bottom: headContainer.bottomAnchor, right: headContainer.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, width: 10, height: 10)
        
        //headContainer
        faceImage.anchorToCenter(x: headContainer.centerXAnchor, y: headContainer.centerYAnchor, offsetX: 0, offsetY: 0, width: bottomContainerHeight/2.5, height: bottomContainerHeight/2.5)
        
        //firstRowContainer
        address.anchor(top:firstRowContainer.topAnchor , left: firstRowContainer.leftAnchor, bottom: firstRowContainer.bottomAnchor, right: firstRowContainer.rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        //secondRowContainer

//        let stackView = UIStackView(arrangedSubviews: [indicatorDot,seperationDot,bed,seperationDotbath])
//            stackView.axis = .horizontal
//            stackView.spacing = 2
//            stackView.distribution = .fillProportionally
//
     
        //center all second rowContainer subviews
        indicatorDot.centerYAnchor.constraint(equalTo: secondRowContainer.centerYAnchor).isActive = true
        price.centerYAnchor.constraint(equalTo: secondRowContainer.centerYAnchor).isActive = true
        seperationDot1.centerYAnchor.constraint(equalTo: secondRowContainer.centerYAnchor).isActive = true
        bed.centerYAnchor.constraint(equalTo: secondRowContainer.centerYAnchor).isActive = true
        seperationDot2.centerYAnchor.constraint(equalTo: secondRowContainer.centerYAnchor).isActive = true
        bath.centerYAnchor.constraint(equalTo: secondRowContainer.centerYAnchor).isActive = true
        
       indicatorDot.anchor(top: nil, left: secondRowContainer.leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: indicatorDotRadius*2, height: indicatorDotRadius*2)
       price.anchor(top: nil, left: indicatorDot.rightAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        seperationDot1.anchor(top: nil, left: price.rightAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: seperationDotRadius*2, height: seperationDotRadius*2)
        bed.anchor(top: nil, left: seperationDot1.rightAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        seperationDot2.anchor(top: nil, left: bed.rightAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: seperationDotRadius*2, height: seperationDotRadius*2)
        bath.anchor(top: nil, left: seperationDot2.rightAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        

        
        
    }
    
  
    
}
