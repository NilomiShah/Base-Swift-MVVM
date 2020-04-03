//
//  ViewController.swift
//  Swift+MVVM
//
//  Created by PCQ188 on 01/04/20.
//  Copyright © 2020 PCQ188. All rights reserved.
//

import UIKit

class HitsViewController: BaseViewController {
    
    var viewModel = HitsViewModel()
    @IBOutlet private weak var tableViewList: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup()  {
        setUpUI()
        setUpData()
    }
    
    private func setUpUI() {
        self.tableViewList.register(UINib(nibName: String(describing: HitsTableViewCell.self) , bundle: nil), forCellReuseIdentifier: String(describing: HitsTableViewCell.self))
        tableViewList.tableFooterView = UIView()
        setTitle()
    }
    
    private func setUpData() {
        viewModel.hitsApiCall({ (isSuccess) in
            self.tableViewList.reloadData()
        }, { (error) in
            self.showErrorAlert(error)
        })
    }
    
    private func setTitle() {
        self.title = self.viewModel.setTitle()
    }
}

//MARK: TableView Delegate and DataSource
extension HitsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.arrHits.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HitsTableViewCell.self), for: indexPath) as? HitsTableViewCell ?? HitsTableViewCell()
        cell.hit = self.viewModel.arrHits[indexPath.row]
        cell.switchClicked = {
            cell.switchToggle.isOn = self.viewModel.setSelected(indexPath.row)
            self.setTitle()
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hitsDetailViewController = UIStoryboard.main.hitsDetailViewController
        let viewModel = HitsDetailViewModel(title: self.viewModel.arrHits[indexPath.row].title ?? "", date: self.viewModel.arrHits[indexPath.row].createdAt ?? "")
        hitsDetailViewController.viewModel = viewModel
        self.navigationController?.pushViewController(hitsDetailViewController)
    }
    
}
