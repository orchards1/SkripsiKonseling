//
//  Posts.swift
//  SkripsiKonseling
//
//  Created by Michael Louis on 22/03/20.
//  Copyright © 2020 Michael Louis. All rights reserved.
//

import Foundation

class Posts
{
    var key: String
    var name: String
    var texts: String
    var userId: Int
    var postId: Int
    
    init(Dictionary: [String: AnyObject], key: String)
    {
        self.key = key
        self.name = Dictionary["name"] as! String
        self.texts = Dictionary["texts"] as! String
        self.userId = Dictionary["userId"] as! Int
        self.postId = Dictionary["postId"] as! Int
    }
    
}
