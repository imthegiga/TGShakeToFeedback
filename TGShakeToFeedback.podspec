Pod::Spec.new do |s|
  s.name             = 'TGShakeToFeedback'
  s.version          = '0.1.2'
  s.summary          = 'Library to have shake to feedback feature.'
  
  s.description      = 'It lets user shake the phone and mail composer will be prompted with users current screen.'
 
  s.homepage         = 'https://github.com/imthegiga/TGShakeToFeedback'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Abhishek Salokhe' => 'abhisheksalokhe@gmail.com' }
  s.source           = { :git => 'https://github.com/imthegiga/TGShakeToFeedback.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '8.0'
  s.source_files = 'TGShakeToFeedback/Library/TGShakeToFeedback.swift'
 
end
