#
# Copyright 2022 YOUR NAME
#
# All Rights Reserved.
#

name "just-ruby"
maintainer "CHANGE ME"
homepage "https://CHANGE-ME.com"

# Defaults to C:/just-ruby on Windows
# and /opt/just-ruby on all other platforms
install_dir "#{default_root}/#{name}"

override :ruby, version: "3.1.2"
override :nokogiri, version: "1.13.1"
override "ruby-windows-devkit-bash", version: "3.1.23-4-msys-1.0.18"
override "ruby-msys2-devkit", version: "3.1.2-1"

build_version Omnibus::BuildVersion.semver
build_iteration 1

# Creates required build directories
dependency "preparation"

# just-ruby dependencies/components
# dependency "somedep"

exclude "**/.git"
exclude "**/bundler/git"
ENV['MSYSTEM']='UCRT64'
ENV['MSYS2_INSTALL_DIR']="C:/Ruby31-x64/msys64"
ENV['PATH']="C:\\Ruby31-x64\\msys64\\usr\\bin;C:\\Ruby31-x64\\msys64\\ucrt64\\bin;"+ENV['PATH']
install_dir "#{default_root}/just-ruby"

dependency "ruby"

#dependency "nokogiri"
# /tmp in bash had to be manually created?
# c:\omnibus-ruby\src\openssl-customization had to be created manually?
dependency "openssl-customization"
dependency "ruby-msys2-devkit"
