require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))

describe RTurk::GetQualificationScore do

  before(:all) do
    aws = YAML.load(File.open(File.join(SPEC_ROOT, 'mturk.yml')))
    RTurk.setup(aws['AWSAccessKeyId'], aws['AWSAccessKey'], :sandbox => true)
    faker('get_qualification_score', :operation => 'GetQualificationScore')
  end

  let(:valid_params) do
    {
      :qualification_type_id => '789RVWYBAZW00EXAMPLE', :subject_id => "XXX"
    }
  end

  it "should ensure required params" do
    lambda{RTurk::GetQualificationScore()}.should raise_error RTurk::MissingParameters
  end

  it "should successfully request the operation" do
    RTurk::Requester.should_receive(:request).once.with(
      hash_including('Operation' => 'GetQualificationScore'))
    RTurk::GetQualificationScore(valid_params) rescue RTurk::InvalidRequest
  end

  it "should parse and return the result" do
    response = RTurk::GetQualificationScore(valid_params)
    response.value.should == 95
  end

end


