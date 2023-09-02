//
//  Model.swift
//  JSONTraineeApp
//
//  Created by Кирилл Шалеников on 02.09.2023.
//

struct Person: Decodable {
    let name: String?
    let status: String?
    let species: String?
    let gender: String?
    let id: Int?
}
