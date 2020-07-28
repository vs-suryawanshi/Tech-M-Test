//
//  ViewController.swift
//  Tech-M-Test1
//
//  Created by Apps on 26/07/20.
//  Copyright © 2020 Vikramaditya. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    //Initialising ViewModel
    
    var viewModel = ViewModel()
    
    //Initialising TableView
    var listTableView = UITableView()
    
    var safeArea: UILayoutGuide!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        safeArea = view.layoutMarginsGuide
        //Setting Delegate and Datasource of table view
        self.view.backgroundColor = UIColor.white
        listTableView.frame = self.view.frame
        listTableView.delegate = self
        listTableView.dataSource = self
        //Adding table view on the view
        

        setupNavigationBar()
        //setupLabel()
    
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         setupLabel()
         self.listTableView.isHidden = true
         
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.performWithoutAnimation {
            listTableView.beginUpdates()
            listTableView.endUpdates()
        }
        setupTableView()
        getFacts()
    }
    
    
    func setupTableView() {
        
        self.view.addSubview(listTableView)
        self.listTableView.register(FactTableViewCell.self, forCellReuseIdentifier: "cell")
        self.listTableView.rowHeight = UITableView.automaticDimension
        self.listTableView.estimatedRowHeight = 20

    }
    
    func setupNavigationBar() {
        let refreshbutton = UIButton(type: UIButton.ButtonType.custom)
        refreshbutton.setImage(UIImage(named: "refreshIcon"), for: .normal)
        refreshbutton.addTarget(self, action:#selector(refreshAction), for: .touchUpInside)
        refreshbutton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        let barButton = UIBarButtonItem(customView: refreshbutton)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    func setupLabel()  {
        let headingLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 35))
        headingLabel.textAlignment = .center
        headingLabel.text = "Loading..."
        headingLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 32)
        headingLabel.textColor = UIColor.black
        headingLabel.center = self.view.center
        self.view.addSubview(headingLabel)
    }
    
    @objc func refreshAction(){
         getFacts()
    }
    
    func getFacts() {
        
        viewModel.getfactsFromApi { (success) in
            self.navigationController?.navigationBar.topItem?.title  = success.title
            if success.rows.count > 0 {
                self.listTableView.isHidden = false
                self.listTableView.reloadData()
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
   
    func numberOfSections(in tableView: UITableView) -> Int {
         return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.factModel?.rows.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
        let cell = self.listTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FactTableViewCell
        cell.titleLabel.text = viewModel.factModel?.rows[indexPath.row].title ?? "null"
        cell.detailLabel.text = viewModel.factModel?.rows[indexPath.row].description ?? "null"
        cell.image_View.contentMode = .scaleAspectFit
        cell.image_View.backgroundColor = .black
      //  cell.image_View.sd_setImage(with: URL(string: viewModel.factModel?.rows[indexPath.row].imageHref ?? ""), completed: nil)
        
        cell.image_View.sd_setImage(with: URL(string: viewModel.factModel?.rows[indexPath.row].imageHref ?? "")) { (image, error, cache, urls) in
                    if (error == nil) {
                        cell.image_View.image = image;
                        DispatchQueue.main.async { //UPDATED PART OF CODE STARTS HERE
                                                      //self.listTableView.reloadData()
                                           } //UP
                    }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Remove seperator inset
        if cell.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            cell.separatorInset = .zero
        }
    }

}





