import Combine
import Foundation

public enum LogLevel: Codable {
  case  none, debug, error
    
}

internal class Logger: ObservableObject {

    static let shared = Logger()
    
    private var formatter: DateFormatter
    public var logLevel: LogLevel
    public var logs: String = ""
    
    private init() {
        UserDefaults.standard.removeObject(forKey: Self.getLoggerKey())
        UserDefaults.standard.synchronize()
        formatter = DateFormatter()
        formatter.dateFormat = "dd-MM HH:mm:ss"
        self.logLevel = .debug
    }
    
    public static func getLoggerKey() -> String {
        return "AuthSDKLogs"
    }
    
    public func log(_ message: String) {
        if(logLevel != .none) {
            print(message)
        }
        if(logLevel == .debug) {
            logs = "\(formatter.string(from: Date())): \(message)\n" + logs // prepend new log to logs variable
            UserDefaults.standard.set(logs, forKey: Self.getLoggerKey())
            UserDefaults.standard.synchronize()
        }
    }
}
