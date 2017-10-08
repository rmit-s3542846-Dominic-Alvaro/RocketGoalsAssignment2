//
//  DesignableTextField.swift
//  Rocket Goals
//
//  Created by Dominic Alvaro on 25/08/2017.
//  Copyright © 2017 Dominic Alvaro. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableTextField: UITextField {

    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
    
        if let image = leftImage {
            leftViewMode = .always
            
            let imageView = UIImageView(frame: CGRect(x: 5, y: 0, width: 20, height: 20))
            imageView.image = image
            
            let view = UIView(frame:CGRect(x: 5, y: 0, width: 28, height: 20))
            view.addSubview(imageView)
            
            
            
            leftView = view
            
        }else {
            //image is nill
            leftViewMode = .never
        }
    }
    

}
