//
//  Topics.swift
//  VoicesAI
//
//  Created by MacBook Pro on 24/04/24.
//

import Foundation

enum Topics: String, CaseIterable, Identifiable {
    case persahabatan = "Persahabatan"
    case jokw = "Dark Joke"
    case motivasi = "Motivasi"
    case horor = "Horor"
    var id: Topics { self }
}

enum Mood: String, CaseIterable, Identifiable {
    case bahagia = "Bahagia"
    case sedih = "Sedih"
    var id: Mood { self }
}
