#
# Be sure to run `pod lib lint ELIPlaceholderTextView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ELIPlaceholderTextView"
  s.version          = "0.1.3"
  s.summary          = "A short description of ELIPlaceholderTextView."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = "https://github.com/EliaCereda/ELIPlaceholderTextView"
  s.license          = 'MIT'
  s.author           = { "Elia Cereda" => "eliacereda@gmail.com" }
  s.source           = { :git => "https://github.com/EliaCereda/ELIPlaceholderTextView.git", :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'ELIPlaceholderTextView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ELIPlaceholderTextView' => ['ELIPlaceholderTextView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  
  s.dependency 'Cartography', '~> 0.7.0-eliacereda.1'
end
