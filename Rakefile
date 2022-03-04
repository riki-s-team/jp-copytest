require 'html-proofer'

task :default => :turn

base_dir = File.join(File.dirname(__FILE__))
input_dir = File.join(base_dir, 'input')
output_dir = File.join(base_dir, 'output')

desc 'Turn all steps to generate IG/Profile'
task :turn do
  sh "sushi #{base_dir}"
  sh "#{base_dir}/_updatePublisher.sh --yes"
  sh "#{base_dir}/_genonce.sh"
end

desc 'Check broken links'
task :check do
  options = { disable_external: true,  }
  HTMLProofer.check_directory("#{output_dir}", options).run
end
