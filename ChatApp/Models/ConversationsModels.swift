//
//  ConversationsModels.swift
//  ChatApp
//
//  Created by Adrian Derdaś on 19/05/2023.
//

import Foundation

struct Conversation {
    let id: String
    let name: String
    let otherUserEmail: String
    let latestMessage: LatestMessage
}

struct LatestMessage {
    let date: String
    let text: String
    let isRead: Bool
}
