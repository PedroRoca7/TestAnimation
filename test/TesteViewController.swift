//
//  TesteViewController.swift
//  test
//
//  Created by Pedro Henrique on 07/08/24.
//

import Foundation
import UIKit

final class TesteViewController: UIViewController {
        
    lazy var yesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sim", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }

    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           
           // Garanta que o layout da stack view está atualizado
           view.layoutIfNeeded()
           
           // Adicione a animação à borda do botão após o layout ser atualizado
           addBorderAnimation(to: yesButton)
       }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkClipboard()
    }
    
    func showToast(message: String) {
        lazy var container: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.clipsToBounds = true
            view.alpha = 1.0
            view.backgroundColor = .white
            view.layer.cornerRadius = 10
            return view
        }()
        
        lazy var stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.alignment = .center
            stackView.distribution = .fillProportionally
            stackView.axis = .horizontal
            stackView.isLayoutMarginsRelativeArrangement = true
            stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            stackView.spacing = 8
            return stackView
        }()
        
        self.view.addSubview(container)
        container.addSubview(stackView)
        
        lazy var iconImage: UIImageView = {
            let image = UIImageView()
            image.translatesAutoresizingMaskIntoConstraints = false
            image.image = UIImage(systemName: "car.fill")
            image.contentMode = .scaleAspectFit
            return image
        }()
        
        lazy var stackViewVertical: UIStackView = {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.alignment = .leading
            stackView.distribution = .fillProportionally
            stackView.axis = .vertical
            return stackView
        }()
        
        lazy var messageLabel: UILabel = {
            let label = UILabel()
            label.textColor = .gray
            label.text = "Chave Pix Copiada!"
            return label
        }()
        
        lazy var messageLabel2: UILabel = {
            let label = UILabel()
            label.textColor = .gray
            label.text = "Deseja fazer um pix?"
            return label
        }()
        

        
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            container.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            container.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -16),
            
            stackView.topAnchor.constraint(equalTo: container.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
        ])
        
        stackView.addArrangedSubview(iconImage)
        stackView.addArrangedSubview(stackViewVertical)
        stackViewVertical.addArrangedSubview(messageLabel)
        stackViewVertical.addArrangedSubview(messageLabel2)
        stackView.addArrangedSubview(yesButton)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                   // Animação para fazer a view desaparecer
                   UIView.animate(withDuration: 0.5, animations: {
                       container.alpha = 0.0 // Define a opacidade para 0 (invisível)
                   }) { _ in
                       container.removeFromSuperview() // Remove a view da hierarquia de views após a animação
                   }
               }
    }
    
    private func addBorderAnimation(to button: UIButton) {
        // Crie um CAShapeLayer para a borda
            let borderLayer = CAShapeLayer()
            borderLayer.frame = button.bounds
            borderLayer.path = UIBezierPath(roundedRect: button.bounds, cornerRadius: button.layer.cornerRadius).cgPath
            borderLayer.lineWidth = 2
            borderLayer.strokeColor = UIColor.blue.cgColor
            borderLayer.fillColor = UIColor.clear.cgColor
            borderLayer.strokeStart = 0
            borderLayer.strokeEnd = 1
            button.layer.addSublayer(borderLayer)
            
            // Crie uma animação básica para a linha da borda
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = 1
            animation.toValue = 0
            animation.duration = 8  // Duração de 5 segundos
            animation.fillMode = .forwards
            animation.isRemovedOnCompletion = false
            
            // Adicione a animação ao layer
            borderLayer.add(animation, forKey: "lineAnimation")
        
        
        
    }
    
    func checkClipboard() {
        showToast(message: "Chave pix copiada!")
    }
}
