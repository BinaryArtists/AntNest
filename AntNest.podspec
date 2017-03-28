#
# Be sure to run `pod lib lint AntNest.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AntNest'
  s.version          = '0.4.0'
  s.summary          = 'AntNest是吸收了Go语言的Interface模型的iOS的App模块化解耦编程的框架'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        AntNest 是吸收了 Go 语言的 Interface 模型的 iOS 的 App 模块化解耦编程的框架。
                        完全解耦的面向接口插件化模块开发运行框架
                        模块具体实现与接口调用分离
                        易扩展的模块生命周期、事件分发
                       DESC

  s.homepage         = 'https://github.com/carlSQ/AntNest'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'carlSQ' => 'qiang..shen@ele.me' }
  s.source           = { :git => 'https://github.com/carlSQ/AntNest.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'

  s.source_files = 'AntNest/Classes/**/*'

end
