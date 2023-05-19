//
//  ProfileViewModel.swift
//  ChatApp
//
//  Created by Adrian Derdaś on 19/05/2023.
//

import Foundation

enum ProfileViewModelType {
    case info, logout
}

struct ProfileViewModel {
    let viewModelType: ProfileViewModelType
    let title: String
    let handler: (() -> Void)?
}
