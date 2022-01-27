import SwiftUI

// Global variable to store animation type
var choice: String = String()

public struct BackgroundAnimation: View {
    
    public init(shape: String) {
        choice = shape
    }
    public var body: some View {
        FloatingClouds()
    }
}

class CloudProvider: ObservableObject {
    let offset: CGSize
    let frameHeightRatio: CGFloat
    
    init() {
        frameHeightRatio = CGFloat.random(in: 0.7 ..< 1.4)
        offset = CGSize(
            width: CGFloat.random(in: -150 ..< 150),
            height: CGFloat.random(in: -150 ..< 150)
        )
    }
}

// Shape that has properties of a triangle
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        return path
    }
}

struct Cloud: View {
    @StateObject var provider = CloudProvider()
    @State var move = false
    let proxy: GeometryProxy
    let color: Color
    let rotationStart: Double
    let duration: Double
    let alignment: Alignment
    
    var body: some View {
        
        if choice == "Triangle" {
            Triangle()
                .fill(color)
                .frame(height: proxy.size.height /  provider.frameHeightRatio)
                .offset(provider.offset)
                .rotationEffect(.init(degrees: move ? rotationStart : rotationStart + 360) )
                .animation(Animation.linear(duration: duration).repeatForever(autoreverses: false), value: move)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
                .opacity(0.8)
                .onAppear {
                    move.toggle()
                }
        } else if choice == "Rectangle" {
            withAnimation() {
                
                Rectangle()
                    .fill(color)
                    .frame(height: proxy.size.height /  provider.frameHeightRatio)
                    .offset(provider.offset)
                    .rotationEffect(.init(degrees: move ? rotationStart : rotationStart + 360) )
                    .animation(Animation.linear(duration: duration).repeatForever(autoreverses: false), value: move)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
                    .opacity(0.8)
                    .onAppear {
                        move.toggle()
                    }
            }
        } else if choice == "Circle" {
            Circle()
                .fill(color)
                .frame(height: proxy.size.height /  provider.frameHeightRatio)
                .offset(provider.offset)
                .rotationEffect(.init(degrees: move ? rotationStart : rotationStart + 360) )
                .animation(Animation.linear(duration: duration).repeatForever(autoreverses: false), value: move)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
                .opacity(0.8)
                .onAppear {
                    move.toggle()
                }
        } else {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(color)
                .frame(height: proxy.size.height /  provider.frameHeightRatio)
                .offset(provider.offset)
                .rotationEffect(.init(degrees: move ? rotationStart : rotationStart + 360) )
                .animation(Animation.linear(duration: duration).repeatForever(autoreverses: false), value: move)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
                .opacity(0.8)
                .onAppear {
                    move.toggle()
                }
        }
    }
}

struct FloatingClouds: View {
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Theme.generalBackground
                Cloud(proxy: proxy,
                      color: Theme.ellipsesBottomTrailing(forScheme: scheme),
                      rotationStart: 0,
                      duration: 60,
                      alignment: .bottomTrailing)
                Cloud(proxy: proxy,
                      color: Theme.ellipsesTopTrailing(forScheme: scheme),
                      rotationStart: 240,
                      duration: 50,
                      alignment: .topTrailing)
                Cloud(proxy: proxy,
                      color: Theme.ellipsesBottomLeading(forScheme: scheme),
                      rotationStart: 120,
                      duration: 80,
                      alignment: .bottomLeading)
                Cloud(proxy: proxy,
                      color: Theme.ellipsesTopLeading(forScheme: scheme),
                      rotationStart: 180,
                      duration: 70,
                      alignment: .topLeading)
            }
            .ignoresSafeArea()
        }
    }
}

// Extending Color class to pass HEX code for a color
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct Theme {
    static var generalBackground: Color {
        Color(hex: "253D5B")
    }
    
    static func ellipsesTopLeading(forScheme scheme: ColorScheme) -> Color {
        let any = Color(hex: "46536C")
        let dark = Color(hex: "46536C")
        switch scheme {
        case .light:
            return any
        case .dark:
            return dark
        @unknown default:
            return any
        }
    }
    
    static func ellipsesTopTrailing(forScheme scheme: ColorScheme) -> Color {
        let any = Color(hex: "46536C")
        let dark = Color(red: 0.408, green: 0.698, blue: 0.420, opacity: 0.61)
        switch scheme {
        case .light:
            return any
        case .dark:
            return dark
        @unknown default:
            return any
        }
    }
    
    static func ellipsesBottomTrailing(forScheme scheme: ColorScheme) -> Color {
        Color(red: 0.541, green: 0.733, blue: 0.812, opacity: 0.7)
    }
    
    static func ellipsesBottomLeading(forScheme scheme: ColorScheme) -> Color {
        let any = Color(red: 0.196, green: 0.749, blue: 0.486, opacity: 0.55)
        let dark = Color(red: 0.525, green: 0.859, blue: 0.655, opacity: 0.45)
        switch scheme {
        case .light:
            return any
        case .dark:
            return dark
        @unknown default:
            return any
        }
    }
}

