//
//  ViewController.swift
//  NewsApiMVVM
//
//  Created by Александр Воробей on 23.11.2021.
//

import UIKit
import SafariServices

class NewsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private  var viewModel: NewsListViewModelProtocol! {
        didSet {
            viewModel.getNews { [weak self] in
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = NewsListViewModel()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 350
        tableView.register(UINib(nibName: NewsTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: NewsTableViewCell.identifier)
    }
}

extension NewsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as! NewsTableViewCell
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let news = viewModel.news[indexPath.row]
        guard let url = URL(string: news.url ?? "") else { return }
        
        let config = SFSafariViewController.Configuration()
        let safariVC = SFSafariViewController(url: url, configuration: config)
        safariVC.modalPresentationStyle = .fullScreen
        present(safariVC, animated: true)
    }
    
}
