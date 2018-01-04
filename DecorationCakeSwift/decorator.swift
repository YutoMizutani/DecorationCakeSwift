//
//  decorator.swift
//  DecorationCakeSwift
//
//  Created by YutoMizutani on 2018/01/03.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import Foundation

class DecorationCake: Cake {
    /// デコレータ。
    /// - 定数はsuper.initにてselfにセットされる。
    /// - デコレート元の変数と関数を呼び出したい場合は，どこかで下のインスタンス(let cake)を明示的に呼び出してあげる必要がある。

    /// 引数に受け取ったデコレート元の「関数の」挙動を保持するためのCakeインスタンス。
    let cake: Cake

    init(_ cake: Cake) {
        self.cake = cake
        /// 定数はここでセットされるため，CakeをDecorationしたクラスでもデコレート元の定数は保持される。
        super.init(name: cake.name, numberOfDecoration: cake.numberOfDecoration, appearance: cake.appearance)
    }
}

class ChocoDecoration: DecorationCake {
    override init(_ cake: Cake) {
        super.init(cake)

        // オリジナルのトッピングを自身に追加していく。名称をチョコ◯◯にし，外観をチョコまみれにする。
        self.name = "チョコ" + cake.name
        self.numberOfDecoration += 1
        self.appearance = "チョコ"
    }

    /// overrideでCakeインスタンス(let cake)を返さないとデコレートされていた関数が消えてしまう。使用しない関数でもself.cake.func()を飛ばしてあげる必要がある。
    override func taste() {
        print("チョコのしっとり感")
        self.cake.taste()
    }
}

class CheeseDecoration: DecorationCake {
    override init(_ cake: Cake) {
        super.init(cake)

        // オリジナルのトッピングを自身に追加していく。名称をチーズ◯◯にし，外観をチーズまみれにする。
        self.name = "チーズ" + cake.name
        self.numberOfDecoration += 1
        self.appearance = "チーズ"
    }

    /// overrideでCakeインスタンス(let cake)を返さないとデコレートされていた関数が消えてしまう。使用しない関数でもself.cake.func()を飛ばしてあげる必要がある。
    override func taste() {
        print("チーズの濃厚感")
        self.cake.taste()
    }
}

