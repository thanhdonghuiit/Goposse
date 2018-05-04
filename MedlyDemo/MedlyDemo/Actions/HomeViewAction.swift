//
//  DemoViewControllerAction.swift
//  lindenwood
//
//  Created by Phan Thanh Dong on 5/3/18.
//  Copyright © 2018 Lindenwood. All rights reserved.
//

import UIKit

class HomeViewAction: BaseAction, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title  = "MEDLY"
        self.setupViewHierarchy()
        self.configureConstraints()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - View Hierarchy
    func setupViewHierarchy() {
        self.view.backgroundColor = #colorLiteral(red: 0.8209885955, green: 0.821634829, blue: 0.8407682776, alpha: 1)
        self.view.addSubview(demoTableView)
        self.view.addSubview(buttonContainerView)
        buttonContainerView.addSubview(messageButton)
        buttonContainerView.addSubview(callButton)
        buttonContainerView.addSubview(separatoContainerView)
        buttonContainerView.addSubview(messageIconView)
        buttonContainerView.addSubview(callIconView)
        
    }
    
    private lazy var demoTableView: HomeTableView = {
        let table: HomeTableView = HomeTableView(frame: CGRect.zero, style: UITableViewStyle.grouped)
        table.backgroundColor = UIColor.clear
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    private lazy var buttonContainerView: UIView = {
        var view: UIView = UIView()
        view.backgroundColor = Theme.Color.MainFeed.Background
        return view
    }()
    
    private lazy var separatoContainerView: UIView = {
        var view: UIView = UIView()
        view.backgroundColor = Colors.GrayDDDDDD
        return view
    }()
    
    private lazy var messageButton: HomeCallButton = {
        let button: HomeCallButton = HomeCallButton()
        button.setTitle(title: Strings.Buttons.TextMedly, forState: UIControlState())
        button.addTarget(self, action: #selector(didTapMessageButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var callButton: HomeCallButton = {
        let button: HomeCallButton = HomeCallButton()
        button.setTitle(title: Strings.Buttons.CallMedly, forState: UIControlState())
        button.addTarget(self, action: #selector(didTapCallButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var messageIconView: UIImageView = {
        var imageView: UIImageView = UIImageView(image:UIImage(named: MainFeedImages.PharmacyMessageIcon))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var callIconView: UIImageView = {
        var imageView: UIImageView = UIImageView(image:UIImage(named: MainFeedImages.PharmacyCallIcon))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    @objc
    fileprivate func didTapMessageButton(_ sender: AnyObject?) {
        
    }
    
    @objc
    fileprivate func didTapCallButton(_ sender: AnyObject?) {
        
    }
    
    // MARK: - View Layout
    func configureConstraints() {
        demoTableView.snp.makeConstraints { make in
            make.edges.equalTo(self.view).inset(UIEdgeInsets.init(top: 0, left: 0, bottom: 66, right: 0))
        }
        
        buttonContainerView.snp.remakeConstraints { (make) -> Void in
            make.left.right.equalTo(self.view)
            make.height.equalTo(Dimens.Button.StandardHeight)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        
        messageButton.snp.remakeConstraints { (make) -> Void in
            make.left.top.bottom.equalTo(buttonContainerView)
            make.width.equalTo(buttonContainerView).dividedBy(2)
        }
        
        callButton.snp.remakeConstraints { (make) -> Void in
            make.right.top.bottom.equalTo(buttonContainerView)
            make.width.equalTo(buttonContainerView).dividedBy(2)
        }
        
        separatoContainerView.snp.remakeConstraints { (make) -> Void in
            make.width.equalTo(2)
            make.height.equalTo(buttonContainerView).multipliedBy(0.6)
            make.center.equalTo(buttonContainerView)
        }
        
        messageIconView.snp.remakeConstraints {(make) -> Void in
            //make.width.height.equalTo(buttonContainerView).multipliedBy(0.4)
            make.left.equalTo(messageButton).offset(25)
            make.centerY.equalTo(buttonContainerView)
        }
        
        callIconView.snp.remakeConstraints {(make) -> Void in
            //make.width.height.equalTo(buttonContainerView).multipliedBy(0.4)
            make.left.equalTo(callButton).offset(25)
            make.centerY.equalTo(buttonContainerView)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: HomeHeaderView = HomeHeaderView(frame: CGRect.zero)
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoCellIdentifier", for: indexPath) as! HomeTableViewCell
        cell.setCallBack {
            self.finish(Constants.Action.HomeDetail)
        }
        return cell
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

