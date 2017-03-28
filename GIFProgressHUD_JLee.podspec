

Pod::Spec.new do |s|


  s.name         = "GIFProgressHUD_JLee"
  s.version      = "0.0.1"
  s.summary      = "GIFProgressHUD_JLee. atthor:JLee/Jack/JackLee"


  s.homepage     = "https://github.com/lijie28/GIFProgressHUD.git"
  
  s.license      = "MIT "
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  s.author             = { "JackLee" => "lijie9228@hotmail.com" }

  s.platform     = :ios

  s.source = { :git => 'https://github.com/lijie28/GIFProgressHUD.git'}

  s.source_files = 'GIFProgressHUD/*.{h,m}'
  # s.resources = 'GIFProgressHUD/Assets'
  # s.source_files  = "Classes", "Classes/**/*.{h,m}"

  s.exclude_files = "Classes/Exclude"

end
