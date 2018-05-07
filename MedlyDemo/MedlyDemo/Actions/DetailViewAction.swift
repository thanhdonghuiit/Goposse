//
//  DetailViewAction.swift
//  MedlyDemo
//
//  Created by Phan Thanh Dong on 5/4/18.
//  Copyright © 2018 Phan Thanh Dong. All rights reserved.
//

import UIKit

class DetailViewAction: BaseAction {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title  = "Approve Delivery"
        self.navigationController?.navigationBar.isTranslucent = false
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.setupViewHierarchy()
        self.configureConstraints()
        // Do any additional setup after loading the view.
    }
    
    private lazy var cardView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    private lazy var badgeImageView: UIImageView = {
        var imageView: UIImageView = UIImageView(image: #imageLiteral(resourceName: "rx_pill_vial"))
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 0.4
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.isHidden = false
        return imageView
    }()
    
    private lazy var messageLabel: UILabel = {
        var label: UILabel = UILabel()
        label.backgroundColor = Theme.Color.MainFeed.CardBackground
        label.text = "We've filled a new prescription for you. Please authorize delivery"
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textAlignment = NSTextAlignment.center
        label.textColor = Theme.Color.MainFeed.NotficationView.Title
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var dividerView1: UIView = {
        var view: UIView = UIView()
        view.backgroundColor = Theme.Color.MainFeed.NotficationView.ButtonLine
        return view
    }()
    private lazy var prescriptionLabel1: UILabel = {
        var label: UILabel = UILabel()
        label.backgroundColor = Theme.Color.MainFeed.CardBackground
        label.text = "BRIMONIDIN TARTRATE,  0.15%"
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        label.textColor = #colorLiteral(red: 0.2167952657, green: 0.8418976665, blue: 0.6942800879, alpha: 1)
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var dividerView2: UIView = {
        var view: UIView = UIView()
        view.backgroundColor = Theme.Color.MainFeed.NotficationView.ButtonLine
        return view
    }()
    
    private (set) lazy var button1: Button = {
        var button: Button = Button()
        //button.titleLabel.font = Theme.Font.Feed.Button1
        button.setTitle(title: "Cancel", forState: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        button.setTitleColor(color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), forState: UIControlState())
        return button
    }()
    
    private (set) lazy var button2: Button = {
        var button: Button = Button()
        button.setTitle(title: "Approve", forState: .normal)
        // button.titleLabel.font = Theme.Font.Feed.Button2
        button.backgroundColor = #colorLiteral(red: 0.1437493927, green: 0.6799889197, blue: 0.6040639335, alpha: 1)
        button.setTitleColor(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), forState: UIControlState())
        return button
    }()
    
    private lazy var quantityLabel: UILabel = {
        var label: UILabel = UILabel()
        label.backgroundColor = Theme.Color.MainFeed.DeliveryNotficationView.DateLabelBackground
        label.text = "QUANTITY: 12"
        label.font = UIFont(name: Theme.Font.App.Regular, size: Dimens.DateLabel.Font.Text)
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.numberOfLines = 1
        label.textAlignment = NSTextAlignment.left
        label.layer.cornerRadius = Dimens.DateLabel.CornerRadius
        label.clipsToBounds = true
        return label
    }()
    
    private lazy var formLabel: UILabel = {
        var label: UILabel = UILabel()
        label.backgroundColor = Theme.Color.MainFeed.DeliveryNotficationView.DateLabelBackground
        label.text = "FORM: OROPS"
        label.font = UIFont(name: Theme.Font.App.Regular, size: Dimens.DateLabel.Font.Text)
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.numberOfLines = 1
        label.textAlignment = NSTextAlignment.left
        label.layer.cornerRadius = Dimens.DateLabel.CornerRadius
        label.clipsToBounds = true
        return label
    }()
    
    private lazy var rxLabel: UILabel = {
        var label: UILabel = UILabel()
        label.backgroundColor = Theme.Color.MainFeed.DeliveryNotficationView.DateLabelBackground
        label.text = "RX #: 4848888-0"
        label.font = UIFont(name: Theme.Font.App.Regular, size: Dimens.DateLabel.Font.Text)
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.numberOfLines = 1
        label.textAlignment = NSTextAlignment.left
        label.layer.cornerRadius = Dimens.DateLabel.CornerRadius
        label.clipsToBounds = true
        return label
    }()
    
    private lazy var bottomView: UIView = {
        var view: UIView = UIView()
        return view
    }()
    
    private func setupViewHierarchy() {
        self.view.addSubview(cardView)
        cardView.addSubview(badgeImageView)
        cardView.addSubview(messageLabel)
        cardView.addSubview(dividerView1)
        cardView.addSubview(prescriptionLabel1)
        cardView.addSubview(quantityLabel)
        cardView.addSubview(formLabel)
        cardView.addSubview(rxLabel)
        cardView.addSubview(dividerView2)
        self.view.addSubview(bottomView)
        bottomView.addSubview(button1)
        bottomView.addSubview(button2)
        
        
    }
    
    private func configureConstraints() {
        cardView.snp.makeConstraints {  make in
            make.edges.equalTo(self.view).inset(UIEdgeInsets.init(top: 5, left: 5, bottom: 50, right: 5))
        }
        badgeImageView.snp.makeConstraints { make in
            make.top.equalTo(cardView.snp.top).inset(30)
            make.centerX.equalTo(cardView.snp.centerX)
            make.height.equalTo(70)
            make.width.equalTo(70)
        }
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(badgeImageView.snp.bottom).offset(10)
            make.left.equalTo(cardView.snp.left).offset(10)
            make.right.equalTo(cardView.snp.right).offset(10)
        }
        dividerView1.snp.makeConstraints { make in
            make.top.equalTo(messageLabel.snp.bottom).offset(15)
            make.left.equalTo(cardView.snp.left).inset(0)
            make.right.equalTo(cardView.snp.right).inset(0)
            make.height.equalTo(1)
        }
        prescriptionLabel1.snp.makeConstraints { make in
            make.top.equalTo(dividerView1.snp.bottom).offset(10.0)
            make.left.equalTo(cardView.snp.left).inset(10.0)
            make.right.equalTo(cardView.snp.right).inset(10.0)
        }
        quantityLabel.snp.makeConstraints { make in
            make.top.equalTo(prescriptionLabel1.snp.bottom).offset(10)
            make.left.equalTo(cardView.snp.left).inset(10.0)
            make.right.equalTo(cardView.snp.right).inset(10.0)
        }
        formLabel.snp.makeConstraints { make in
            make.top.equalTo(quantityLabel.snp.bottom).offset(5)
            make.left.equalTo(cardView.snp.left).inset(10.0)
            make.right.equalTo(cardView.snp.right).inset(10.0)
        }
        rxLabel.snp.makeConstraints { make in
            make.top.equalTo(formLabel.snp.bottom).offset(5)
            make.left.equalTo(cardView.snp.left).inset(10.0)
            make.right.equalTo(cardView.snp.right).inset(10.0)
        }
        
        dividerView2.snp.makeConstraints { make in
            make.top.equalTo(rxLabel.snp.bottom).offset(15)
            make.left.equalTo(cardView.snp.left).inset(0)
            make.right.equalTo(cardView.snp.right).inset(0)
            make.height.equalTo(1)
        }
        bottomView.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.snp.bottom).inset(0)
            make.left.equalTo(self.view.snp.left).inset(0)
            make.right.equalTo(self.view.snp.right).inset(0)
            make.height.equalTo(50)
        }
        button1.snp.makeConstraints { make in
            make.width.equalTo(button2.snp.width)
            make.left.equalTo(bottomView.snp.left).inset(1)
            make.right.equalTo(button2.snp.left).inset(1)
            make.top.equalTo(bottomView.snp.top).inset(0)
            make.bottom.equalTo(bottomView.snp.bottom).inset(0)
        }
        button2.snp.makeConstraints { make in
            make.right.equalTo(bottomView.snp.right).inset(1)
            make.height.equalTo(50)
            make.top.equalTo(bottomView.snp.top).inset(0)
            make.bottom.equalTo(bottomView.snp.bottom).inset(0)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

