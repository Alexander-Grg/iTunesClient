//
//  StarRatingView.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 2023-07-19.
//

import Foundation
import UIKit

class StarRatingView: UIView {

    private var rating: Int = 0

    private let feedbackGenerator = UISelectionFeedbackGenerator()

    let starsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal

        return stackView
    }()

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createStarsImages()
        self.configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.createStarsImages()
        self.configureUI()
    }

    private func configureUI() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didSelectRate))
        starsStackView.addGestureRecognizer(tapGesture)
        self.backgroundColor = .white
        self.addSubview(starsStackView)

        starsStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        starsStackView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
        starsStackView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
        starsStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        starsStackView.heightAnchor.constraint(equalToConstant: Constants.starContainerHeight).isActive = true
    }

    private func createStarsImages() {
        for index in 1...Constants.starsCount {
            let star = makeStarIcon()
            star.tag = index
            starsStackView.addArrangedSubview(star)
        }
    }

    private func makeStarIcon() -> UIImageView {
        let imageView = UIImageView(image: UIImage(systemName: "star"),
                                    highlightedImage: UIImage(systemName: "star.fill"))
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        return imageView
    }

    @objc private func didSelectRate(gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: starsStackView)
        let starWidth = starsStackView.bounds.width / CGFloat(Constants.starsCount)
        let rate = Int(location.x / starWidth) + 1

        if rate != self.rating {
            feedbackGenerator.selectionChanged()
            self.rating = rate
        }

        starsStackView.arrangedSubviews.forEach { subview in
            guard let starImageView = subview as? UIImageView else {
                return
            }
            starImageView.isHighlighted = starImageView.tag <= rate
        }
    }

    private struct Constants {
        static let starsCount: Int = 5
        static let starContainerHeight: CGFloat = 40
    }
}
