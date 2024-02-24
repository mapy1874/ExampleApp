//
//  LeakedClass.swift
//  ExampleApp
//
//  Created by Patrick Ma on 2/23/24.
//

import Combine
import Foundation

class LeakedClass: ObservableObject {
    @Published var state = "initial state"
    @Published var counter = 0

    init() {
        bootstrap()
    }

    private func bootstrap() {
        Just(10)
            .combineLatest($counter)
            .map { counter, value in self.updatedState(counter, value) }
            .receive(on: DispatchQueue.main)
            .assign(to: &$state)
    }

    private func updatedState(_: Int, _ val2: Int) -> String {
        print("LeakedClass: current state \(val2)")

        let res = "LeakedClass: updated state \(val2)"
        return res
    }

    deinit {
        print("LeakedClass deinitialized")
    }
}

class NonLeakedClass: ObservableObject {
    @Published var state = "initial state"
    @Published var counter = 0 // Counter as a published property

    init() {
        bootstrap()
    }

    private func bootstrap() {
        Just(10)
            .combineLatest($counter)
            .map { [weak self] counter, value in self?.updatedState(counter, value) ?? "aba" }
            .receive(on: DispatchQueue.main)
            .assign(to: &$state)
    }

    private func updatedState(_: Int, _ val2: Int) -> String {
        print("NonLeakedClass: current state \(val2)")

        return "NonLeakedClass: updated state \(val2)"
    }

    deinit {
        print("NonLeakedClass deinitialized")
    }
}
