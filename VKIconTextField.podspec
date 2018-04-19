Pod::Spec.new do |s|
    s.name         = 'VKIconTextField'
    s.version      = '1.0'
    s.summary      = 'A textField'
    s.homepage     = 'https://github.com/Senvid-iOS/VKIconTextField'
    s.license      = 'MIT'
    s.authors      = {'Senvid' => 'hbcsw123@163.com'}
    s.platform     = :ios, '6.0'
    s.source       = {:git => 'https://github.com/Senvid-iOS/VKIconTextField.git', :tag => s.version}
    s.source_files = 'VKIconTextField/**/*.{h,m}'
    s.requires_arc = true
end
