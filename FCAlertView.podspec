#
# Be sure to run `pod lib lint FCAlertView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FCAlertView'
  s.version          = '1.2.0'
  s.summary          = 'FCAlertView is a Flat Customizable AlertView'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
FCAlertView is a fully customizable and beautifully designed AlertView. I designed FCAlertView because I've always wanted to have access to change the different attributes of the default AlertView. Design wise, FCAlertView is similar looking to the default AlertView, however, as you start customizing it for your specific need, you realize it can do a lot more and look very flat and nice. FCAlertView lets you do things such as specify the number of buttons, the color scheme of the view, adding a small image to it, hide the view after a certain time, and more. A full description of how to customize FCAlertView to fit your alert can be found on http://github.com/nimati/FCAlertView
                       DESC

  s.homepage         = 'https://github.com/nimati/FCAlertView'
#  s.screenshots     = 'https://github.com/nimati/FCAlertView/blob/master/Images/ScreenShots/ScreenShot.png?raw=true', 'https://github.com/nimati/FCAlertView/blob/master/Images/ScreenShots/ScreenShot2.png?raw=true'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Nima Tahami' => 'nimat6462@yahoo.ca' }
  s.source           = { :git => 'https://github.com/nimati/FCAlertView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/nima_tahami'

  s.ios.deployment_target = '7.0'

  s.source_files = 'FCAlertView/Classes/**/*'
  
  s.resource_bundles = {
    'FCAlertView' => ['FCAlertView/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
