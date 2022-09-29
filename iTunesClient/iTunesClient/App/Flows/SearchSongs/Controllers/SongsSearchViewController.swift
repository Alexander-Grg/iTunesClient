//
//  SongsSearchViewController.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 01.02.2022.
//

import UIKit

final class SongsSearchViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let presenter: SearchSongsViewOutput
    
    private let searchService = ITunesSearchService()
    
    private var searchSongsView: SearchSongsView {
        return self.view as! SearchSongsView
    }
    
    internal var searchResults = [ITunesSong]() {
        didSet {
            self.searchSongsView.tableView.isHidden = false
            self.searchSongsView.tableView.reloadData()
            self.searchSongsView.searchBar.resignFirstResponder()
        }
    }
    
    private struct Constants {
        static let reuseIdentifier = "reuseIdSongs"
    }
    
    // MARK: - Lifecycle
    
    init(presenter: SearchSongsViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = SearchSongsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.searchSongsView.searchBar.delegate = self
        self.searchSongsView.tableView.register(SongsCell.self, forCellReuseIdentifier: Constants.reuseIdentifier)
        self.searchSongsView.tableView.delegate = self
        self.searchSongsView.tableView.dataSource = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.throbber(show: false)
    }
}

// MARK: - UITableViewDataSource
extension SongsSearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath)
        guard let cell = dequeuedCell as? SongsCell else {
            return dequeuedCell
        }
        let songs = self.searchResults[indexPath.row]
        let cellModel = SongsCellModelFactory.cellModel(from: songs)
        cell.configure(with: cellModel)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SongsSearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let songs = searchResults[indexPath.row]
        self.presenter.viewDidSelectApp(songs)
    }
}

// MARK: - UISearchBarDelegate
extension SongsSearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else {
            searchBar.resignFirstResponder()
            return
        }
        if query.count == 0 {
            searchBar.resignFirstResponder()
            return
        }
        self.presenter.viewDidSearch(with: query)
    }
}

// MARK: - Input
extension SongsSearchViewController: SearchSongsViewInput {
    
    func showError(error: Error) {
        let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(actionOk)
        self.present(alert, animated: true, completion: nil)
    }
    func showNoResults() {
        self.searchSongsView.emptyResultView.isHidden = false
        self.searchResults = []
        self.searchSongsView.tableView.reloadData()
    }
    
    func hideNoResults() {
        self.searchSongsView.emptyResultView.isHidden = true
    }
    func throbber(show: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = show
    }
}
