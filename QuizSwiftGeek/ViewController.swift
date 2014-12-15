//
//  ViewController.swift
//  QuizSwiftGeek
//
//  Created by derdour ali on 18/10/2014.
//  Copyright (c) 2014 derdour ali. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let ecran = UIScreen.mainScreen();
        let rect = ecran.bounds;
        let v = MaVue(frame: rect);
        self.view = v;
        
        //updateMyView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    
}

