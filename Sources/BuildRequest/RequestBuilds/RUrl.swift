import Foundation

/// Description
public struct RUrl: RequestBuilderProtocol {
  private let urlString: String
  
  public init(urlString: String) {
    self.urlString = urlString
  }
  
  public func build(request: inout URLRequest) {
    request.url = URL(string: urlString)
  }
}

public extension RUrl {
  func withPath(_ path: String?) -> RUrl {
    if let path = path {
      if urlString.last == "/" {
        return .init(urlString: (urlString + path))
      } else {
        return .init(urlString: (urlString + "/" + path))
      }
    } else {
      return self
    }
  }
}
