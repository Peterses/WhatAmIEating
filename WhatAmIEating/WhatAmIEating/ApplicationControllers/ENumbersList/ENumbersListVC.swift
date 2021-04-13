//
//  ENumbersListViewController.swift
//  WhatAmIEating
//
//  Created by Peterses on 12/04/2021.
//

import UIKit

class ENumbersListVC: UIViewController {

    private var eNumbersView = ENumbersListView()
    
    override func loadView() {
        view = eNumbersView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
