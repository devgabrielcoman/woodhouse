# Be sure to run `pod lib lint Woodhouse.podspec' to ensure this is a

Pod::Spec.new do |s|
  s.name             = "Woodhouse"
  s.version          = "0.1.0"
  s.summary          = "Woodhouse is a library that aims to map different menu formats one to another"
  s.description      = <<-DESC
		       The aim of Woodhouse is to be a library that allows you to access different public APIs (Locu, OpenMenu, Google, Facebook, Foursquare) at once and map all their results amongst themselves.
                       DESC

  s.homepage         = "https://github.com/devgabrielcoman/woodhouse"
  s.license          = { :type => "Apache License", :file => "LICENSE" }
  s.author           = { "Gabriel Coman" => "dev.gabriel.coman@gmail.com" }
  s.source           = { :git => "https://github.com/devgabrielcoman/woodhouse.git", :tag => "0.1.0" }
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'Woodhouse' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Alamofire', '~>3.0'
  s.dependency 'Dollar'
  s.dependency 'AlamofireObjectMapper', '~> 2.1'
  s.dependency 'Nosce'
  s.dependency 'KeyPathTransformer'
end
