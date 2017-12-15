Pod::Spec.new do |spec|
    spec.name         = 'Notepad'
    spec.version      = '0.2.7'
    spec.osx.deployment_target = "10.13"
    spec.ios.deployment_target = "11.0"
    spec.summary      = 'A simple Markdown editor'
    spec.author       = 'Rudd Fawcett, Thomas Bonk'
    spec.homepage     = 'https://github.com/meandmymac-de/Notepad'
    spec.license      = { :type => 'MIT', :file => 'LICENSE' }
    spec.source       = { :git => 'https://github.com/meandmymac-de/Notepad.git', :tag => 'v0.2.7' }
    spec.source_files = 'Sources/**/*.swift'
end
