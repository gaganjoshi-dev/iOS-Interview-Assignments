//
//  EventRowView.swift
//  EventList
//
//

import UIKit

/// A simple view designed to show a single Event
class EventRowView: UIView {
    /// The current event shown in this row.
    var model: Event? {
        didSet {
            guard let event = model else { return }
            nameLabel.text = event.name
            cityLabel.text = event.city
            minPriceLabel.text = event.formattedPrice
        }
    }

    /// The name label matching the event name
    let nameLabel: UILabel = {
        let result = UILabel()
        result.font = .boldSystemFont(ofSize: 16)
        return result
    }()

    /// The city label matching the event city
    let cityLabel: UILabel = {
        let result = UILabel()
        return result
    }()

    /// The minimal price label matching the event `minPrice`
    let minPriceLabel: UILabel = {
        let result = UILabel()
        result.font = .systemFont(ofSize: 12)
        return result
    }()

    private let stackView: UIStackView = {
        let result = UIStackView()
        result.spacing = 4
        result.axis = .vertical
        return result
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    private func setupView() {
        for view in [nameLabel, cityLabel, minPriceLabel] {
            view.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(view)
        }
        addAutolayoutSubview(stackView)
        pinToEdges(stackView)
    }
}

extension EventRowView {
    /// A convenience initializer which configures the view with provided event
    convenience init(_ event: Event) {
        self.init(frame: .zero)
        self.model = event
    }
}


class EventRowCell: UITableViewCell {

    let eventView: EventRowView = {
        let view = EventRowView()
        return view
    }()

    var event: Event! {
        didSet {
            eventView.model = event
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    private func setupViews() {
        addAutolayoutSubview(eventView)

        NSLayoutConstraint.activate([
            eventView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            eventView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            eventView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            eventView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
}
