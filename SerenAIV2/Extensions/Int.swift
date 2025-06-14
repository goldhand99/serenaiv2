//
//  Int.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 27.04.2025.
//

import Foundation

extension Int {
    func modulo(_ n: Int) -> Int {
        let r = self % n
        return r >= 0 ? r : r + n
    }
}
