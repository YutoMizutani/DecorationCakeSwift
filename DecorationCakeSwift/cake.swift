//
//  cake.swift
//  DecorationCakeSwift
//
//  Created by YutoMizutani on 2018/01/04.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import Foundation

class Cake {
    /// ケーキの名称
    var name: String
    /// デコレーションの数
    var numberOfDecoration: Int
    /// 外観（一番外側の見た目; デコレーションした最後の要素）
    var appearance: String

    init(name: String, numberOfDecoration: Int, appearance: String) {
        self.name = name
        self.numberOfDecoration = numberOfDecoration
        self.appearance = appearance
    }

    /// 状態をprint()する関数
    func presentation() {
        print("名前: \(name), デコレーション数: \(numberOfDecoration), 外観: \(appearance)")
    }
    /// どんな味かをprint()する関数; デコレートされることで変化させられる関数。
    func taste() {
        print("素材の味")
    }
}
