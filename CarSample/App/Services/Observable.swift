//
//  ReactiveProtocol.swift
//  CarSample
//
//  Created by Admin on 1/17/19.
//  Copyright © 2019 Arash. All rights reserved.
//

import Foundation

//MARK: -
class Observable<T>{
    
    typealias DidSet = (_ newValue:T) -> Void
    typealias Observer = DidSet
    
    var observers = Dictionary<String,Observer>()
    
    var value: T! {
        didSet{
            for (identifier,_) in observers {
                
                guard let selectedObserver = observers[identifier] else { return }
                selectedObserver(value)
                
            }
        }
    }
    
    func addObserver(identifier:String, observer:@escaping Observer){
        observers[identifier] = observer
    }
    
    func removeObserver(identifer:String){
        observers.removeValue(forKey: identifer)
    }
    
    init(initialValue: T?){
        value = initialValue
    }
}
