// MARK: - 한국어
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

/// 저널링 제안 피커에서 사용자가 선택한 제안에 대한 상위 수준 정보입니다.
///
/// 사용자가 ``JournalingSuggestionsPicker``에서 특정 제안을 선택하면,
/// 시스템은 이 구조체의 인스턴스를 피커의 `onCompletion` 핸들러에 전달하여
/// 이벤트에 대한 추가 정보를 앱에 제공합니다.
@available(iOS 17.2, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
public struct JournalingSuggestion : Equatable, Hashable {

    /// 사용자가 완료한 운동에 대한 정보를 설명하는 제안입니다.
    ///
    /// 사용자가 ``JournalingSuggestionsPicker``에서 운동 제안을 선택하면,
    /// 시스템은 이 구조체의 인스턴스를 앱에 제공합니다.
    @available(iOS 17.2, *)
    public struct Workout : JournalingSuggestionAsset {

        /// 사용자가 완료한 운동에 대한 정보입니다.
        ///
        /// 각 ``JournalingSuggestion/Workout``은
        /// ``JournalingSuggestion/Workout/details`` 프로퍼티에 이 구조체의 인스턴스를 갖습니다.
        public struct Details : JournalingSuggestionAsset {

            /// 운동 유형입니다.
            public var activityType: HKWorkoutActivityType

            /// 사용자가 운동 중 소모한 에너지입니다.
            public var activeEnergyBurned: HKQuantity?

            /// 운동이 걸친 거리입니다.
            public var distance: HKQuantity?

            /// 사용자가 운동 중 경험한 평균 심박수입니다.
            public var averageHeartRate: HKQuantity?

            /// 운동이 진행된 시간 범위입니다.
            public var date: DateInterval?

            /// 저널링 제안에 대한 범용 콘텐츠 타입을 나타냅니다.
            @available(iOS 17.2, *)
            @available(tvOS, unavailable)
            @available(watchOS, unavailable)
            @available(macOS, unavailable)
            public typealias JournalingSuggestionContent = JournalingSuggestion.Workout.Details
        }

        /// 운동에 대한 구체적인 정보를 담고 있는 구조체입니다.
        public var details: JournalingSuggestion.Workout.Details?

        /// 운동 유형을 나타내는 디스크 상의 이미지 URL입니다.
        public var icon: URL?

        /// 사용자가 운동 중 이동한 지리적 경로입니다.
        public var route: [CLLocation]?

        /// 저널링 제안에 대한 범용 콘텐츠 타입을 나타냅니다.
        @available(iOS 17.2, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.Workout
    }

    /// 사용자가 피커에서 선택한 여러 운동을 담는 제안입니다.
    ///
    /// 사용자가 ``JournalingSuggestionsPicker``에서 여러 운동 제안을 선택하면,
    /// 시스템은 이 구조체의 인스턴스를 앱에 제공합니다.
    @available(iOS 17.2, *)
    public struct WorkoutGroup : JournalingSuggestionAsset {

        /// 사용자가 피커에서 선택한 운동 제안의 배열입니다.
        public var workouts: [JournalingSuggestion.Workout]

        /// 완료된 운동 유형을 나타내는 디스크 상의 이미지 URL입니다.
        public var icon: URL?

        /// 사용자가 운동들을 통해 소모한 총 에너지입니다.
        public var activeEnergyBurned: HKQuantity?

        /// 사용자가 운동 중 경험한 평균 심박수입니다.
        public var averageHeartRate: HKQuantity?

        /// 운동들이 걸친 전체 시간입니다.
        public var duration: TimeInterval?

        /// 저널링 제안에 대한 범용 콘텐츠 타입을 나타냅니다.
        @available(iOS 17.2, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.WorkoutGroup
    }

    /// 사용자가 다른 사람과 연락하는 연결 상황에 대한 제안입니다.
    ///
    /// 사용자가 ``JournalingSuggestionsPicker``에서 연락처 제안을 선택하면,
    /// 시스템은 이 구조체의 인스턴스를 앱에 제공합니다.
    @available(iOS 17.2, *)
    public struct Contact : JournalingSuggestionAsset {

        /// 연락처의 전체 이름입니다.
        public var name: String

        /// 디스크 상의 연락처 사진 이미지 URL입니다.
        public let photo: URL?

        /// 저널링 제안에 대한 범용 콘텐츠 타입을 나타냅니다.
        @available(iOS 17.2, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.Contact
    }

    /// 사용자가 방문한 위치를 나타내는 제안입니다.
    ///
    /// 사용자가 ``JournalingSuggestionsPicker``에서 위치 제안을 선택하면,
    /// 시스템은 이 구조체의 인스턴스를 앱에 제공합니다.
    @available(iOS 17.2, *)
    public struct Location : JournalingSuggestionAsset {

        /// 위치를 일반적으로 지칭하는 장소 이름입니다.
        public var place: String?

        /// 도시 내부 위치에 대한 이름입니다.
        public var city: String?

        /// 위치의 지리 좌표를 담고 있는 객체입니다.
        public var location: CLLocation?

        /// 사용자가 해당 장소를 방문한 날짜입니다.
        public var date: Date?

        /// 저널링 제안에 대한 범용 콘텐츠 타입을 나타냅니다.
        @available(iOS 17.2, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.Location
    }

    /// 사용자가 피커에서 선택한 여러 방문 위치를 담는 제안입니다.
    ///
    /// 사용자가 ``JournalingSuggestionsPicker``에서
    /// 여러 위치 포인트를 포함하는 위치 제안을 선택하면,
    /// 시스템은 이 구조체의 인스턴스를 앱에 제공합니다.
    @available(iOS 17.2, *)
    public struct LocationGroup : JournalingSuggestionAsset {

        /// 특정 제안에서 가리키는 위치 배열입니다.
        public var locations: [JournalingSuggestion.Location]

        /// 저널링 제안에 대한 범용 콘텐츠 타입을 나타냅니다.
        @available(iOS 17.2, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.LocationGroup
    }

    /// 사용자의 음악 라이브러리에 있는 곡에 대한 제안입니다.
    ///
    /// 사용자가 ``JournalingSuggestionsPicker``에서 곡 제안을 선택하면,
    /// 시스템은 이 구조체의 인스턴스를 앱에 제공합니다.
    @available(iOS 17.2, *)
    public struct Song : JournalingSuggestionAsset {

        /// 곡의 이름입니다.
        public var song: String?

        /// 곡의 뮤지션입니다.
        public var artist: String?

        /// 곡이 속한 앨범입니다.
        public var album: String?

        /// 디스크 상에 있는 곡의 아트워크 이미지 URL입니다.
        public var artwork: URL?

        /// 곡을 최근에 재생한 날짜입니다.
        public var date: Date?

        /// 저널링 제안에 대한 범용 콘텐츠 타입을 나타냅니다.
        @available(iOS 17.2, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.Song
    }

    /// 사용자가 들은 팟캐스트 에피소드에 대한 제안입니다.
    ///
    /// 사용자가 ``JournalingSuggestionsPicker``에서 팟캐스트 제안을 선택하면,
    /// 시스템은 이 구조체의 인스턴스를 앱에 제공합니다.
    @available(iOS 17.2, *)
    public struct Podcast : JournalingSuggestionAsset {

        /// 팟캐스트 에피소드의 이름입니다.
        public var episode: String?

        /// 팟캐스트의 쇼 이름입니다.
        public var show: String?

        /// 디스크 상에 있는 팟캐스트 아트워크 이미지 URL입니다.
        public var artwork: URL?

        /// 팟캐스트를 최근에 재생한 날짜입니다.
        public var date: Date?

        /// 저널링 제안에 대한 범용 콘텐츠 타입을 나타냅니다.
        @available(iOS 17.2, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.Podcast
    }

    /// 사용자가 들은 일반적인 재생 가능 미디어(Now Playable Media)에 대한 제안입니다.
    ///
    /// 사용자가 ``JournalingSuggestionsPicker``에서 일반적인 미디어 제안을 선택하면,
    /// 시스템은 이 구조체의 인스턴스를 앱에 제공합니다.
    /// 해당 Now Playing 항목을 콘텐츠 제안에서 제외하려면, ``mediaplayer/mpnowplayinginfopropertyexcludefromsuggestions``를 참조하세요.
    @available(iOS 18.0, *)
    public struct GenericMedia : JournalingSuggestionAsset {

        /// 미디어 항목의 제목 또는 이름입니다.
        public var title: String?

        /// 미디어 항목을 연주하는 아티스트입니다.
        public var artist: String?

        /// 미디어 항목이 속한 앨범의 이름입니다.
        public var album: String?

        /// 미디어 항목의 재생 날짜입니다.
        public var date: Date?

        /// 미디어 항목을 재생한 Now Playing 앱의 디스크 상 아이콘 URL입니다.
        public var appIcon: URL?

        /// 저널링 제안에 대한 범용 콘텐츠 타입을 나타냅니다.
        @available(iOS 18.0, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.GenericMedia
    }

    /// 사용자의 라이브러리에 있는 사진에 대한 제안입니다.
    ///
    /// 사용자가 ``JournalingSuggestionsPicker``에서 사진 제안을 선택하면,
    /// 시스템은 이 구조체의 인스턴스를 앱에 제공합니다.
    @available(iOS 17.2, *)
    public struct Photo : JournalingSuggestionAsset {

        /// 디스크 상의 사진 이미지 URL입니다.
        public var photo: URL

        /// 사진이 생성된 날짜입니다.
        public var date: Date?

        /// 저널링 제안에 대한 범용 콘텐츠 타입을 나타냅니다.
        @available(iOS 17.2, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.Photo
    }

    /// 사용자의 라이브러리에 있는 동영상에 대한 제안입니다.
    ///
    /// 사용자가 ``JournalingSuggestionsPicker``에서 동영상 제안을 선택하면,
    /// 시스템은 이 구조체의 인스턴스를 앱에 제공합니다.
    @available(iOS 17.2, *)
    public struct Video : JournalingSuggestionAsset {

        /// 디스크 상의 동영상 URL입니다.
        public var url: URL

        /// 동영상이 생성된 날짜입니다.
        public var date: Date?

        /// 저널링 제안에 대한 범용 콘텐츠 타입을 나타냅니다.
        @available(iOS 17.2, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.Video
    }

    /// 사용자의 라이브러리에 있는 Live Photo에 대한 제안입니다.
    ///
    /// 사용자가 ``JournalingSuggestionsPicker``에서 Live Photo 제안을 선택하면,
    /// 시스템은 이 구조체의 인스턴스를 앱에 제공합니다.
    @available(iOS 17.2, *)
    public struct LivePhoto : JournalingSuggestionAsset {

        /// Live Photo의 스틸 이미지(정지 사진) 디스크 상 URL입니다.
        public var image: URL

        /// Live Photo의 동영상 디스크 상 URL입니다.
        public var video: URL

        /// Live Photo가 생성된 날짜입니다.
        public var date: Date?

        /// 저널링 제안에 대한 범용 콘텐츠 타입을 나타냅니다.
        @available(iOS 17.2, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.LivePhoto
    }

    /// 사용자의 모션 활동(걸음 수 등)에 대한 제안입니다.
    ///
    /// 사용자가 ``JournalingSuggestionsPicker``에서 모션 제안을 선택하면,
    /// 시스템은 이 구조체의 인스턴스를 앱에 제공합니다.
    @available(iOS 17.2, *)
    public struct MotionActivity : JournalingSuggestionAsset {

        /// 모션 활동을 나타내는 디스크 상 이미지 URL입니다.
        public var icon: URL?

        /// 사용자가 걸은 걸음 수입니다.
        public var steps: Int

        /// 모션 활동이 진행된 시간 범위입니다.
        public var date: DateInterval?

        /// 기기가 모션을 감지했을 때 기록된 운동 활동 유형입니다.
        @available(iOS 18.0, *)
        public struct MovementType : Equatable, Hashable, Codable {

            /// 달리기 활동 유형입니다.
            public static let running: JournalingSuggestion.MotionActivity.MovementType

            /// 걷기 활동 유형입니다.
            public static let walking: JournalingSuggestion.MotionActivity.MovementType

            /// 달리기와 걷기가 혼합된 활동 유형입니다.
            public static let runningWalking: JournalingSuggestion.MotionActivity.MovementType

            /// 두 값이 동일한지 여부를 반환합니다.
            ///
            /// 동등성은 부등성의 반대입니다. 어떤 값 `a`와 `b`에 대하여,
            /// `a == b`이면 `a != b`는 `false`입니다.
            ///
            /// - Parameters:
            ///   - lhs: 비교할 값입니다.
            ///   - rhs: 비교할 다른 값입니다.
            public static func == (a: JournalingSuggestion.MotionActivity.MovementType, b: JournalingSuggestion.MotionActivity.MovementType) -> Bool

            /// 주어진 해셔(`Hasher`)에 이 값의 필수 구성 요소를 공급하여 해싱합니다.
            ///
            /// `Hashable` 프로토콜을 준수하기 위해 이 메서드를 구현하십시오.
            /// `==` 연산자 구현에서 비교에 사용된 것과 동일한 구성 요소를
            /// `hasher.combine(_:)`에 전달해야 합니다.
            ///
            /// - 중요: `hash(into:)`의 구현에서 제공된 `hasher` 인스턴스에 대해
            ///   `finalize()`를 호출하거나 다른 인스턴스로 교체하지 마십시오.
            ///   추후 컴파일 타임 오류가 될 수 있습니다.
            ///
            /// - Parameter hasher: 이 인스턴스의 구성 요소를 결합할 때 사용할 해셔입니다.
            public func hash(into hasher: inout Hasher)

            /// 이 값을 주어진 인코더(`Encoder`)로 인코딩합니다.
            ///
            /// 만약 인코딩할 것이 없다면, `encoder`는 빈 키드 컨테이너를 인코딩합니다.
            /// 어떤 값이 주어진 인코더 형식에 유효하지 않으면 에러가 발생합니다.
            ///
            /// - Parameter encoder: 데이터를 기록할 인코더입니다.
            public func encode(to encoder: any Encoder) throws

            /// 해시 값입니다.
            ///
            /// 해시 값은 프로그램의 다른 실행 간에 동일하다고 보장되지 않습니다.
            /// 해시 값을 저장하여 나중 실행에서 사용하지 마십시오.
            ///
            /// - 중요: `hashValue`는 `Hashable` 요구사항에서 더 이상 권장되지 않습니다.
            ///   대신 `hash(into:)` 요구사항을 구현해야 합니다.
            ///   컴파일러가 `hashValue`의 구현을 제공합니다.
            public var hashValue: Int { get }

            /// 주어진 디코더(`Decoder`)로부터 이 값을 디코딩하여 새 인스턴스를 생성합니다.
            ///
            /// 디코더에서 데이터를 읽는 데 실패하거나,
            /// 읽은 데이터가 손상되었거나 유효하지 않으면 에러가 발생합니다.
            ///
            /// - Parameter decoder: 데이터를 읽을 디코더입니다.
            public init(from decoder: any Decoder) throws
        }

        /// 활동과 관련된 구체적인 운동 유형입니다.
        @available(iOS 18.0, *)
        public var movementType: JournalingSuggestion.MotionActivity.MovementType?

        /// 저널링 제안에 대한 범용 콘텐츠 타입을 나타냅니다.
        @available(iOS 17.2, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.MotionActivity
    }

    /// 건강 앱에서 사용자가 기록한 심리 상태(State of Mind) 반영(리플렉션)에 대한 제안입니다.
    ///
    /// 사용자가 ``JournalingSuggestionsPicker``에서 심리 상태 제안을 선택하면,
    /// 시스템은 이 구조체의 인스턴스를 앱에 제공합니다.
    @available(iOS 18.0, *)
    public struct StateOfMind : JournalingSuggestionAsset {

        /// 건강 앱에 기록된 심리 상태(기분 혹은 감정) 반영 정보입니다.
        ///
        /// 긍정 혹은 부정의 강도를 나타내는 valence 값 및 도메인, 라벨 등의 정보가 포함됩니다.
        public var state: HKStateOfMind

        /// 심리 상태 반영의 밸런스 이미지를 나타내는 디스크 상 아이콘 URL입니다.
        public var icon: URL?

        /// 아이콘의 밝은 배경 색상 그라데이션입니다.
        public var lightBackground: Gradient?

        /// 아이콘의 어두운 배경 색상 그라데이션입니다.
        public var darkBackground: Gradient?

        /// 저널링 제안에 대한 범용 콘텐츠 타입을 나타냅니다.
        @available(iOS 18.0, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.StateOfMind
    }

    /// 반영(리플렉션) 프롬프트에 대한 제안입니다.
    ///
    /// 사용자가 ``JournalingSuggestionsPicker``에서 반영(리플렉션) 프롬프트 제안을 선택하면,
    /// 시스템은 이 구조체의 인스턴스를 앱에 제공합니다.
    @available(iOS 18.0, *)
    public struct Reflection : JournalingSuggestionAsset {

        /// 반영(리플렉션) 프롬프트 제안입니다.
        public var prompt: String

        /// 피커에서 반영(리플렉션) 프롬프트 콘텐츠를 렌더링하는 데 사용하는 배경 색상입니다.
        public var color: Color?

        /// 저널링 제안에 대한 범용 콘텐츠 타입을 나타냅니다.
        @available(iOS 18.0, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        public typealias JournalingSuggestionContent = JournalingSuggestion.Reflection
    }

    /// 특정 제안에 대한 정보를 담는 컨테이너입니다.
    ///
    /// 사용자가 ``JournalingSuggestionsPicker``에서 이벤트를 선택하면,
    /// 시스템은 피커의 `onCompletion` 핸들러를 호출하여
    /// ``JournalingSuggestion`` 인스턴스를 전달합니다.
    /// 저널링 제안은 ``JournalingSuggestion/items`` 프로퍼티에
    /// 이 구조체를 요소로 갖는 배열을 포함합니다.
    /// 각 구조체 인스턴스는 피커 선택을 나타내는
    /// 하나 이상의 ``JournalingSuggestionAsset`` 구체 인스턴스를 담습니다.
    public struct ItemContent : Identifiable {

        /// 이 인스턴스와 연관된 엔티티의 안정적인 식별자입니다.
        public var id: UUID

        /// 특정 제안이 포함하는 콘텐츠 유형의 배열입니다.
        public var representations: [any JournalingSuggestionAsset.Type]

        /// 제안이 주어진 타입의 정보를 포함하는지 확인합니다.
        ///
        /// 프레임워크는 `content` 인자를 열거형 케이스나 다른 원시 타입이 아닌
        /// `Type`으로 받기 때문에, `Content`가 ``JournalingSuggestionAsset``임을
        /// 제네릭으로 템플릿화합니다.
        ///
        /// - Parameters:
        ///     - content: 확인할 정보의 타입입니다.
        /// - Returns: 해당 타입의 정보가 제안에 포함되어 있다면 `true`, 그렇지 않다면 `false`입니다.
        public func hasContent<Content>(ofType content: Content.Type) -> Bool where Content : JournalingSuggestionAsset

        /// 제안의 콘텐츠를 가져와, 주어진 콘텐츠 타입에 특화된 구조체를 반환합니다.
        ///
        /// 프레임워크는 `content` 인자를 열거형 케이스나 다른 원시 타입이 아닌
        /// `Type`으로 받기 때문에, `Content`가 ``JournalingSuggestionAsset``임을
        /// 제네릭으로 템플릿화합니다.
        ///
        /// - Parameters:
        ///     - content: ``JournalingSuggestionAsset`` 프로토콜을 준수하는 타입입니다.
        /// - Throws: 저널링 제안 피커가 예기치 못한 문제를 만나면 오류를 발생시킬 수 있습니다.
        /// - Returns: 요청된 타입의 인스턴스가 제안에 존재한다면 반환합니다.
        public func content<Content>(forType content: Content.Type) async throws -> Content? where Content : JournalingSuggestionAsset

        /// 이 인스턴스와 연관된 엔티티의 안정적인 식별자를 나타내는 타입입니다.
        @available(iOS 17.2, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(visionOS, unavailable)
        @available(macOS, unavailable)
        public typealias ID = UUID
    }

    /// 제안 항목들에서 특정 타입의 정보를 검색합니다.
    ///
    /// 프레임워크는 `content` 인자를 열거형 케이스나 다른 원시 타입이 아닌
    /// `Type`으로 받기 때문에, `Content`가 ``JournalingSuggestionAsset``임을
    /// 제네릭으로 템플릿화합니다.
    ///
    /// - Parameters:
    ///     - content: ``JournalingSuggestionAsset`` 프로토콜을 준수하는 타입입니다.
    /// - Throws: 저널링 제안 피커가 예기치 못한 문제를 만나면 오류를 발생시킬 수 있습니다.
    /// - Returns: 제안 안에 해당 타입의 요소가 존재한다면, 해당 요소를 담은 배열입니다.
    public func content<Content>(forType content: Content.Type) async -> [Content] where Content : JournalingSuggestionAsset

    /// 제안 콘텐츠를 구성하는 개별 항목들입니다.
    public let items: [JournalingSuggestion.ItemContent]

    /// 제안의 제목입니다.
    public let title: String

    /// 제안된 이벤트가 발생하는 시간 범위입니다.
    public let date: DateInterval?

    /// 해시 값입니다.
    ///
    /// 해시 값은 프로그램의 다른 실행 간에 동일하다고 보장되지 않습니다.
    /// 해시 값을 저장하여 나중에 재사용하지 마십시오.
    ///
    /// - 중요: `hashValue`는 `Hashable` 요구사항에서 더 이상 권장되지 않습니다.
    ///   `hash(into:)` 요구사항을 구현해야 합니다.
    ///   컴파일러가 `hashValue`의 구현을 제공합니다.
    public var hashValue: Int { get }
}

@available(iOS 17.2, *)
extension JournalingSuggestion {

    /// 두 값이 동일한지 여부를 반환합니다.
    ///
    /// 동등성은 부등성의 반대입니다. 어떤 값 `a`와 `b`에 대하여,
    /// `a == b`이면 `a != b`는 `false`입니다.
    ///
    /// - Parameters:
    ///   - lhs: 비교할 값입니다.
    ///   - rhs: 비교할 다른 값입니다.
    public static func == (lhs: JournalingSuggestion, rhs: JournalingSuggestion) -> Bool

    /// 주어진 해셔(`Hasher`)에 이 값의 필수 구성 요소를 공급하여 해싱합니다.
    ///
    /// `Hashable` 프로토콜을 준수하기 위해 이 메서드를 구현하십시오.
    /// `==` 연산자 구현에서 비교에 사용된 것과 동일한 구성 요소를
    /// `hasher.combine(_:)`에 전달해야 합니다.
    ///
    /// - 중요: `hash(into:)`의 구현에서 제공된 `hasher` 인스턴스에 대해
    ///   `finalize()`를 호출하거나 다른 인스턴스로 교체하지 마십시오.
    ///   추후 컴파일 타임 오류가 될 수 있습니다.
    ///
    /// - Parameter hasher: 이 인스턴스의 구성 요소를 결합할 때 사용할 해셔입니다.
    public func hash(into hasher: inout Hasher)
}

/// 제안 피커가 표시하는 콘텐츠에 대한 인터페이스입니다.
///
/// 사용자가 ``JournalingSuggestionsPicker``에서 선택을 하면,
/// 시스템은 피커의 `onCompletion` 클로저를 호출하고
/// 선택된 제안(``JournalingSuggestion``)을 전달합니다.
/// 제안의 ``JournalingSuggestion/items`` 배열에 포함된
/// 각 항목은 이 프로토콜을 준수합니다.
@available(iOS 17.2, *)
public protocol JournalingSuggestionAsset {

    /// 저널링 제안에 대한 범용 콘텐츠 타입을 나타냅니다.
    associatedtype JournalingSuggestionContent : JournalingSuggestionAsset = Self
}

/// 사용자의 일상에서 발생한 다양한 최근 이벤트 목록을 보여주는 뷰입니다.
///
/// 이 인터페이스는 여러 격자 형태의 콘텐츠를 표시하며,
/// 시각적인 기념품(각기 고유하며 개인적인 이벤트를 대표하는)을 배치합니다.
/// 사용자는 이를 기반으로 특정 이벤트를 선택해 다른 결과물을 만들어낼 수 있습니다.
/// 예를 들어 운동이 일기 작성이나 일러스트의 시작점이 될 수 있습니다.
///
/// 처음 피커가 나타났을 때, 모달 시트가 저널링 제안 개념을 소개합니다.
/// 사용자가 피커에서 제안을 선택하면, 시스템은 오직 해당 제안과 관련된 정보만
/// 앱에 공유합니다.
///
/// 자세한 내용은 <doc:presenting-the-suggestions-picker-and-processing-a-selection>을 참고하십시오.
@available(iOS 17.2, *)
@MainActor @preconcurrency public struct JournalingSuggestionsPicker<Label> : View where Label : View {

    /// 주어진 뷰 내에서 제안 피커를 생성합니다.
    ///
    /// - Parameters:
    ///     - label: 앱 맥락에서 제안 피커의 목적을 설명하는 뷰입니다.
    ///     - onCompletion: 사용자가 피커에서 선택한 제안을 처리하는 코드를 제공합니다.
    @MainActor @preconcurrency public init(@ViewBuilder label: () -> Label, onCompletion: @escaping (JournalingSuggestion) async -> Void)

    /// 뷰의 콘텐츠와 동작을 정의합니다.
    ///
    /// 커스텀 뷰를 구현할 때는, 필수 프로퍼티인
    /// 계산 프로퍼티 `body`를 구현하여 뷰의 콘텐츠를 제공해야 합니다.
    /// SwiftUI가 제공하는 기본 뷰들과 이미 정의한 다른 합성 뷰들을 결합하여 반환하십시오:
    ///
    ///     struct MyView: View {
    ///         var body: some View {
    ///             Text("Hello, World!")
    ///         }
    ///     }
    ///
    /// 뷰와 뷰 계층 구조를 구성하는 방법에 대한 자세한 내용은
    /// <doc:Declaring-a-Custom-View>를 참조하십시오.
    @MainActor @preconcurrency public var body: some View { get }

    /// 이 뷰의 본문을 나타내는 뷰의 타입입니다.
    ///
    /// 커스텀 뷰를 생성할 때, Swift는
    /// 필수 프로퍼티인 ``View/body-swift.property``의 구현에서
    /// 이 타입을 추론합니다.
    @available(iOS 17.2, *)
    public typealias Body = some View
}

@available(iOS 17.2, *)
extension JournalingSuggestionsPicker where Label == Text {

    /// 주어진 로컬라이즈드 문자열 키로 정의된 버튼 텍스트를 사용하여 제안 피커를 생성합니다.
    ///
    /// 이 이니셜라이저는
    /// <doc://com.apple.documentation/documentation/swiftui/text/init(_:tablename:bundle:comment:)>의 결과와 유사한
    /// 텍스트 뷰를 생성합니다.
    /// 문자열의 로컬라이제이션에 대한 자세한 내용은
    /// <doc://com.apple.documentation/documentation/swiftui/text>를 참고하십시오.
    ///
    /// - Parameters:
    ///     - title: 앱 맥락에서 제안 피커의 목적을 설명하는 로컬라이즈드 문자열 키입니다.
    ///     - onCompletion: 사용자가 피커에서 선택한 제안을 처리하는 코드를 제공합니다.
    @MainActor @preconcurrency public init(_ title: LocalizedStringKey, onCompletion: @escaping (JournalingSuggestion) async -> Void)

    /// 주어진 문자열로 정의된 버튼 텍스트를 사용하여 제안 피커를 생성합니다.
    ///
    /// 이 이니셜라이저는 직접 텍스트 뷰를 생성하고,
    /// 문자열 인자를 사용하여 그 텍스트 내용을 설정합니다.
    ///
    /// - Parameters:
    ///     - title: 앱 맥락에서 제안 피커의 목적을 설명하는 문자열입니다.
    ///     - onCompletion: 사용자가 피커에서 선택한 제안을 처리하는 코드를 제공합니다.
    @MainActor @preconcurrency public init<S>(_ title: S, onCompletion: @escaping (JournalingSuggestion) async -> Void) where S : StringProtocol
}

@available(iOS 17.2, *)
extension JournalingSuggestionsPicker : Sendable {
}

@available(iOS 17.2, *)
extension UIImage : JournalingSuggestionAsset {

    /// 저널링 제안에 대한 범용 콘텐츠 타입을 나타냅니다.
    @available(iOS 17.2, *)
    public typealias JournalingSuggestionContent = UIImage
}

@available(iOS 17.2, *)
extension Image : JournalingSuggestionAsset {

    /// 저널링 제안에 대한 범용 콘텐츠 타입을 나타냅니다.
    @available(iOS 17.2, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    public typealias JournalingSuggestionContent = Image
}

@available(iOS 17.2, *)
extension View {

    /// 사용자가 선택할 수 있는 이벤트와 이미지를 포함하는 시각적인 피커 인터페이스를 표시합니다.
    ///
    /// Journaling Suggestions 피커에 대한 자세한 내용은
    /// <doc:presenting-the-suggestions-picker-and-processing-a-selection>을 참조하십시오.
    ///
    /// - Parameters:
    ///     - isPresented: 피커를 표시할지 여부를 결정하는 `Bool` 값에 대한 바인딩입니다.
    ///     - onCompletion: 사용자가 피커에서 제안을 선택했을 때 처리할 코드를 제공합니다.
    @MainActor @preconcurrency public func journalingSuggestionsPicker(isPresented: Binding<Bool>, onCompletion: @escaping (JournalingSuggestion) async -> Void) -> some View
}

