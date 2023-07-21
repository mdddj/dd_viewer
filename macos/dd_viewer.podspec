#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint dd_viewer.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'dd_viewer'
  s.version          = '0.0.1'
  s.summary          = 'A universal preview device for PDF, Word, Excel, text, png, and jpg'
  s.description      = <<-DESC
A universal preview device for PDF, Word, Excel, text, png, and jpg
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }

  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
