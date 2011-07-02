# Author: Toksaitov Dmitrii Alexandrovich

# This is what you need to do if you don't have Excel/Calc/Numbers installed
#  on your PC/Mac

RESULT_FILE       = 'COM_410_Spring_2011_Lab_Results.pdf'
DEPLOYMENT_DIR    = 'H:/Courses Information Support/' \
                    'Natural Sciences and Information Technologies/' \
                    'COM 410 Computer Architecture and Organization/Results'

DEFAULT_DATA_FILE = 'results.yaml'
TEMPLATE_FILE     = 'results.erb'
TEX_FILE          = 'results.tex'

# ===

NUMBER_OF_TASKS    = 4
MAX_VALUE_FOR_TASK = 1.0

TOTAL_MAX = NUMBER_OF_TASKS * MAX_VALUE_FOR_TASK

MAX_RESULT = 100.0

# ===

require 'rake/clean'
CLEAN.include(TEX_FILE, '*.aux', '*.log', '*.out')
CLOBBER.include('*.pdf')

# ===

desc 'Invoke the :generate task.'
task :default, [:data] => :generate

desc 'Generate the resulting file.'
task :generate, [:data] => RESULT_FILE

file RESULT_FILE, [:data] => [TEX_FILE] do |task|
  source = task.prerequisites.first
  2.times do
    sh "pdflatex #{source}"
  end
  mv "#{File.basename(source, File.extname(source))}.pdf", task.name
end

file TEX_FILE, [:data] => [:extract_data, TEMPLATE_FILE] do |task|
  require 'erb'
  File.open(task.name, 'w+') do |io|
    io.write(ERB.new(File.read(task.prerequisites.last)).result)
  end
end

task :extract_data, :data do |task, args|
  args.with_defaults(:data => DEFAULT_DATA_FILE)

  require 'yaml'
  data = YAML.load_file(args.data)
  data.each do |name, grades|
    grades.insert(-2, *grades[0..-2].reduce(0) { |sum, value|
      sum + value.to_f() rescue sum
    })
    grades.insert(-2, grades[-2] * MAX_RESULT / TOTAL_MAX)
  end
  PARSED_DATA = data.sort { |a, b| b.last[-2] <=> a.last[-2] }
end

directory DEPLOYMENT_DIR

desc 'Generate the resulting file and copy it to the deployment directory'
task :deploy, [:data] => [:generate, DEPLOYMENT_DIR] do |task|
  cp RESULT_FILE, task.prerequisites.last
end

