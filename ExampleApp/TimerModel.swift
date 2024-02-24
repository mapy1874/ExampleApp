//
//  TimerModel.swift
//  DocumentExample
//
//  Created by Patrick Ma on 12/13/23.
//

import Foundation

class TimerModel {
    static func start() {
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            print("hello")
        }
    }

    static func taskWrappedStart() {
        Task {
            let timer = DispatchSource.makeTimerSource(flags: [], queue: .main)

            timer.schedule(deadline: .now(), repeating: 1.0, leeway: .milliseconds(1))

            timer.setEventHandler { 
                print("task wrapped hello")
            }

            timer.resume()
        }
    }
}
