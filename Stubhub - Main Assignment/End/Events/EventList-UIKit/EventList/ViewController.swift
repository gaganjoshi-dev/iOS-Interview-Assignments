//
//  ViewController.swift
//  EventList
//
//

import UIKit

class ViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        // searchBar.delegate = self
        return searchBar
    }()
    
    
    let stackView = UIStackView()
    
    private var viewModel = EventListViewModel() {
        didSet {
            tableView.reloadData()
        }
    }
    
    struct Constants {
        static let EVENT_ROW_CELL_ID = "event_row_cell_identifier"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        setupView()
    }
    
    private func setupView() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        stackView.addArrangedSubview(searchBar)
        stackView.addArrangedSubview(tableView)
        
        view.addAutolayoutSubview(stackView)
        view.pinToEdges(stackView)
        
        searchBar.delegate = self
        
        tableView.register(EventRowCell.self, forCellReuseIdentifier: Constants.EVENT_ROW_CELL_ID)
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.delegate = self
        viewModel.loadEvents()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.EVENT_ROW_CELL_ID, for: indexPath) as! EventRowCell
        let event = viewModel.filteredEvents[indexPath.row]
        cell.event = event
        return cell
    }
}

// View Model Delegate
extension ViewController: EventListViewModelDelegate {
    func didUpdateEvents(_ sender: EventListViewModel) {
        viewModel = sender
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterEvents(with: searchText)
    }
}
