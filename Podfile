# Uncomment the next line to define a global platform for your project
 platform :ios, '13.0'

target 'XouTube' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for XouTube

pod 'XouDevSpec', :path => '/Users/xschoeman/Documents/git/Podfolder/XouDevSpec'
#pod 'XouDevSpec', :git => 'git@github.com:XanderSchoeman/XouDevSpec.git'
pod 'Firebase/Analytics'
pod 'Firebase/Crashlytics'
pod 'Firebase/Performance'

  target 'XouTubeTests' do
    inherit! :search_paths
    pod 'Firebase'
    pod 'Firebase/Crashlytics'
    pod 'Firebase/Performance'
    
  target 'XouTubeUITests' do
    inherit! :search_paths
    pod 'Firebase'
    pod 'Firebase/Crashlytics'
    pod 'Firebase/Performance'
    # Pods for testing
  end

end
end
