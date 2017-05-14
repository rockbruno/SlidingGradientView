Pod::Spec.new do |s|
  s.name             = 'PlaceholderLoadingView'
  s.version          = '0.1.0'
  s.summary          = 'Effortlesly create pretty loading screens based on animated placeholder images.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/rockbruno/PlaceholderLoadingView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rockbruno' => 'brunorochaesilva@gmail.com' }
  s.source           = { :git => 'https://github.com/rockbruno/PlaceholderLoadingView.git', :branch => "master", :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'PlaceholderLoadingView/Sources/**/*'

end
