module RTurk
  class GetQualificationScore < Operation

    attr_accessor :qualification_type_id, :subject_id
    require_params :qualification_type_id, :subject_id

    def to_params
      {'QualificationTypeId' => self.qualification_type_id,
       'SubjectId' => self.subject_id}
    end

    def parse(xml)
       RTurk::GetQualificationScoreResponse.new(xml)
    end
  end

  def self.GetQualificationScore(*args)
    RTurk::GetQualificationScore.create(*args)
  end
end

