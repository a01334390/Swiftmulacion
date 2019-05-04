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
            - n: (Int) El estado del sistema
        - Returns:
            - 𝜌: (Double) Tasa de utilización
            - Lq: (Double) Numero promedio de clientes en la cola
            - L: (Double) Numero promedio de clientes en el sistema
            - Wq: (Double) Numero esperado en la cola
            - W: (Double) Tiempo promedio en el sistema
            - p0: (Double) El valor de p subcero
            - Pn: (Double) El valor de p sub-ene
    */
    
    static func mm1(_ lambda:Double,_ miu:Double,_ n:Int) -> (Double,Double,Double,Double,Double,Double,Double){
        let ro = lambda / miu
        let Lq = (pow(lambda, 2))/(miu*(miu-lambda))
        let L = lambda / (miu - lambda)
        let Wq = Lq / lambda
        let W = L / lambda
        
        /** Extras **/
        let p0 = 1 - ro
        let pn = (1 - ro) * pow(ro,Double(n))
        
        return (ro,Lq,L,Wq,W,p0,pn)
    }
    
    /**
     Calcula el evento M/M/s de teoria de colas
     - Parameters:
        - lambda: (Double) Tasa promedio de llegada
        - miu: (Double) Tasa promedio de servicio
        - s: (Int) Numero de servidores en paralelo
        - n: (Int) El estado del sistema
     - Returns:
        - 𝜌: (Double) Tasa de utilización
        - Lq: (Double) Numero promedio de clientes en la cola
        - L: (Double) Numero promedio de clientes en el sistema
        - Wq: (Double) Numero esperado en la cola
        - W: (Double) Tiempo promedio en el sistema
        - p0: (Double) El valor de p subcero
        - Pn: (Double) El valor de p sub-ene
     */
    static func mms(_ lambda:Double,_ miu:Double,_ s:Int, _ n:Int) -> (Double,Double,Double,Double,Double,Double,Double){
        let ro:Double = lambda / (Double(s) * miu)
        let r:Double = lambda / miu
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
        
        var pn:Double = 0
        if n >= 0 && n < s {
            pn = (pow(r,Double(n))) / StackCalculator.factorial(factorialNumber: n)*p0
        } else {
            pn = (pow(r,Double(n))) / (StackCalculator.factorial(factorialNumber: n)*(pow(Double(s),Double(n-s))))*p0
        }
        
        return (ro,Lq,L,Wq,W,p0,pn)
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
        let r:Double = lambda / miu
        var lambdaP:Double?
        var Pk:Double?
        var po:Double = 0
        var Lq:Double?
        var L:Double?
        var W:Double?
        var Wq:Double?

        for i in stride(from: 0, to: s+1, by: 1) {
            po += pow(r,Double(i)) / StackCalculator.factorial(factorialNumber: i)
        }

        var po2 = 0.0
        for x in stride(from: s+1, to: k+1, by: 1) {
            po2 += pow(ro,Double(x-s))
        }

        po += (pow(r,Double(s)) / StackCalculator.factorial(factorialNumber: s)) * po2
        po = 1 / po

        if ro != 1 {
            let numlq1 = po * pow(Double(s)*ro,Double(s)) * ro
            let n1 = 1.0 - pow(ro,Double(k-s))
            let n2 = Double((k - s)) * pow(ro, Double(k - s))
            let num =  numlq1 * (n1 - n2*(1 - ro))
            let denom = StackCalculator.factorial(factorialNumber: s) * pow(1-ro,2)
            Lq =  num / denom
        } else {
            Lq = po * pow(Double(s),Double(s)) * Double(k-s) * Double(k - s) / (2 * StackCalculator.factorial(factorialNumber: s))
        }

        for i in stride(from: 0, to: s, by: 1){
            L = Double((s - i)) * pow(ro * Double(s),Double(i)) / StackCalculator.factorial(factorialNumber: i)
            L = L! * -po
            L = L! + Lq! + Double(s)
        }

        if k == 0 {
            Pk = po
        } else if 1 <= k && k <= s {
            Pk = pow(r,Double(k)) * po / StackCalculator.factorial(factorialNumber: k)
        } else {
            Pk = pow(r,Double(k)) * po / StackCalculator.factorial(factorialNumber: s) * pow(Double(s), Double(k - s))
        }

        lambdaP = lambda * (1 - Pk!)
        W = L! / lambdaP!
        Wq = W! - 1 / miu


        return (ro,Lq!,L!,Wq!,W!)
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
        let Wq:Double = (pow(ro,2) / (2*lambda*(1-ro)))
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
        let Lq:Double = ((1 + k)/2*k)*((pow(lambda,2))/(miu*(miu-lambda)))
        let Wq:Double = ((1 + k)/2*k)*(lambda/(miu*(miu-lambda)))
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
    
}
