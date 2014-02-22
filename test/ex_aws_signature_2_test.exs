defmodule ExAwsSignature_2Test do
  use ExUnit.Case

  example_access_key = "AKIAIOSFODNN7EXAMPLE"
  example_secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
  _example_query = "https://elasticmapreduce.amazonaws.com?" <>
                  "AWSAccessKeyId=#{example_access_key}&" <>
                  "Action=DescribeJobFlows&" <>
                  "SignatureMethod=HmacSHA256&" <>
                  "SignatureVersion=2&" <>
                  "Timestamp=2011-10-03T15%3A19%3A30&" <>
                  "Version=2009-03-31&" <>
                  "Signature=i91nKc4PWAt0JJIdXwz9HxZCJDdiy6cf%2FMj6vPxyYIs%3D"
  
  System.put_env("AWS_SECRET_KEY", example_secret_key)
  System.put_env("AWS_ACCESS_KEY", example_access_key)

  test "found secret key" do
    assert AWS.Signature2.secret_key
    assert AWS.Signature2.secret_key == System.get_env("AWS_SECRET_KEY")
  end

  test "found access key" do
    assert AWS.Signature2.access_key
    assert AWS.Signature2.access_key == System.get_env("AWS_ACCESS_KEY")
  end



end
