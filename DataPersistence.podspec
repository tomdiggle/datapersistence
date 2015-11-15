Pod::Spec.new do |s|
  s.name              = "DataPersistence"
  s.version           = "0.1.0"
  s.summary           = "DataPersistence is a drop in class that allows easy persistance of data using NSKeyedArchiver/NSKeyedUnarchiver."
  s.homepage          = "https://github.com/tomdiggle/datapersistence"
  s.license           = "MIT"
  s.author            = { "Tom Diggle" => "tom@tomdiggle.com" }
  s.social_media_url  = "https://twitter.com/tomdiggle"
  s.source            = { :git => "https://github.com/tomdiggle/datapersistence.git", :tag => "0.1.0" }
  s.requires_arc      = true
  s.platform          = :ios, "9.0"
  s.source_files      = "DataPersistence"
end
