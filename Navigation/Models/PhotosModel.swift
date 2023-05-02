//
//  PhotosModel.swift
//  Navigation
//
//  Created by Мой Macbook on 02.05.2023.
//


import UIKit

struct PhotosModel {
    
    var image: String
    
    static func maketPhoto() -> [PhotosModel] {
        
        var photo = [PhotosModel]()
        photo.append(PhotosModel(image: "1"))
        photo.append(PhotosModel(image: "2"))
        photo.append(PhotosModel(image: "3"))
        photo.append(PhotosModel(image: "4"))
        photo.append(PhotosModel(image: "5"))
        photo.append(PhotosModel(image: "6"))
        photo.append(PhotosModel(image: "7"))
        photo.append(PhotosModel(image: "8"))
        photo.append(PhotosModel(image: "9"))
        photo.append(PhotosModel(image: "10"))
        photo.append(PhotosModel(image: "11"))
        photo.append(PhotosModel(image: "12"))
        photo.append(PhotosModel(image: "13"))
        photo.append(PhotosModel(image: "14"))
        photo.append(PhotosModel(image: "15"))
        photo.append(PhotosModel(image: "16"))
        photo.append(PhotosModel(image: "17"))
        photo.append(PhotosModel(image: "18"))
        photo.append(PhotosModel(image: "19"))
        photo.append(PhotosModel(image: "20"))
    
        return photo
    }
}
