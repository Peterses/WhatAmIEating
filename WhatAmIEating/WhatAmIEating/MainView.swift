//
//  MainView.swift
//  WhatAmIEating
//
//  Created by Peterses on 22/03/2021.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    func didButtonClicked()
}


class MainView: UIView {
    
    var delegate: MainViewDelegate?
    
    @objc private func selectPhotoButton() {
        print("XD")
        self.delegate?.didButtonClicked()
    }

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Analyze image", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.systemGray, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private func setImageView() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5, constant: -20)
        ])
    }
    
    
    func setImage(image: UIImage) {
        imageView.image = image
    }
    
    private func setButton() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 100)
        ])
        button.addTarget(self, action: #selector(selectPhotoButton), for: .touchUpInside)
    }
    
    private func addSubviews() {
        addSubview(imageView)
        addSubview(button)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        setImageView()
        setButton()
        backgroundColor = .systemGreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
