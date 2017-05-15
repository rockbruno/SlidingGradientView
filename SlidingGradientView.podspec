Pod::Spec.new do |s|
  s.name             = 'SlidingGradientView'
  s.version          = '0.2.2'
  s.summary          = 'Easily add sliding gradient effects to images. Meant to be used as loading placeholder views.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/rockbruno/SlidingGradientView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rockbruno' => 'brunorochaesilva@gmail.com' }
  s.source           = { :git => 'https://github.com/rockbruno/SlidingGradientView.git', :branch => "master", :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'SlidingGradientView/Sources/**/*'

end
