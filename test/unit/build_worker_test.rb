require 'test_helper'

class BuildWorkerTest < Test::Unit::TestCase
  # setup
  def setup
    @data = YAML.load_file( Rails.root.join( 'test/unit/flex_sdk_downloads.yml' ) )
    @worker = BuildWorker.new
  end
  # flattens tables into an array
  def test_flattens_tables_into_an_array
    assert_instance_of( Array, @worker.flatten( 'sdk name', @data ) )
  end
  # flattened array has correct length
  def test_flattened_array_has_correct_length
    assert_equal( 4, @worker.flatten( 'sdk name', @data ).size )
  end
  # objects in flattened array have sdk property
  def test_objects_in_flattened_array_have_sdk_property
    @worker.flatten( 'sdk name', @data ).each do |build|
      assert_not_nil( build[ 'SDK' ] )
    end
  end
  # object in flattened array have correct sdk property
  def test_object_in_flattened_array_have_correct_sdk_property
    @worker.flatten( 'sdk name', @data ).each do |build|
      assert_equal( 'sdk name', build[ 'SDK' ] )
    end
  end
end