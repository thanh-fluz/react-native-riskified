require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-riskified"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  react-native-riskified
                   DESC
  s.homepage     = "https://github.com/Exkalybur/react-native-riskified"
  # brief license entry:
  s.license      = "MIT"
  # optional - use expanded license entry instead:
  # s.license    = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { "Fluz Devs" => "admin@fluz.app" }
  s.platforms    = { :ios => "9.0" }
  s.source       = { :git => "https://github.com/Exkalybur/react-native-riskified.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,c,m,swift}"
  s.requires_arc = true

  s.dependency "React"
  s.dependency 'RiskifiedBeacon', '~> 1.2.7'
  # ...
  # s.dependency "..."
end

