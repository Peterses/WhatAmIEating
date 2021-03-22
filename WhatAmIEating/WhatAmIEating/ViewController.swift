//
//  ViewController.swift
//  WhatAmIEating
//
//  Created by Peterses on 18/03/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var mainView = MainView()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    func setImagePickerController(){
        print("pickercontroller")
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.mainView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension ViewController: MainViewDelegate {
    func didButtonClicked() {
        setImagePickerController()
    }
}

extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            setImagePickerController()
            mainView.setImage(image: image)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension ViewController: UINavigationControllerDelegate {
    
}
