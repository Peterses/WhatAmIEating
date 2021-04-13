//
//  MainView.swift
//  WhatAmIEating
//
//  Created by Peterses on 22/03/2021.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    
    func didChooseButtonClicked()
    func didAnalyzeButtonClicked()
    
}

class MainView: UIView {
    
    var delegate: MainViewDelegate?
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        imageView.layer.borderWidth = 0.1
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    private lazy var chooseImageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Choose image", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.systemGray, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var takePhotoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Take photo", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.systemGray, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var analyzeButton: UIButton = {
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
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4)
        ])
        imageView.image = UIImage(named: "uploadImage")
    }
    
    private func setButtonStackView() {
        buttonStackView.addArrangedSubview(chooseImageButton)
        buttonStackView.addArrangedSubview(takePhotoButton)
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            buttonStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            buttonStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20)
        ])
    }
    
    func setImage(image: UIImage) {
        imageView.image = image
    }
    
    private func setChooseButton() {
        chooseImageButton.addTarget(self, action: #selector(selectPhotoButton), for: .touchUpInside)
    }
    
    private func setAnalyzeButton() {
        analyzeButton.addTarget(self, action: #selector(analyzeImageButton), for: .touchUpInside)
    }
    
    private func setButton() {
        NSLayoutConstraint.activate([
            analyzeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            analyzeButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 100)
        ])
    }
    
    @objc private func selectPhotoButton() {
        self.delegate?.didChooseButtonClicked()
    }
    
    @objc private func analyzeImageButton() {
        self.delegate?.didAnalyzeButtonClicked()
    }
    
    private func addSubviews() {
        addSubview(imageView)
        addSubview(analyzeButton)
        addSubview(buttonStackView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGreen
        addSubviews()
        setImageView()
        setButton()
        setButtonStackView()
        setChooseButton()
        setAnalyzeButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
