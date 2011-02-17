require 'test_helper'

class BuildWorkerTest < Test::Unit::TestCase
  # setup
  def setup
    @data = YAML.load_file( Rails.root.join( 'test/unit/flex_sdk_downloads.yml' ) )
    @worker = BuildWorker.new
  end
  # flattens tables into an array
  def test_flattens_tables_into_an_array
    assert_instance_of( Array, @worker.flatten_tables( @data ) )
  end
  # flattened array has correct length
  def test_flattened_array_has_correct_length
    assert_equal( 4, @worker.flatten_tables( @data ).size )
  end
  
end