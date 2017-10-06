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
                         rm -rf ComScore/dynamic/ComScore.framework/strip-framework.sh
                      CMD
  s.frameworks = "SystemConfiguration", "Security"
  s.libraries = "c++"

  s.subspec 'Dynamic' do |ds|
    ds.ios.deployment_target = '8.0'
    ds.vendored_frameworks = 'comScore/dynamic/ComScore.framework'
    ds.preserve_paths = 'comScore/dynamic/ComScore.framework'
    ds.public_header_files = 'comScore/dynamic/ComScore.framework/Headers/*.h'
    ds.source_files = 'comScore/dynamic/ComScore.framework/Headers/*.h'
    ds.resource_bundle = { 'SCORBundle' => '.pod' }
  end

  s.subspec 'Static' do |ss|
    ss.ios.deployment_target = '6.0'
    ss.vendored_frameworks = 'comScore/static/ComScore.framework'
    ss.preserve_paths = 'comScore/static/ComScore.framework'
    ss.public_header_files = 'comScore/static/ComScore.framework/Versions/A/Headers/*.h'
    ss.source_files = 'comScore/static/ComScore.framework/Versions/A/Headers/*.h'
    ss.resource_bundle = { 'SCORBundle' => '.pod' }
  end

  s.default_subspec = 'Dynamic'
  s.module_name = 'ComScore'
  s.deprecated_in_favor_of = "ComScore"
  s.deprecated = true
end
