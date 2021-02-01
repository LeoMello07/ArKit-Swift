//
//  ViewController.swift
//  FreeArKit
//
//  Created by Leonardo Mello on 28/01/21.
//

import UIKit
import RealityKit
import ARKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!               // tela do ArKit que renderiza os objetos
    let iconBack = UIImage(named: "arrowBack")  // icone de seta
    let iconShare = UIImage(named: "shareIcon") // icone de compartilhar
    var popUpView = PopOverViewController()     // instância da classe do popOver
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // iniciando a câmera
        let config = ARFaceTrackingConfiguration()
        arView.session.run(config)
        
        // renderizando o objeto, no caso a função loadBlack é criada automaticamente pelo Experience. Qualquer .usdz que for colocado no reality composer o xcode ja cria a função pra renderizar.
        let blackShade = try! Experience.loadBlack()
        arView.scene.anchors.append(blackShade)
        
        buttons()
    }
    
    func buttons(){
        addToCart()
        backButton()
        shareButton()
    }
    
    //MARK: - Botões.
    
    // Botão para adicionar no carrinho
    func addToCart(){
        let button = UIButton()
        button.backgroundColor = UIColor(red: CGFloat(1), green: CGFloat(0.2), blue: CGFloat(0.4), alpha: CGFloat(1))
        button.frame = CGRect(x: 50, y: 800, width: 328, height: 42)
        button.setTitle("Adicionar ao carrinho", for: [])
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(popOver), for: .touchUpInside)
      
        arView.addSubview(button)
    }
    
    // Botao de seta para voltar a pagina anterior
    func backButton(){
        let button = UIButton()
        button.backgroundColor = UIColor.init(white: 1, alpha: 0)
        button.setImage(iconBack, for: [])
        button.imageView?.contentMode = .scaleAspectFit
        button.frame = CGRect(x: 16, y: 64, width: 54, height: 48)
        
        arView.addSubview(button)
    }
    
    // Botão para compartilhar.
    func shareButton(){
        let button = UIButton()
        button.frame = CGRect(x: 229, y: 750, width: 149, height: 29)
        button.backgroundColor = UIColor.init(white: 1, alpha: 0)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.setImage(iconShare, for: [])
        button.setTitle("Compartilhar", for: [])
        button.layer.cornerRadius = 6
        
        arView.addSubview(button)
    }
    
   //MARK: - Funções
    
    // Aqui é a ação que habilita o popOver onde mostra que foi adicionado ao carrinho, utilizando o @objc para ser compilado em objective C.
    @objc func popOver() {
        _ = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: false)
            popUpView = self.storyboard?.instantiateViewController(withIdentifier: "popOverViewController") as! PopOverViewController
            popUpView.view.frame = self.view.frame
        
            self.view.addSubview(popUpView.view)
    }
    
    // Apenas executa assim que o timer acabar com os 3 segundos colocados no timeInterval. E remove o popOver
    @objc func fireTimer() {
        popUpView.view.removeFromSuperview()
    }
}
