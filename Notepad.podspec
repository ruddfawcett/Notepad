Pod::Spec.new do |s|
  s.name             = 'Notepad'
  s.version          = '0.3.0'
  s.summary          = 'A themeable Markdown editor.'
  s.description      = <<-DESC
    Notepad gives your users the ability to write and edit Markdown directly in your app.

    The editor is fully themeable with a JSON stylesheet.

    Add it to your app with only a few lines of code.
  DESC

  s.homepage         = 'https://github.com/ruddfawcett/Notepad'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rudd Fawcett' => 'rudd.fawcett@gmail.com' }
  s.source           = { :git => 'https://github.com/ruddfawcett/Notepad.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ruddfawcett'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.11'

  s.source_files = 'Notepad/*.swift'
  s.resources    = 'Notepad/themes/*.json'
end
