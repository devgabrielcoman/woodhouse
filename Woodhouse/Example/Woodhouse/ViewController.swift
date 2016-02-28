//
//  ViewController.swift
//  Woodhouse
//
//  Created by Gabriel Coman on 02/23/2016.
//  Copyright (c) 2016 Gabriel Coman. All rights reserved.
//

import UIKit

import Woodhouse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        LocuService.searchGeo(latitude: 32.792027350301, longitude: -79.8816662056433)
        LocuService.searchNameGeo(name: "T", latitude: 32.792027350301, longitude: -79.8816662056433)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

