//
//  StackCalculator.swift
//  Swiftmulacion
//
//  Created by Fernando Martin Garcia Del Angel on 4/15/19.
//  Copyright © 2019 Fernando Martin Garcia Del Angel. All rights reserved.
//

import Foundation

/**
    Calculadora de Simuladores de Pila
*/
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
        let Wq = Lq / lambda
        let W = L / lambda
        
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
    static func mms(_ lambda:Double,_ miu:Double,_ s:Int) -> (Double,Double,Double,Double,Double){
        let ro:Double = lambda / (Double(s) * miu)
        var total:Double = 0
        
        for i in stride(from: 0, to: s, by: 1) {
            let pot = pow(lambda/miu,Double(i))
            let nfac = self.factorial(factorialNumber: i)
            total += pot/nfac
        }
        
        let pots:Double = pow(lambda/miu,Double(s))
        let nfacs:Double = self.factorial(factorialNumber: s)
        let total2:Double = pots/Double(nfacs)
        let p0:Double = 1/(total + total2*1/(1-lambda/(Double(s)*miu)))
        
        let Lq:Double = (p0*pots*ro)/(nfacs * (1-ro) * (1-ro))
        let L:Double = Lq + (lambda/miu)
        let Wq:Double = Lq/lambda
        let W:Double = Wq + 1/miu
        
        return (ro,Lq,L,Wq,W)
    }

    /**
     Calcula el evento M/M/s/K de teoria de colas
     - Parameters:
        - lambda: (Double) Tasa promedio de llegada
        - miu: (Double) Tasa promedio de servicio
        - s: (Int) Numero de servidores en paralelo
        - k: (Int) Limite de personas en la cola
     - Returns:
        - 𝜌: (Double) Tasa de utilización
        - Lq: (Double) Numero promedio de clientes en la cola
        - L: (Double) Numero promedio de clientes en el sistema
        - Wq: (Double) Numero esperado en la cola
        - W: (Double) Tiempo promedio en el sistema
     */
    static func mmsk(_ lambda:Double,_ miu:Double,_ s:Int,_ k:Int) -> (Double,Double,Double,Double,Double){
        let ro:Double = lambda / (Double(s)*miu)
        var total:Double = 0
        
        for i in stride(from: 0, through: s, by: 1){
            let pot:Double = pow(lambda/miu,Double(i))
            let nFac:Double = StackCalculator.factorial(factorialNumber: i)
            total += pot/nFac
        }
        
        let pots:Double = pow(lambda/miu,Double(s))
        let nfacs:Double = StackCalculator.factorial(factorialNumber: s)
        let total2 = pots/nfacs
        
        var total3:Double = 0
        for i in stride(from: s+1, through: k, by: 1){
            let pot:Double = pow(ro,Double(i-s))
            total3 += pot
        }
        
        let p0:Double = 1 / (total + total2*total3)
        let potRo:Double = pow(ro,Double(k-s))
        let lq2:Double = 1 - potRo - Double(k-s)*potRo*(1-ro)
        let lq:Double = (p0*pots*ro)/(nfacs*(1-ro)*(1-ro))
        let Lq:Double = lq*lq2
        
        let lambdaE:Double = lambda*(1-StackCalculator.pCalculus(lambda, miu, p0, Double(s), Double(k)))
        let Wq:Double = Lq / lambdaE
        let W:Double = Wq + 1/miu
        let L: Double = lambdaE * W
    
        return (ro,Lq,L,Wq,W)
    }
    
    /**
     Calcula el evento M/G/1 de teoria de colas
     - Parameters:
        - lambda: (Double) Tasa promedio de llegada
        - miu: (Double) Tasa promedio de servicio
        - s: (Double) Desviacion Estandar
     - Returns:
        - 𝜌: (Double) Tasa de utilización
        - Lq: (Double) Numero promedio de clientes en la cola
        - L: (Double) Numero promedio de clientes en el sistema
        - Wq: (Double) Numero esperado en la cola
        - W: (Double) Tiempo promedio en el sistema
     */
    static func mg1(_ lambda:Double,_ miu:Double,_ s:Double) -> (Double,Double,Double,Double,Double){
        let ro:Double = lambda/miu
        let Lq:Double = (pow(lambda,2)*pow(s,2)+pow(ro,2)) / (2*(1-ro))
        let L:Double = ro + Lq
        let Wq:Double = Lq / lambda
        let W:Double = Wq + (1/miu)
        
        return (ro,Lq,L,Wq,W)
    }
    /**
     Calcula el evento M/D/1 de teoria de colas
     - Parameters:
        - lambda: (Double) Tasa promedio de llegada
        - miu: (Double) Tasa promedio de servicio
        - s: (Double) Desviacion Estandar
     - Returns:
        - 𝜌: (Double) Tasa de utilización
        - Lq: (Double) Numero promedio de clientes en la cola
        - L: (Double) Numero promedio de clientes en el sistema
        - Wq: (Double) Numero esperado en la cola
        - W: (Double) ’Tiempo promedio en el sistema
 
    */
    static func md1(_ lambda:Double,_ miu:Double) -> (Double,Double,Double,Double,Double) {
        let ro:Double = lambda/miu
        let Lq:Double = (pow(ro,2)) / (2*(1-ro))
        let L:Double = ro + Lq
        let Wq:Double = Lq / lambda
        let W:Double = Wq + (1/miu)
        
        return (ro,Lq,L,Wq,W)
    }
    
    /**
     Calcula el evento M/Ek/1 de teoria de colas
     - Parameters:
         - lambda: (Double) Tasa promedio de llegada
         - miu: (Double) Tasa promedio de servicio
         - s: (Double) Desviacion Estandar
         - k: (Double) Limite de la fila
     - Returns:
         - 𝜌: (Double) Tasa de utilización
         - Lq: (Double) Numero promedio de clientes en la cola
         - L: (Double) Numero promedio de clientes en el sistema
         - Wq: (Double) Numero esperado en la cola
         - W: (Double) ’Tiempo promedio en el sistema
     
     */
    static func mek1(_ lambda:Double,_ miu:Double,_ k:Double ) -> (Double,Double,Double,Double,Double){
        let ro:Double = lambda/miu
        let s:Double = (1 / sqrt(k)) * (1 / miu)
        let Lq:Double = (pow(lambda,2)*pow(Double(s),2)+pow(ro,2)) / (2*(1-ro))
        let Wq:Double = Lq / lambda
        let W:Double = Wq + (1/miu)
        let L:Double = lambda*W
        
        return (ro,Lq,L,Wq,W)
    }
    
    /**
     Calcula el factorial de un numero entero
     - Parameters:
     - factorialNumber: (Int) El numero a calcular
     - Returns: (Double) Numero factorial < 170!
     - Warning: Solo genera hasta factorial 170 o el limite de numeros dobles
     */
    static func factorial(factorialNumber: Int) -> Double {
        if factorialNumber == 0 {
            return 1
        }
        var a: Double = 1
        for i in 1...factorialNumber {
            a *= Double(i)
        }
        return a
    }
    
    /**
     Calculo del factor p
     - Parameters:
        - lambda: (Double) Tasa promedio de llegada
        - miu: (Double) Tasa promedio de servicio
        - p0: (Double) P sub cero
        - s: (Double) Numero de servidores en paralelo
        - k: (Double) Limite de personas en la cola
     - Returns: (Double) Factor p
 
    */
    static func pCalculus(_ lambda:Double,_ miu:Double,_ p0:Double,_ s:Double,_ k:Double) -> Double {
        var total:Double = 0
        var milm:Double = 0
        var tot: Double = 0
        let i:Double = k
        
        milm = pow(lambda/miu,i)
        if i < s {
            tot = milm / StackCalculator.factorial(factorialNumber: Int(i))
        } else if i >= s && i <= k {
            tot = milm / StackCalculator.factorial(factorialNumber: Int(s)) * pow(s,(i-s))
        }
        
        total += tot*p0
        return total
    }
    
}
