Pod::Spec.new do |s|
  s.name         = "StateViewManager"
  s.version      = "0.0.1"
  s.summary      = "Yet another bicycle for handling state view switching"

  s.homepage     = "https://github.com/PaulTaykalo/state-view-manager"
  s.license      = 'MIT'

  s.author       = { "Paul Taykalo" => "tt.kilew@gmail.com" }

  s.source       = { :git => "https://github.com/PaulTaykalo/state-view-manager.git"}

  s.platform     = :ios, '5.0'

  s.requires_arc = true

  #...

  s.subspec 'Manager' do |sp|
    sp.source_files = 'Examples/Examples/Classes/Library/*.{h,m}'
  end

  s.subspec 'Protocols' do |sp|
    sp.source_files = 'Examples/Examples/Classes/Library/Protocols/*.h'
  end

  s.subspec 'Implementations' do |sp|
    sp.source_files = 'Examples/Examples/Classes/Library/Implementations/*.{h,m}'
  end

 
end
