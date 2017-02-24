//
//  ViewController.swift
//  rx
//
//  Created by Lova on 2017/2/24.
//  Copyright © 2017年 lova. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct User {
    enum Gender {
        case male
        case female
    }

    var name: Variable<String?> = Variable("")
    var email: Variable<String?> = Variable("")
    var gender: Variable<Gender> = Variable(.male)
    var image = Variable(UIImage())
}

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var btn: UIButton!

    let user = User()

    private let bag = DisposeBag()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindding()
    }
    
    func bindding() {
        user.name.asObservable().bindTo(label.rx.text).addDisposableTo(bag)
        user.name.asObservable().bindTo(field.rx.text).addDisposableTo(bag)
        user.name.asObservable().bindTo(field.rx.text).addDisposableTo(bag)
        
        field.rx.text.asObservable().subscribe(onNext: { string in
            self.user.name.value = string
        }).addDisposableTo(bag)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let c = segue.destination as? ViewController2 {
            c.user = user
        }
    }    
}


