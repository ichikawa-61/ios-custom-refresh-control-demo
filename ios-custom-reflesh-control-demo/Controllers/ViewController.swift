//
//  ViewController.swift
//  ios-custom-reflesh-control-demo
//
//  Created by Kushida　Eiji on 2017/05/15.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

import UIKit

private extension Selector {
    static let refreshItem = #selector(ViewController.refreshItem(sender:))
}

final class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var customRefreshControl: UIView!
    @IBOutlet weak var indicatorImageView: UIImageView!

    var items: [String] = ["Custom","Reflesh","Control"]
    var refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefreshControl()
        tableView.dataSource = self
        tableView.refreshControl = refreshControl
    }

    /// Refresh Controlを設定する
    func setupRefreshControl() {

        //default Refresh Control
        refreshControl.tintColor = UIColor.clear
        refreshControl.backgroundColor = UIColor.clear
        refreshControl.addTarget(self,
                                 action: .refreshItem,
                                 for: .valueChanged)

        // custom Refresh Control
        customRefreshControl.frame.size.width = self.view.frame.size.width
        customRefreshControl.frame.size.height = refreshControl.frame.size.height
        customRefreshControl.backgroundColor = UIColor.clear
        refreshControl.addSubview(customRefreshControl)
    }

    func refreshItem(sender: UIRefreshControl) {

        indicatorImageView.addRotationAnimation()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] _ in

            self?.indicatorImageView.removeRotateAnimation()
            self?.items.append("◆")
            self?.items.append("♡")
            self?.items.append("♣")
            self?.items.append("♤")
            self?.tableView.reloadData()
            self?.refreshControl.endRefreshing()
        }
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle,
                                  reuseIdentifier: "Cell")
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}
