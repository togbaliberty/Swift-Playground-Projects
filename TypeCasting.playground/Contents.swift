//: Playground - noun: a place where people can play

import UIKit

class MediaItem {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Music: MediaItem {
    var artist: String
    
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "John Rambo", director: "Sylvester Stallone"),
    Music(name: "Billy Jean", artist: "Michael Jackson"),
    Music(name: "Lollipop", artist: "Young Money")
]

var movieCount = 0
var musicCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Music {
        musicCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(musicCount) songs.")
