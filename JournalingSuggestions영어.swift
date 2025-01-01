// MARK: - 영어 원문
import CoreLocation
import Foundation
import HealthKit
import Photos
import SwiftUI
import UIKit
import _Concurrency
import _StringProcessing
import _SwiftConcurrencyShims
import os

/// High-level information about a suggestion that a person chooses in the journaling suggestions picker.
///
/// When a person chooses a particular suggestion in the ``JournalingSuggestionsPicker``,
/// the system provides your app with more information about the event by passing
/// an instance of this structure to your picker's `onCompletion` handler.
@available(iOS 17.2, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
public struct JournalingSuggestion : Equatable, Hashable {

    /// A suggestion that describes a workout that a person completed.
    ///
    /// The system provides an instance of this structure to your app when a person chooses a workout
    /// suggestion in the ``JournalingSuggestionsPicker``.
    @available(iOS 17.2, *)
    public struct Workout : JournalingSuggestionAsset {

        /// Information about a workout that a person completes.
        ///
        /// Each ``JournalingSuggestion/Workout`` contains an instance of this structure with its ``JournalingSuggestion/Workout/details`` property.
        public struct Details : JournalingSuggestionAsset {

            /// The type of workout.
            public var activityType: HKWorkoutActivityType

            /// The energy that a person burns during the workout.
            public var activeEnergyBurned: HKQuantity?

            /// The distance that the workout spans.
            public var distance: HKQuantity?

            /// The average heart rate that a person experiences during the workout.
            public var averageHeartRate: HKQuantity?

            /// The range of time in which the workout takes place.
            public var date: DateInterval?

            /// Represents a generic content type for journaling suggestions.
            @available(iOS 17.2, *)
            @available(tvOS, unavailable)
            @available(watchOS, unavailable)
            @available(macOS, unavailable)
            public typealias JournalingSuggestionContent = JournalingSuggestion.Workout.Details
        }

        /// A structure that contains the workout specifics.
        public var details: JournalingSuggestion.Workout.Details?

        /// The URL to an image on disc that represents the type of workout.
        public var icon: URL?

        /// The geographic path that a person travels over the course of the workout.
        public var route: [CLLocation]?

        /// Represents a generic content type for journaling suggestions.
        @available(iOS 17.2, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.Workout
    }

    /// A suggestion that contains multiple workouts that a person chooses in the picker.
    ///
    /// The system provides an instance of this structure to your app when a person chooses multiple workout
    /// suggestions in the ``JournalingSuggestionsPicker``.
    @available(iOS 17.2, *)
    public struct WorkoutGroup : JournalingSuggestionAsset {

        /// An array of workout suggestions that a person chooses in the picker.
        public var workouts: [JournalingSuggestion.Workout]

        /// The URL to an image on disc that represents the types of completed workout.
        public var icon: URL?

        /// The total energy that the person burns over the workouts.
        public var activeEnergyBurned: HKQuantity?

        /// The average heart rate that the person experiences during the workouts.
        public var averageHeartRate: HKQuantity?

        /// The amount of time the workouts span.
        public var duration: TimeInterval?

        /// Represents a generic content type for journaling suggestions.
        @available(iOS 17.2, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.WorkoutGroup
    }

    /// A suggestion for a connection a person makes with someone else.
    ///
    /// The system provides an instance of this structure to your app when a person chooses a contact suggestion in
    /// the ``JournalingSuggestionsPicker``.
    @available(iOS 17.2, *)
    public struct Contact : JournalingSuggestionAsset {

        /// The contact's full name.
        public var name: String

        /// The URL to an image on disk for the contact photo.
        public let photo: URL?

        /// Represents a generic content type for journaling suggestions.
        @available(iOS 17.2, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.Contact
    }

    /// A suggestion that represents a location that a person visits.
    ///
    /// The system provides an instance of this structure to your app when a person chooses a location suggestion in
    /// the ``JournalingSuggestionsPicker``.
    @available(iOS 17.2, *)
    public struct Location : JournalingSuggestionAsset {

        /// A place name that commonly refers to the location.
        public var place: String?

        /// A name for the location if it's inside a city.
        public var city: String?

        /// An object that contains the location's geographic coordinates.
        public var location: CLLocation?

        /// The date that a person visits the place.
        public var date: Date?

        /// Represents a generic content type for journaling suggestions.
        @available(iOS 17.2, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.Location
    }

    /// A suggestion that contains multiple visited locations that a person chooses in the picker.
    ///
    /// The system provides an instance of this structure to your app when a person chooses a location suggestion
    ///  — that contains multiple location points — in the ``JournalingSuggestionsPicker``.
    @available(iOS 17.2, *)
    public struct LocationGroup : JournalingSuggestionAsset {

        /// An array of locations that a particular suggestion refers to.
        public var locations: [JournalingSuggestion.Location]

        /// Represents a generic content type for journaling suggestions.
        @available(iOS 17.2, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.LocationGroup
    }

    /// A suggestion for a song from a person's music library.
    ///
    /// The system provides an instance of this structure to your app when a person chooses a song suggestion
    /// in the ``JournalingSuggestionsPicker``.
    @available(iOS 17.2, *)
    public struct Song : JournalingSuggestionAsset {

        /// The name of the song.
        public var song: String?

        /// The song's musician.
        public var artist: String?

        /// The album that contains the song.
        public var album: String?

        /// The URL to an image on disk for the song artwork.
        public var artwork: URL?

        /// The song's recent play date.
        public var date: Date?

        /// Represents a generic content type for journaling suggestions.
        @available(iOS 17.2, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.Song
    }

    /// A suggestion that describes a podcast episode a person listened to.
    ///
    /// The system provides an instance of this structure to your app when a person chooses a podcast suggestion in
    /// the ``JournalingSuggestionsPicker``.
    @available(iOS 17.2, *)
    public struct Podcast : JournalingSuggestionAsset {

        /// The podcast episode's name.
        public var episode: String?

        /// The podcast's show name.
        public var show: String?

        /// The URL to an image on disk for the podcast artwork.
        public var artwork: URL?

        /// The podcast's recent play date.
        public var date: Date?

        /// Represents a generic content type for journaling suggestions.
        @available(iOS 17.2, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.Podcast
    }

    /// A suggestion describing generic now playable media that a person listened to.
    ///
    /// The system provides an instance of this structure to your app when a person chooses a generic media suggestion in
    /// the ``JournalingSuggestionsPicker``. To exclude the Now Playing item from content suggestions, see ``mediaplayer/mpnowplayinginfopropertyexcludefromsuggestions``.
    @available(iOS 18.0, *)
    public struct GenericMedia : JournalingSuggestionAsset {

        /// The title or name of a media item.
        public var title: String?

        /// The performing artists for a media item.
        public var artist: String?

        /// The name of the album that contains the media item.
        public var album: String?

        /// The media item's playback date.
        public var date: Date?

        /// The URL to an image on disk for the Now Playing app that played the media item.
        public var appIcon: URL?

        /// Represents a generic content type for journaling suggestions.
        @available(iOS 18.0, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.GenericMedia
    }

    /// A suggestion for a photo from a person’s library.
    ///
    /// The system provides an instance of this structure to your app when a person chooses a photo suggestion in
    /// the ``JournalingSuggestionsPicker``.
    @available(iOS 17.2, *)
    public struct Photo : JournalingSuggestionAsset {

        /// The URL to an image on disk for the photo.
        public var photo: URL

        /// The photo's creation date.
        public var date: Date?

        /// Represents a generic content type for journaling suggestions.
        @available(iOS 17.2, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.Photo
    }

    /// A suggestion for a video from a person’s library.
    ///
    /// The system provides an instance of this structure to your app when a person chooses a video suggestion in
    /// the ``JournalingSuggestionsPicker``.
    @available(iOS 17.2, *)
    public struct Video : JournalingSuggestionAsset {

        /// The URL to a video on disk.
        public var url: URL

        /// The video's creation date.
        public var date: Date?

        /// Represents a generic content type for journaling suggestions.
        @available(iOS 17.2, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.Video
    }

    /// A suggestion for a Live Photo from a person’s library.
    ///
    /// The system provides an instance of this structure to your app when a person chooses a Live Photo suggestion
    /// in the ``JournalingSuggestionsPicker``.
    @available(iOS 17.2, *)
    public struct LivePhoto : JournalingSuggestionAsset {

        /// The URL to a still image on disk for the Live Photo.
        public var image: URL

        /// The URL to a video on disk for the Live Photo..
        public var video: URL

        /// The Live Photo's creation date.
        public var date: Date?

        /// Represents a generic content type for journaling suggestions.
        @available(iOS 17.2, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.LivePhoto
    }

    /// A suggestion that describes motion activity, including the number of steps a person takes.
    ///
    /// The system provides an instance of this structure to your app when a person chooses a motion suggestion in
    /// the ``JournalingSuggestionsPicker``.
    @available(iOS 17.2, *)
    public struct MotionActivity : JournalingSuggestionAsset {

        /// The URL to an image on disk that depicts the motion activity.
        public var icon: URL?

        /// The number of steps a person takes.
        public var steps: Int

        /// The range of time in which the motion activity takes place.
        public var date: DateInterval?

        /// The movement activity type that the phone records when it detects motion.
        @available(iOS 18.0, *)
        public struct MovementType : Equatable, Hashable, Codable {

            /// A running movement activity type.
            public static let running: JournalingSuggestion.MotionActivity.MovementType

            /// A walking movement activity type.
            public static let walking: JournalingSuggestion.MotionActivity.MovementType

            /// A mixed running and walking movement activity type.
            public static let runningWalking: JournalingSuggestion.MotionActivity.MovementType

            /// Returns a Boolean value indicating whether two values are equal.
            ///
            /// Equality is the inverse of inequality. For any values `a` and `b`,
            /// `a == b` implies that `a != b` is `false`.
            ///
            /// - Parameters:
            ///   - lhs: A value to compare.
            ///   - rhs: Another value to compare.
            public static func == (a: JournalingSuggestion.MotionActivity.MovementType, b: JournalingSuggestion.MotionActivity.MovementType) -> Bool

            /// Hashes the essential components of this value by feeding them into the
            /// given hasher.
            ///
            /// Implement this method to conform to the `Hashable` protocol. The
            /// components used for hashing must be the same as the components compared
            /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
            /// with each of these components.
            ///
            /// - Important: In your implementation of `hash(into:)`,
            ///   don't call `finalize()` on the `hasher` instance provided,
            ///   or replace it with a different instance.
            ///   Doing so may become a compile-time error in the future.
            ///
            /// - Parameter hasher: The hasher to use when combining the components
            ///   of this instance.
            public func hash(into hasher: inout Hasher)

            /// Encodes this value into the given encoder.
            ///
            /// If the value fails to encode anything, `encoder` will encode an empty
            /// keyed container in its place.
            ///
            /// This function throws an error if any values are invalid for the given
            /// encoder's format.
            ///
            /// - Parameter encoder: The encoder to write data to.
            public func encode(to encoder: any Encoder) throws

            /// The hash value.
            ///
            /// Hash values are not guaranteed to be equal across different executions of
            /// your program. Do not save hash values to use during a future execution.
            ///
            /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
            ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
            ///   The compiler provides an implementation for `hashValue` for you.
            public var hashValue: Int { get }

            /// Creates a new instance by decoding from the given decoder.
            ///
            /// This initializer throws an error if reading from the decoder fails, or
            /// if the data read is corrupted or otherwise invalid.
            ///
            /// - Parameter decoder: The decoder to read data from.
            public init(from decoder: any Decoder) throws
        }

        /// The specific type of movement associated with the activity.
        @available(iOS 18.0, *)
        public var movementType: JournalingSuggestion.MotionActivity.MovementType?

        /// Represents a generic content type for journaling suggestions.
        @available(iOS 17.2, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.MotionActivity
    }

    /// A suggestion that describes a state of mind reflection in the Health app.
    ///
    /// The system provides an instance of this structure to your app when a person chooses a state of mind suggestion
    ///  in the ``JournalingSuggestionsPicker``.
    @available(iOS 18.0, *)
    public struct StateOfMind : JournalingSuggestionAsset {

        /// The state of mind reflection as logged in the Health app.
        ///
        /// This includes mood or emotion information, and
        /// its valence value shows the positive or negative magnitude as well as domains and labels.
        public var state: HKStateOfMind

        /// The URL to an image on disk that depicts the state of mind reflection valence image.
        public var icon: URL?

        /// The icon light background color gradients.
        public var lightBackground: Gradient?

        /// The icon dark background color gradients.
        public var darkBackground: Gradient?

        /// Represents a generic content type for journaling suggestions.
        @available(iOS 18.0, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.StateOfMind
    }

    /// A suggestion for a reflection prompt.
    ///
    /// The system provides an instance of this structure to your app when a person chooses a reflection prompt suggestion
    ///  in the ``JournalingSuggestionsPicker``.
    @available(iOS 18.0, *)
    public struct Reflection : JournalingSuggestionAsset {

        /// A reflection prompt suggestion.
        public var prompt: String

        /// The background color the system uses in the picker to render the reflection prompt content.
        public var color: Color?

        /// Represents a generic content type for journaling suggestions.
        @available(iOS 18.0, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.Reflection
    }

    /// A container for the information about a specific suggestion.
    ///
    /// When a person selects an event in the ``JournalingSuggestionsPicker``,
    /// the system invokes the `onCompletion` handler that your app declares for the picker and passes in a
    /// ``JournalingSuggestion`` instance. The journaling suggestion contains an array of
    /// structures of this type in its ``JournalingSuggestion/items`` property. Each instance of this structure
    /// contains one or more concrete instances of ``JournalingSuggestionAsset`` that represent the
    /// selection in the picker.
    public struct ItemContent : Identifiable {

        /// The stable identity of the entity associated with this instance.
        public var id: UUID

        /// An array of content types that a particular suggestion includes.
        public var representations: [any JournalingSuggestionAsset.Type]

        /// Checks if the suggestion contains information for the given type.
        ///
        /// The framework templates this method, where `Content` is ``JournalingSuggestionAsset``, because
        /// the `content` argument is a `Type` rather than an enumeration case, or other primitive.
        ///
        /// - Parameters:
        ///     - content: The type of information to check for.
        /// - Returns: `true`, if the suggestion contains information for the given type; otherwise, `false`.
        public func hasContent<Content>(ofType content: Content.Type) -> Bool where Content : JournalingSuggestionAsset

        /// Retrieves a suggestion's contents by returning a structure specific to the given content type.
        ///
        /// The framework templates this method, where `Content` is ``JournalingSuggestionAsset``, because
        /// the `content` argument is a `Type` rather than an enumeration case, or other primitive.
        ///
        /// - Parameters:
        ///     - content: A type conforming to ``JournalingSuggestionAsset`` protocol.
        /// - Throws: An error if the journaling suggestions picker encounters an unexpected issue.
        /// - Returns: An instance of the requested type, if it exists in the suggestion.
        public func content<Content>(forType content: Content.Type) async throws -> Content? where Content : JournalingSuggestionAsset

        /// A type representing the stable identity of the entity associated with
        /// an instance.
        @available(iOS 17.2, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(visionOS, unavailable)
        @available(macOS, unavailable)
        public typealias ID = UUID
    }

    /// Searches a suggestion's items for information of the given type.
    ///
    /// The framework templates this method, where `Content` is ``JournalingSuggestionAsset``, because
    /// the `content` argument is a `Type` rather than an enumeration case, or other primitive.
    ///
    /// - Parameters:
    ///     - content: A type that conforms to the ``JournalingSuggestionAsset`` protocol.
    /// - Throws: An error if the journaling suggestions picker encounters an unexpected issue.
    /// - Returns: An array that contains elements of the requested type, if they exist in the suggestion.
    public func content<Content>(forType content: Content.Type) async -> [Content] where Content : JournalingSuggestionAsset

    /// The individual items that compose the suggestion's content.
    public let items: [JournalingSuggestion.ItemContent]

    /// The title for the suggestion.
    public let title: String

    /// The range of time in which the suggested event takes place.
    public let date: DateInterval?

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    ///   The compiler provides an implementation for `hashValue` for you.
    public var hashValue: Int { get }
}

@available(iOS 17.2, *)
extension JournalingSuggestion {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: JournalingSuggestion, rhs: JournalingSuggestion) -> Bool

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: In your implementation of `hash(into:)`,
    ///   don't call `finalize()` on the `hasher` instance provided,
    ///   or replace it with a different instance.
    ///   Doing so may become a compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)
}

/// An interface for the content that the suggestions picker presents.
///
/// When a person makes a selection in a ``JournalingSuggestionsPicker``, the system invokes the picker's
/// `onCompletion` closure, and passes in the selected suggestion (``JournalingSuggestion``).
/// Each item in the suggestion's ``JournalingSuggestion/items`` array conforms to this protocol.
@available(iOS 17.2, *)
public protocol JournalingSuggestionAsset {

    /// Represents a generic content type for journaling suggestions.
    associatedtype JournalingSuggestionContent : JournalingSuggestionAsset = Self
}

/// A view that lists different types of recent events in a person's life.
///
/// This interface displays several grids of content that
/// layout visual mementos, each representing unique, personal events that occur in a person's life.
/// It enables a person to reflect and choose a particular event as a topic for derivative work. For example, a workout can serve
/// as the beginnings of a new journal entry or illustration.
///
/// The first time the picker appears, a modal sheet introduces the concept of journaling suggestions. After a
/// person selects a suggestion in the picker, the system shares only the information associated with the chosen suggestion
/// with your app.
///
/// For more information, see
/// <doc:presenting-the-suggestions-picker-and-processing-a-selection>.
@available(iOS 17.2, *)
@MainActor @preconcurrency public struct JournalingSuggestionsPicker<Label> : View where Label : View {

    /// Creates a suggestions picker within the given view.
    ///
    /// - Parameters:
    ///     - label: A view that describes the suggestion picker's purpose in the context of your app.
    ///     - onCompletion: Code that you supply, which processes any suggestions that a person chooses in the picker.
    @MainActor @preconcurrency public init(@ViewBuilder label: () -> Label, onCompletion: @escaping (JournalingSuggestion) async -> Void)

    /// The content and behavior of the view.
    ///
    /// When you implement a custom view, you must implement a computed
    /// `body` property to provide the content for your view. Return a view
    /// that's composed of built-in views that SwiftUI provides, plus other
    /// composite views that you've already defined:
    ///
    ///     struct MyView: View {
    ///         var body: some View {
    ///             Text("Hello, World!")
    ///         }
    ///     }
    ///
    /// For more information about composing views and a view hierarchy,
    /// see <doc:Declaring-a-Custom-View>.
    @MainActor @preconcurrency public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    @available(iOS 17.2, *)
    public typealias Body = some View
}

@available(iOS 17.2, *)
extension JournalingSuggestionsPicker where Label == Text {

    /// Creates a suggestions picker with button text defined by the given localized string key.
    ///
    /// This initializer creates a text view similar to the results of calling
    /// <doc://com.apple.documentation/documentation/swiftui/text/init(_:tablename:bundle:comment:)>.
    /// See <doc://com.apple.documentation/documentation/swiftui/text> for more information about
    /// localizing strings.
    ///
    /// - Parameters:
    ///     - title: A localized string key that describes the suggestion picker's purpose in the context of your app.
    ///     - onCompletion: Code that you supply, which processes any suggestions that a person chooses in the picker.
    @MainActor @preconcurrency public init(_ title: LocalizedStringKey, onCompletion: @escaping (JournalingSuggestion) async -> Void)

    /// Creates a suggestions picker with button text defined by the given string.
    ///
    /// This initializer creates a text view on your behalf and uses the string argument to set its text.
    ///
    /// - Parameters:
    ///     - title: A string that describes the suggestion picker's purpose in the context of your app.
    ///     - onCompletion: Code that you supply, which processes any suggestions that a person chooses in the picker.
    @MainActor @preconcurrency public init<S>(_ title: S, onCompletion: @escaping (JournalingSuggestion) async -> Void) where S : StringProtocol
}

@available(iOS 17.2, *)
extension JournalingSuggestionsPicker : Sendable {
}

@available(iOS 17.2, *)
extension UIImage : JournalingSuggestionAsset {

    /// Represents a generic content type for journaling suggestions.
    @available(iOS 17.2, *)
    public typealias JournalingSuggestionContent = UIImage
}

@available(iOS 17.2, *)
extension Image : JournalingSuggestionAsset {

    /// Represents a generic content type for journaling suggestions.
    @available(iOS 17.2, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    public typealias JournalingSuggestionContent = Image
}

@available(iOS 17.2, *)
extension View {

    /// Presents a visual picker interface that contains events and images that a person can select
    /// to retrieve more information.
    ///
    /// For more information about the Journaling Suggestions picker, see: <doc:presenting-the-suggestions-picker-and-processing-a-selection>.
    ///
    /// - Parameters:
    ///     - isPresented: A binding to a `Bool` value that determines whether to show the picker.
    ///     - onCompletion: Code that you supply, which processes any suggestions that a person may choose in the picker.
    @MainActor @preconcurrency public func journalingSuggestionsPicker(isPresented: Binding<Bool>, onCompletion: @escaping (JournalingSuggestion) async -> Void) -> some View

}



