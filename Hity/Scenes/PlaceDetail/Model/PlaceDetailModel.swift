//
//  PlaceDetailModel.swift
//  Hity
//
//  Created by Ekrem Alkan on 5.02.2023.
//

import Foundation
import CoreLocation

// MARK: - Place
struct Place: Codable {
    let result: DetailResults?
    let status: String?
}

// MARK: - Result
struct DetailResults: Codable, FavoriteCellProtocol {
    
    
    let businessStatus: String?
    let currentOpeningHours: DetailCurrentOpeningHours?
    let delivery: Bool?
    let formattedAddress, formattedPhoneNumber: String?
    let geometry: DetailGeometry?
    let icon: String?
    let iconBackgroundColor: String?
    let iconMaskBaseURI: String?
    let internationalPhoneNumber, name: String?
    let photos: [DetailPhoto]?
    let placeID: String?
    let plusCode: DetailPlusCode?
    let priceLevel: Int?
    let rating: Double?
    let reference: String?
    let reviews: [DetailReview]?
    let takeout: Bool?
    let types: [String]?
    let url: String?
    let userRatingsTotal, utcOffset: Int?
    let vicinity: String?
    let website: String?
    let wheelchairAccessibleEntrance: Bool?
    
    var favoriteCellPlaceImage: String {
        if let photo = photos?[0].photoReference {
            return photo
        }
        return ""
    }
    
    var favoriteCellRating: String {
        if let rating = rating {
            return "\(rating)"
        }
        return ""
    }
    
    var favoriteCellPlaceName: String {
        if let name = name {
            return name
        }
        return ""
    }
    
    var favoriteCellAddress: String {
        if let address = formattedAddress {
            return address
        }
        return ""
    }
    
    var favoriteCellLocation: CLLocationCoordinate2D {
        if let lat = geometry?.location?.lat, let lng = geometry?.location?.lng {
            return CLLocationCoordinate2D(latitude: lat,longitude: lng)
        }
        return CLLocationCoordinate2D()
    }


    enum CodingKeys: String, CodingKey {
        case businessStatus = "business_status"
        case currentOpeningHours = "current_opening_hours"
        case delivery
        case formattedAddress = "formatted_address"
        case formattedPhoneNumber = "formatted_phone_number"
        case geometry, icon
        case iconBackgroundColor = "icon_background_color"
        case iconMaskBaseURI = "icon_mask_base_uri"
        case internationalPhoneNumber = "international_phone_number"
        case name, photos
        case placeID = "place_id"
        case plusCode = "plus_code"
        case priceLevel = "price_level"
        case rating, reference, reviews, takeout, types, url
        case userRatingsTotal = "user_ratings_total"
        case utcOffset = "utc_offset"
        case vicinity, website
        case wheelchairAccessibleEntrance = "wheelchair_accessible_entrance"
    }
}

// MARK: - CurrentOpeningHours
struct DetailCurrentOpeningHours: Codable {
    let openNow: Bool?
    let weekdayText: [String]?

    enum CodingKeys: String, CodingKey {
        case openNow = "open_now"
        case weekdayText = "weekday_text"
    }
}

// MARK: - Geometry
struct DetailGeometry: Codable {
    let location: DetailLocation?
}

// MARK: - Location
struct DetailLocation: Codable {
    let lat, lng: Double?
}

// MARK: - Photo
struct DetailPhoto: Codable {
    let height: Int?
    let photoReference: String?
    let width: Int?

    enum CodingKeys: String, CodingKey {
        case height
        case photoReference = "photo_reference"
        case width
    }
}

// MARK: - PlusCode
struct DetailPlusCode: Codable {
    let compoundCode, globalCode: String?

    enum CodingKeys: String, CodingKey {
        case compoundCode = "compound_code"
        case globalCode = "global_code"
    }
}

// MARK: - Review
struct DetailReview: Codable, ReviewsCellProtocol {
    
    let authorName: String?
    let authorURL: String?
    let language, originalLanguage: String?
    let profilePhotoURL: String?
    let rating: Int?
    let relativeTimeDescription, text: String?
    let time: Int?
    let translated: Bool?
    
    var image: String {
        if let profilePhotoURL = profilePhotoURL {
            return profilePhotoURL
        }
        return ""
    }
    
    var author: String {
        if let authorName = authorName {
            return authorName
        }
        return ""
    }
    
    var authorRating: String {
        if let rating = rating {
            return "\(rating)"
        }
        return ""
    }
    
    var relativeTime: String {
        if let relativeTimeDescription = relativeTimeDescription {
            return relativeTimeDescription
        }
        return ""
    }
    
    var authorText: String {
        if let text = text {
            return text
        }
        return ""
    }

    enum CodingKeys: String, CodingKey {
        case authorName = "author_name"
        case authorURL = "author_url"
        case language
        case originalLanguage = "original_language"
        case profilePhotoURL = "profile_photo_url"
        case rating
        case relativeTimeDescription = "relative_time_description"
        case text, time, translated
    }
}
