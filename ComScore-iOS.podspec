Pod::Spec.new do |s|
  s.name             = 'ComScore-iOS'
  s.version          = '5.6.1b'
  s.summary          = 'Official analytics library for iOS from comScore'
  s.description      = <<-DESC
  This library is used to collect analytics from iOS applications. The library supports apps developed in native Objective C with Apple Xcode or in other languages/tools which can include and use native Objective C libraries.
                       DESC
  s.homepage         = 'https://github.com/comscore/ComScore-iOS-SDK'
  s.license          = 'Custom'
  s.author           = { "comScore" => "www.comscore.com" }
  s.source           = { :git => "https://github.com/comscore/ComScore-iOS-SDK.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/comScore'
  s.platform     = :ios
  s.prepare_command = <<-CMD
                         touch .pod
                         rm -rf ComScore/iOS/ComScore.framework/strip-framework.sh
                      CMD

  s.ios.deployment_target = '8.0'
  s.vendored_frameworks = 'comScore/ComScore.framework'
  s.preserve_paths = 'comScore/ComScore.framework'
  s.public_header_files = 'comScore/ComScore.framework/Headers/*.h'
  s.source_files = 'comScore/ComScore.framework/Headers/*.h'
  s.resource_bundle = { 'SCORBundle' => '.pod' }
  s.frameworks = "SystemConfiguration", "Security"
  s.libraries = "c++"
  s.module_name = 'ComScore'
  s.deprecated_in_favor_of = "ComScore"
  s.deprecated = true
end
