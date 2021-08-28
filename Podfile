platform :ios, '13.6'
use_frameworks!
inhibit_all_warnings!

target 'Kenneth' do

  # Pods for Kenneth
  pod 'IQKeyboardManagerSwift', '6.5.6'

  target 'KennethTests' do
    inherit! :search_paths
    
    # Pods for testing
  end

  target 'KennethUITests' do
    # Pods for testing
  end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end
