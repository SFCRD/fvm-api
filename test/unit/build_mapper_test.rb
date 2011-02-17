require 'test_helper'

class BuildMapperTest < Test::Unit::TestCase
  
  BUILD_WITH_URL_AND_MILESTONE = YAML.load( <<-EOS
- Build Date: Wed May 12, 2010
  Adobe Add-ons: http://opensource.adobe.com/wiki/display/flexsdk/download?build=4.1.0.16032&amp;pkgtype=3
  Open Source Flex SDK: http://opensource.adobe.com/wiki/display/flexsdk/download?build=4.1.0.16032&amp;pkgtype=2
  Language Reference: http://opensource.adobe.com/wiki/display/flexsdk/download?build=4.1.0.16032&amp;pkgtype=4
  Changes: /wiki/display/flexsdk/changes4.1.0.16032
  Build: 4.1.0.16032
  Milestone: Flex 4 Release
  Adobe Flex SDK: http://opensource.adobe.com/wiki/display/flexsdk/download?build=4.1.0.16032&amp;pkgtype=1
  SDK: 4
  Description: Nightly Builds
EOS
).first

  BUILD_WITHOUT_URL_OR_MILESTONE = YAML.load( <<-EOS
- Build Date: Wed May 12, 2010
  Adobe Add-ons: http://opensource.adobe.com/wiki/display/flexsdk/download?build=4.1.0.16032&amp;pkgtype=3
  Open Source Flex SDK: N/A
  Language Reference: http://opensource.adobe.com/wiki/display/flexsdk/download?build=4.1.0.16032&amp;pkgtype=4
  Changes: /wiki/display/flexsdk/changes4.1.0.16032
  Build: 4.1.0.16032
  Adobe Flex SDK: http://opensource.adobe.com/wiki/display/flexsdk/download?build=4.1.0.16032&amp;pkgtype=1
  SDK: 4
  Description: Nightly Builds
EOS
).first

  # setup
  def setup
    @mapper = BuildMapper.new
    @complete = @mapper.map_build( BUILD_WITH_URL_AND_MILESTONE )
    @incomplete = @mapper.map_build( BUILD_WITHOUT_URL_OR_MILESTONE )
  end
  # map build returns a hash
  def test_map_build_returns_a_hash
    assert_instance_of( Hash, @mapper.map_build( BUILD_WITH_URL_AND_MILESTONE ) )
  end
  # has version key
  def test_has_version_key
    assert_equal( true, @complete.has_key?( :version ) )
  end
  # maps version correctly
  def test_maps_version_correctly
    assert_equal( '4.1.0.16032', @complete[ :version ] )
  end
  # has sdk key
  def test_has_sdk_key
    assert_equal( true, @complete.has_key?( :sdk ) )
  end
  # maps sdk correctly
  def test_maps_sdk_correctly
    assert_equal( '4', @complete[ :sdk ] )
  end
  # has milestone key
  def test_has_milestone_key
    assert_equal( true, @complete.has_key?( :milestone ) )
  end
  # maps milestone correctly
  def test_maps_milestone_correctly
    assert_equal( 'Flex 4 Release', @complete[ :milestone ] )
  end
  # missing milestone is empty string
  def test_missing_milestone_is_empty_string
    assert_equal( '', @incomplete[ :milestone ] )
  end
  # has description key
  def test_has_description_key
    assert_equal( true, @complete.has_key?( :description ) )
  end
  # maps description correctly
  def test_maps_description_correctly
    assert_equal( 'Nightly Builds', @complete[ :description ] )
  end
  # has date key
  def test_has_date_key
    assert_equal( true, @complete.has_key?( :date ) )
  end
  # maps date correctly
  def test_maps_date_correctly
    assert_equal( Date.parse( 'Wed May 12, 2010' ), @complete[ :date ] )
  end
  # has url key
  def test_has_url_key
    assert_equal( true, @complete.has_key?( :url ) )
  end
  # maps url correctly
  def test_maps_url_correctly
    assert_equal( 'http://opensource.adobe.com/wiki/display/flexsdk/download?build=4.1.0.16032&amp;pkgtype=2', @complete[ :url ] )
  end
  # non url value gives empty string
  def test_non_url_value_gives_empty_string
    assert_equal( '', @incomplete[ :url ] )
  end
end