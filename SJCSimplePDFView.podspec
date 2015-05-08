Pod::Spec.new do |s|
  s.name             = "SJCSimplePDFView"
  s.version          = "1.0.0"
  s.summary          = "A simple UIView subclass for displaying PDFs on iOS."
  s.homepage         = "https://github.com/sjc/SJCSimplePDFView"
  s.license          = 'MIT'
  s.author           = { "Stuart Crook" => "stuart.crook@jaml.co.uk" }
  s.source           = { :git => "https://github.com/sjc/SJCSimplePDFView.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'SJCSimplePDFView/**/*'

  s.public_header_files = 'SJCSimplePDFView/**/*.h'
  s.frameworks = 'UIKit'
end
