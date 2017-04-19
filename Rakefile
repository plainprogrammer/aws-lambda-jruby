require 'ant'

PROJECT_NAME = 'hello'
MAIN_SRC_DIR = 'lib'
JARS_DIR = 'jars'
BUILD_DIR = 'build'
DIST_DIR = "#{BUILD_DIR}/dist"
COMPILE_DIR = "#{BUILD_DIR}/compile"
CLASSES_DIR = "#{COMPILE_DIR}/classes"

task default: [:clean, :package]

task :clean do
  ant.delete dir: BUILD_DIR
  puts
end

task :setup do
  ant.path id: 'classpath' do
    fileset dir: COMPILE_DIR
    fileset dir: JARS_DIR
  end
end

task package: :setup do
  make_jar MAIN_SRC_DIR, "#{PROJECT_NAME}.jar"
end

def make_jar(source_folder, jar_file_name)
  ant.mkdir dir: CLASSES_DIR
  `jrubyc ./lib/hello.rb -t #{CLASSES_DIR} --javac`
  ant.delete dir: "#{CLASSES_DIR}/lib"
  ant.javac srcdir: source_folder,
            destdir: CLASSES_DIR,
            classpathref: 'classpath',
            source: "0.1",
            debug: "yes",
            includeantruntime: "no"
  ant.jar jarfile: "#{COMPILE_DIR}/#{jar_file_name}", basedir: CLASSES_DIR do
    zipgroupfileset dir: JARS_DIR, includes: "**/*.jar"
  end
  ant.delete dir: CLASSES_DIR
  puts
end
