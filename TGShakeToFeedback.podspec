Pod::Spec.new do |spec|
  spec.name             = 'TGShakeToFeedback'
  spec.version          = '0.1.4'
  spec.summary          = 'Library to have shake to feedback feature.'
  spec.swift_version    = '5.0'

  spec.description      = 'It lets user shake the phone and mail composer will be prompted with users current screen.'
 
  spec.homepage         = 'https://github.com/imthegiga/TGShakeToFeedback'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Abhishek Salokhe' => 'abhisheksalokhe@gmail.com' }
  spec.source           = { :git => 'https://github.com/imthegiga/TGShakeToFeedback.git', :tag => spec.version.to_s }
 
  spec.ios.deployment_target = '8.0'
  spec.source_files = 'TGShakeToFeedback/Library/TGShakeToFeedback.swift'
end
