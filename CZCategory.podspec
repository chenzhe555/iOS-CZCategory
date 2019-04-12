Pod::Spec.new do |s|
  s.name         = "CZCategory"
  s.version      = "0.0.1"
  s.summary      = "iOS-分类"
  s.description  = "iOS-分类库"
  s.homepage     = "https://github.com/chenzhe555/iOS-CZCategory"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "chenzhe555" => "376811578@qq.com" }
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/chenzhe555/iOS-CZCategory.git", :tag => "#{s.version}" }
  s.public_header_files = 'CZCategory/CZCategory.h'
  s.source_files  = 'CZCategory/CZCategory.h'
  s.subspec 'CZCategory' do |one|
      one.source_files = 'CZCategory/classes/*.{h,m}'
  end
  # s.frameworks = "SomeFramework", "AnotherFramework"
  # s.libraries = "iconv", "xml2"
  s.requires_arc = true
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"
end
