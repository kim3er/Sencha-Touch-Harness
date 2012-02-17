require 'sprockets'
require 'sprockets-sass'
require 'compass'

project_root = File.expand_path(File.dirname(__FILE__))

Compass.configuration do |compass|
  # compass.output_style = :compressed
  compass.load File.join(project_root, 'lib', 'touch-charts', 'resources', 'themes')
  compass.load File.join(project_root, 'lib', 'touch', 'resources', 'themes')
  compass.images_dir = "vendor/assets/images"
end

assets = Sprockets::Environment.new(project_root) do |env|
  env.logger = Logger.new(STDOUT)
end

assets.append_path(File.join(project_root, 'vendor', 'assets'))
assets.append_path(File.join(project_root, 'vendor', 'assets', 'javascripts'))
assets.append_path(File.join(project_root, 'vendor', 'assets', 'stylesheets'))
assets.append_path(File.join(project_root, 'vendor', 'assets', 'images'))
assets.append_path(File.join(project_root, 'vendor', 'assets', 'fonts'))

assets.append_path(File.join(project_root, 'assets'))
assets.append_path(File.join(project_root, 'assets', 'javascripts'))
assets.append_path(File.join(project_root, 'assets', 'stylesheets'))
assets.append_path(File.join(project_root, 'assets', 'images'))
assets.append_path(File.join(project_root, 'assets', 'fonts'))

map "/build" do
  run assets
end

# use Rack::Static, :urls => [""] 

run Proc.new { |env|
  [
    200, 
    {
      'Content-Type'  => 'text/html', 
      'Cache-Control' => 'public, max-age=86400' 
    },
    File.open('index.html', File::RDONLY)
  ]
}
