//
//  StackCalculator.swift
//  Swiftmulacion
//
//  Created by Fernando Martin Garcia Del Angel on 4/15/19.
//  Copyright © 2019 Fernando Martin Garcia Del Angel. All rights reserved.
//

import Foundation

class StackCalculator {
    /**
        Calcula el evento M/M/1 de teoria de colas
        - Parameters:
            - lambda: (Double) Tasa promedio de llegada
            - miu: (Double) Tasa promedio de servicio
        - Returns:
            - 𝜌: (Double) Tasa de utilización
            - Lq: (Double) Numero promedio de clientes en la cola
            - L: (Double) Numero promedio de clientes en el sistema
            - Wq: (Double) Numero esperado en la cola
            - W: (Double) Tiempo promedio en el sistema
    */
    
    static func mm1(_ lambda:Double,_ miu:Double) -> (Double,Double,Double,Double,Double){
        let ro = lambda / miu
        let Lq = (pow(lambda, 2))/(miu*(miu-lambda))
        let L = lambda / (miu - lambda)
        let Wq = lambda / miu*(miu-lambda)
        let W = 1 / (miu - lambda)
        
        return (ro,Lq,L,Wq,W)
    }
    
    static func mms(){
        
    }
    
    static func mmsk(){
        
    }
    
    static func mg1(){
        
    }
}
