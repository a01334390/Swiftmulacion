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
    
    func mm1(_ lambda:Double,_ miu:Double) -> (Double,Double,Double,Double,Double){
        let ro = lambda / miu
        let Lq = (pow(lambda, 2))/(miu*(miu-lambda))
        let L = lambda / (miu - lambda)
        let Wq = lambda / miu*(miu-lambda)
        let W = 1 / (miu - lambda)
        
        return (ro,Lq,L,Wq,W)
    }
    
    /**
     Calcula el evento M/M/s de teoria de colas
     - Parameters:
        - lambda: (Double) Tasa promedio de llegada
        - miu: (Double) Tasa promedio de servicio
        - s: (Int) Numero de servidores en paralelo
     - Returns:
        - 𝜌: (Double) Tasa de utilización
        - Lq: (Double) Numero promedio de clientes en la cola
        - L: (Double) Numero promedio de clientes en el sistema
        - Wq: (Double) Numero esperado en la cola
        - W: (Double) Tiempo promedio en el sistema
     */
    func mms(_ lambda:Double,_ miu:Double,_ s:Int) -> (Double,Double,Double,Double,Double){
        let ro:Double = lambda / (Double(s) * miu)
        var total:Double = 0
        
        for i in stride(from: 0, to: s, by: 1) {
            let pot = pow(lambda/miu,Double(i))
            let nfac = factorial(factorialNumber: i)
            total += pot/Double(nfac)
        }
        
        let pots:Double = pow(lambda/miu,Double(s))
        let nfacs:Int = factorial(factorialNumber: s)
        let total2:Double = pots/Double(nfacs)
        let p0:Double = 1/(total + total2*1/(1-lambda/(Double(s)*miu)))
        
        let Lq:Double = (p0*pots*ro)/(Double(nfacs) * (1-ro) * (1-ro))
        let L:Double = Lq + (lambda/miu)
        let Wq:Double = Lq/lambda
        let W:Double = Wq + 1/miu
        
        return (ro,Lq,L,Wq,W)
    }
    
    /**
        Calcula el factorial de un numero entero
        - Parameters:
            - factorialNumber: (Int) El numero a calcular
        - Returns: (Int) Numero factorial < 20!
        - Warning: Solo genera hasta factorial 20 o el limite de numeros enteros
    */
    private func factorial(factorialNumber: Int) -> Int {
        if factorialNumber == 0 {
            return 1
        } else {
            return factorialNumber * factorial(factorialNumber: factorialNumber - 1)
        }
    }

    
    static func mmsk(){
        
    }
    
    static func mg1(){
        
    }
}
