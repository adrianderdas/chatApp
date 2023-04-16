//
//  DatabaseManager.swift
//  ChatApp
//
//  Created by Adrian Derdaś on 30/03/2023.
//

import Foundation
import FirebaseDatabase


//Singleton

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()


}
    
// MARK: - Account Mgmt

extension DatabaseManager {
    
    public func userExists(with email: String,
                           completion: @escaping ((Bool) -> Void)) {
        
        
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")

        database.child(safeEmail).observeSingleEvent(of: .value, with:  { snapshot in
            guard snapshot.value as? String != nil else {
                completion(false)
                return
            }
            
            completion(true)
        })

    }
    
    /// Inserts new user to database
    public func insertUser(with user: ChatAppUser, completion: @escaping(Bool) -> Void) {
        database.child(user.safeEmail).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName
        ], withCompletionBlock: { error, _ in
            guard error == nil else {
                print("failed of write to database")
                completion(false)
                return
            }
            completion(true)
            
        })
    }
}


struct ChatAppUser {
    let firstName: String
    let lastName: String
    let emailAdress: String
    
    var safeEmail: String {
        var safeEmail = emailAdress.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
    var profilePictureFileName: String {
        //naidixo-gmail-com_profile_picture.png
        return "\(safeEmail)_profile_picture.png"
    }
}
    

