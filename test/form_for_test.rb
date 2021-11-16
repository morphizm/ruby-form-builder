# frozen_string_literal: true

require 'test_helper'

class FormForTest < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @user = User.new name: 'rob', job: 'hexlet', gender: 'm'
  end

  def test_form_for_without_fields
    result = HexletCode.form_for @user do |f|
    end
    expected = '<form action="#" method="post"></form>'
    assert_equal expected, result

    result2 = HexletCode.form_for @user, url: '/users' do |f|
    end
    expected2 = '<form action="/users" method="post"></form>'
    assert_equal expected2, result2
  end

  def test_with_fields
    result = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
      f.submit
    end
    expected = "\
<form action=\"#\" method=\"post\">\
<label for=\"name\">Name</label>\
<input name=\"name\" type=\"text\" value=\"rob\">\
<label for=\"job\">Job</label>\
<textarea cols=\"20\" rows=\"40\" name=\"job\">hexlet</textarea>\
<input name=\"commit\" type=\"submit\" value=\"Save\"></form>"

    assert_equal expected, result
  end

  def test_field_error_on_no_method_instance
    assert_raises(NoMethodError) do
      HexletCode.form_for @user, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        # user does not have age field
        f.input :age
        f.submit
      end
    end
  end
end
