//
//  main.swift
//  DecorationCakeSwift
//
//  Created by YutoMizutani on 2018/01/03.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import Foundation

enum DecorateType {
    case choco
    case cheese
}

class Main {
    func decorate(_ cake: Cake, decorationTypes: [DecorateType]) -> Cake {
        var resultCake = cake
        for decorationType in decorationTypes {
            /// ここでswitch文によって先に分岐処理してデコレートしておく。ここの処理は動的に行われる。
            switch decorationType {
            case .choco:
                resultCake = ChocoDecoration(resultCake)
            case .cheese:
                resultCake = CheeseDecoration(resultCake)
            }
        }
        return resultCake
    }

    init() {
        let cake = Cake(name: "ケーキ", numberOfDecoration: 0, appearance: "スポンジ")

        let chocoCake = ChocoDecoration(ChocoDecoration(ChocoDecoration(cake)))
        let cheeseCake = CheeseDecoration(CheeseDecoration(CheeseDecoration(cake)))

        let cheeseChocoCake = CheeseDecoration(ChocoDecoration(cake))
        let chocoCheeseCake = ChocoDecoration(CheeseDecoration(cake))

        let decorationCake = self.decorate(
            Cake(name: "オリジナルケーキ", numberOfDecoration: 0, appearance: "スポンジ"),
            // ここの配列に記述されたデコレーションを動的に追加していく。
            decorationTypes: [.cheese, .choco, .choco]
        )

        // デコレートしていない状態。
        cake.presentation()
        cake.taste()
        print()

        // デコレートしていないケーキにチョコまたはチーズをデコレート。
        chocoCake.presentation()
        chocoCake.taste()
        cheeseCake.presentation()
        cheeseCake.taste()
        print()

        // デコレートしていないケーキにチョコチーズまたはチーズチョコをデコレート。
        cheeseChocoCake.presentation()
        cheeseChocoCake.taste()
        chocoCheeseCake.presentation()
        chocoCheeseCake.taste()
        print()

        // デコレートしていないケーキにdecorationTypesの配列に記述したデコレーションを動的にデコレートしていく。
        decorationCake.presentation()
        decorationCake.taste()
    }
}

let _ = Main()
