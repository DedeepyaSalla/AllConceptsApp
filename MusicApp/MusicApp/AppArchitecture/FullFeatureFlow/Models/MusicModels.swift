//
//  MusicModels.swift
//  MusicApp
//
//  Created by dedeepya reddy salla on 26/04/23.
//

import Foundation

struct Post: Codable {
  let id: String
  let description: String?
  let user: PostUser
  let urls: PostUrls
}

struct PostUserProfileImage: Codable {
  let medium: String
}

struct PostUser: Codable {
  let profile_image: PostUserProfileImage
}

struct PostUrls: Codable {
  let regular: String
}


//
// MARK: - Track
//

/// Query service creates Track objects
class Track {
  //
  // MARK: - Constants
  //
  let artist: String
  let index: Int
  let name: String
  let previewURL: URL
  
  //
  // MARK: - Variables And Properties
  //
  var downloaded = false
  
  //
  // MARK: - Initialization
  //
  init(name: String, artist: String, previewURL: URL, index: Int) {
    self.name = name
    self.artist = artist
    self.previewURL = previewURL
    self.index = index
  }
}
