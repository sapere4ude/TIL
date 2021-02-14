//
//  HomeViewController.swift
//  TodaysOutside
//
//  Created by sapere4ude on 2021/02/13.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var HamburgerBtn: UIButton!
    @IBOutlet weak var swipeBtn: UIButton!
    @IBOutlet weak var notificationBtn: UIButton!
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.topView.clipsToBounds = true
        cell.topView.layer.cornerRadius = 8
        cell.topView.backgroundColor = .systemGray5
        
        cell.bottomView.clipsToBounds = true
        cell.bottomView.layer.cornerRadius = 8
        cell.bottomView.backgroundColor = .systemGray5
        
        cell.selectionStyle = .none
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 400
//    }
}

