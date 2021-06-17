//
//  CustomTableVC.swift
//  TableViews
//
//  Created by RG on 6/15/21.
//

import UIKit

class CustomTableVC: UIViewController {
    
    private var cityState = [Int]()

    private let myTableView = UITableView()
    
    private var cityArray = ["Berlin", "Moscow", "Rio", "Tokyo", "Denver", "Helsinki", "Oslo", "Nairobi"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Custom Table View"
        
        view.addSubview(myTableView)
        setupTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myTableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: view.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }
}

extension CustomTableVC: UITableViewDataSource, UITableViewDelegate {
    
    private func setupTableView() {
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(CityCell.self, forCellReuseIdentifier: "CityCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cityArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityCell
        
        cell.setupCityCellWith(title: cityArray[indexPath.row], index: indexPath.row, and: (cityState.contains(indexPath.row) ? true : false))
        cell.myButton.addTarget(self, action: #selector(openCityDetails), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CityCell
        if !cityState.contains(indexPath.row) {
            cityState.append(indexPath.row)
            cell.animateCell(at: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myTableView.beginUpdates()
            cityArray.remove(at: indexPath.row)
            myTableView.deleteRows(at: [indexPath], with: .fade)
            myTableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    @objc private func openCityDetails(_ sender:UIButton) {
        navigationController?.pushViewController(WebViewController(search: cityArray[sender.tag]), animated: true)
    }
}
