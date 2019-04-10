Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.name          = "OtpSecure"
  spec.version       = "2.0.1"
  spec.summary       = "This library allows you to quickly and easily validate otps sent through OtpSecure Service."
  spec.description   = <<-DESC
    This Swift library allows you to quickly and easily validate otps sent through OtpSecure Service using Swift.
                   DESC
  spec.homepage      = "https://github.com/ecertic/otpsecure-swift.git"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.license       = { :type => "MIT", :file => "LICENSE" }

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.author        = { "Diego Sepúlveda Blanco" => "d.sepulvedabl@gmail.com" }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.platform      = :ios, "8.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source        = { :git => "https://github.com/ecertic/otpsecure-swift.git", :tag => "#{spec.version}" }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source_files  = "Sources/**/*.swift"

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.swift_version = "5.0"

end
