#http://docs.aws.amazon.com/AWSMechTurk/latest/AWSMturkAPI/ApiReference_UpdateQualificationScoreOperation.html
module RTurk
  class UpdateQualificationScore < Operation
    require_params :qualification_type_id, :subject_id, :integer_value
    attr_accessor :qualification_type_id, :subject_id, :integer_value
    
    def to_params
      {'QualificationTypeId' => qualification_type_id,
       'SubjectId' => subject_id,
       'IntegerValue' => integer_value}
    end
  end
  
  def self.UpdateQualificationScore(*args)
    RTurk::UpdateQualificationScore.create(*args)
  end
  
end

