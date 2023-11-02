//
//  ViewModelOutput.swift
//  ProtocolOrientedUIKit
//
//  Created by Berkay Sazak on 1.11.2023.
//

import Foundation

protocol UserViewModelOutput : AnyObject{
    
    func updateView (name : String, email:String, userName: String) 
}
