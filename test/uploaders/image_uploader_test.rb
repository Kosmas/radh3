require_relative '../test_helper'
require 'rubygems'
require 'RMagick'
require 'carrierwave'
require_relative '../../app/uploaders/image_uploader'

class ImageUploaderTest < MiniTest::Test
  FILENAME = 'wall.jpeg'
  STORE_DIR = 'tmp/uploads/store'
  CACHE_DIR = 'tmp/uploads/cache'
  STORE_PATH = File.join __dir__, '..', '..', STORE_DIR
  CACHE_PATH = File.join __dir__, '..', '..', CACHE_DIR

  class ::ImageUploader
    storage :file
    def store_dir; STORE_PATH; end
    def cache_dir; CACHE_PATH; end
  end

  def setup
    @file = File.new "#{__dir__}/test_files/#{FILENAME}"
  end

  def clear_after_test
    FileUtils.rm_rf STORE_PATH
    FileUtils rm_rf CACHE_PATH
  end

  def test_image_upload
    uploader = ImageUploader.new
    uploader.store!(@file)
    assert_equal Digest::SHA2.file(@file).hexdigest, Digest::SHA2.file("#{STORE_PATH}/#{FILENAME}").hexdigest
  end

  def after_tests
  end
end
