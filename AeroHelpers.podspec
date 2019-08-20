Pod::Spec.new do |s|
    s.ios.deployment_target = '10.0'
    s.name = 'AeroHelpers'
    s.summary = 'Набор расширений и мини-утилит, часто используемых в проектах Aero.'
    s.version = '1.0.0'
  	s.license = { :type => 'MIT', :file => 'LICENSE' }
    s.authors = { 'Stas Telnov' => 'telnov@aeroidea.ru' }
    s.homepage = 'https://github.com/AeroAgency/AeroHelpers'
    
    s.swift_versions = ['5.0']
  	s.cocoapods_version = '>= 1.7.0'  
    
    s.source = { :git => "https://github.com/AeroAgency/AEROHelpers.git", :tag => s.version }
    s.default_subspec = "UIViewController", "UIView", "Int", "String"

    
    s.subspec "UIViewController" do |ss|
    	ss.source_files  = "AEROHelpers/UIViewController/"
  	end
  	
  	
  	s.subspec "UIView" do |ss|
    	ss.source_files  = "AEROHelpers/UIView/"
  	end
  	
  	
  	s.subspec "Int" do |ss|
    	ss.source_files  = "AEROHelpers/Int/"
  	end
  	
  	
  	s.subspec "String" do |ss|
    	ss.source_files  = "AEROHelpers/String/"
  	end
  	
end
