//
//  MiscNodes.swift
//  VPL
//
//  Created by Nathan Flurry on 3/28/18.
//  Copyright © 2018 Nathan Flurry. All rights reserved.
//

import UIKit
public class PrintNode: DisplayableNode {
    public static let shortcutCharacter: String? = "P"
    
    public static let id: String = "print"
    public static let name: String = "Print"
    public let inputTrigger: InputTrigger? = InputTrigger()
    public let inputValues: [InputValue] = [InputValue(id: "value", name: "Value", type: .unknown)]
    public let output: NodeOutput = .triggers([OutputTrigger()])
    
    public required init() {
        self.setupConnections()
    }
    
    public func assemble() -> String {
        var out = ""
        out !+= "print(\(inputValues[0].assemble()))"
        return out + assembleOutputTrigger()
    }
}
public class SwapNode: DisplayableNode {
    public static let id: String = "swap"
    public static let name: String = "Swap"
    public let inputTrigger: InputTrigger? = InputTrigger()
    public let inputVariables: [InputVariable] = [InputVariable(id: "a", name: "A", type: .unknown), InputVariable(id: "b", name: "B", type: .unknown)]
    public let output: NodeOutput = .triggers([OutputTrigger()])
    
    public required init() {
        self.setupConnections()
    }
    
    public func assemble() -> String {
        let tmpVariableId = NodeVariable.variableId
        var out = ""
        out !+= "let \(tmpVariableId) = \(inputVariables[0].target?.id ?? "NO VARIABLE SELECTED")"
        out !+= "\(inputVariables[0].target?.id ?? "NO VARIABLE SELECTED") = \(inputVariables[1].target?.id ?? "NO VARIABLE SELECTED")"
        out !+= "\(inputVariables[1].target?.id ?? "NO VARIABLE SELECTED") = \(tmpVariableId)"
        return out + assembleOutputTrigger()
    }
}