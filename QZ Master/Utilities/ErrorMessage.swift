//
//  ErrorMessage.swift
//  FitMom
//
//  Created by Alexandru Vorojbit on 8/5/20.
//  Copyright © 2020 Alexandru Vorojbit. All rights reserved.
//

import Foundation

enum ErrorMessage: String, Error {
    case unableToDownload   = "Unable to download the data. Please check your internet connection."
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data received from the server was invalid. Please try again."
}
