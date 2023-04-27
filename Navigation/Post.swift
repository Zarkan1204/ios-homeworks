//
//  Post.swift
//  Navigation
//
//  Created by Мой Macbook on 07.04.2023.
//

import UIKit

struct Post {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
    
    static func makeModel() -> [Post] {
        var postModel = [Post]()
        postModel.append(Post(author: "Mercedes-Benz", description: "Mercedes-Benz f1 team car 2023", image: "Mers", likes: 156, views: 983))
        postModel.append(Post(author: "Ferrari", description: "Ferrari f1 team car 2023", image: "Ferrari", likes: 34, views: 245))
        postModel.append(Post(author: "Aston-Martin", description: "Aston-Martin f1 team car 2023", image: "Aston", likes: 63, views: 473))
        postModel.append(Post(author: "Red Bull", description: "Red Bull f1 team car 2023", image: "RedBull", likes: 234, views: 1157))
        
        return postModel
    }
}
