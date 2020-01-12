//
//  Result.swift
//  ApiParser
//
//  Created by Binshad on 12/11/18.
//  Copyright © 2018 Binshad. All rights reserved.
//

import Foundation

enum Result<T, U> where U: Error  {
    case success(T)
    case failure(U)
}
