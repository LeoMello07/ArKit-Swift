//
//  PopOverViewController.swift
//  FreeArKit
//
//  Created by Leonardo Mello on 28/01/21.
//

import UIKit

class PopOverViewController: UIViewController {

    @IBOutlet weak var addCartLabel: UILabel!
    @IBOutlet weak var seeCartButton: UIButton!
    @IBOutlet weak var container: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAnimate()
        
        //Retangulo atras de popOver
        container.backgroundColor = UIColor(red: CGFloat(0.91), green: CGFloat(0.91), blue: CGFloat(0.91), alpha: CGFloat(1))
        
        //Botão VER CARRINHOS. Aconselho depois para fazer as ações dele, criar um método específico.
        seeCartButton.tintColor = UIColor(red: CGFloat(1), green: CGFloat(0.1), blue: CGFloat(0.32), alpha: CGFloat(1))
    }
    
    func showAnimate(){
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
   

 

}
