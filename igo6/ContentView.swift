import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color.blue.opacity(0.6),
                    Color.cyan.opacity(0.4),
                    Color.blue.opacity(0.8)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    VStack(spacing: 6) {
                        Text("基隆市")
                            .font(.system(size: 34, weight: .bold))
                            .foregroundColor(.white)
                        Text("28°C")
                            .font(.system(size: 70, weight: .thin))
                            .foregroundColor(.white)
                        Text("晴時多雲")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.white.opacity(0.9))
                        HStack(spacing: 12) {
                            Text("最高：31°C")
                            Text("最低：24°C")
                        }
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                    }
                    .padding(.top, 20)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Label("24小時天氣預報", systemImage: "clock")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(0..<8, id: \.self) { index in
                                    HourlyItemView(
                                        time: index == 0 ? "現在" : "\(index + 12):00",
                                        iconName: index % 2 == 0 ? "sun.max.fill" : "cloud.sun.fill",
                                        temp: "\(26 + index % 3)°C"
                                    )
                                }
                            }
                        }
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(15)
                    .padding(.horizontal)
                    VStack(alignment: .leading, spacing: 10) {
                        Label("未來 5 天氣象預報", systemImage: "calendar")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                        VStack(spacing: 12) {
                            DailyRowView(day: "今天", iconName: "sun.max.fill", low: "24°", high: "31°")
                            DailyRowView(day: "週四", iconName: "cloud.rain.fill", low: "23°", high: "28°")
                            DailyRowView(day: "週五", iconName: "cloud.fill", low: "22°", high: "27°")
                            DailyRowView(day: "週六", iconName: "sun.max.fill", low: "25°", high: "32°")
                            DailyRowView(day: "週日", iconName: "cloud.sun.fill", low: "24°", high: "30°")
                        }
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(15)
                    .padding(.horizontal)
                    
                }
                .padding(.bottom, 30)
            }
        }
    }
}
struct HourlyItemView: View {
    var time: String
    var iconName: String
    var temp: String
    
    var body: some View {
        VStack(spacing: 10) {
            Text(time)
                .font(.caption)
                .foregroundColor(.white)
            Image(systemName: iconName)
                .font(.title2)
                .symbolRenderingMode(.multicolor)
                .frame(height: 30)
            Text(temp)
                .font(.subheadline)
                .bold()
                .foregroundColor(.white)
        }
        .frame(width: 60)
    }
}

struct DailyRowView: View {
    var day: String
    var iconName: String
    var low: String
    var high: String
    
    var body: some View {
        HStack {
            Text(day)
                .font(.body)
                .foregroundColor(.white)
                .frame(width: 50, alignment: .leading)
            
            Spacer()

            Image(systemName: iconName)
                .font(.title3)
                .symbolRenderingMode(.multicolor)
            
            Spacer()
            
            HStack(spacing: 12) {
                Text(low)
                    .foregroundColor(.white.opacity(0.6))
                Capsule()
                    .fill(Color.white.opacity(0.4))
                    .frame(width: 60, height: 4)
                
                Text(high)
                    .foregroundColor(.white)
            }
            .font(.subheadline)
        }
    }
}

#Preview {
    ContentView()
}
