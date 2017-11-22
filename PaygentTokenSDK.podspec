Pod::Spec.new do |s|
  s.name         = "PaygentTokenSDK"
  s.version      = "1.0.1"
  s.summary      = "Paygent card token iOS SDK"
  s.homepage     = "https://github.com/akaimo/paygent-token-ios-sdk"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "akaimo" => "kawashu0723@gmail.com" }
  s.source       = { :git => "https://github.com/akaimo/paygent-token-ios-sdk.git", :tag => "#{s.version}" }
  s.platform     = :ios, '8.0'
  s.source_files = "PaygentTokenSDK/*.{swift,h}"
  s.frameworks   = "Foundation"
  s.requires_arc = true
end
