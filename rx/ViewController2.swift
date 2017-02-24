//
//  ViewController2.swift
//  rx
//
//  Created by Lova on 2017/2/24.
//  Copyright © 2017年 precaster. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class ViewController2: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!

    private let bag = DisposeBag()
    
    var user:User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }

    func bind() {
        guard let user = user else {
            return
        }

        user.name.asObservable().bindTo(nameField.rx.text).addDisposableTo(bag)
        nameField.rx.text.asObservable().bindTo(user.name).addDisposableTo(bag)
    }
}
