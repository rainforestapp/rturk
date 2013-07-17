module RTurk
  
  class GetQualificationScoreResponse < Response
    
    def value 
      @xml.xpath('//Qualification/IntegerValue').inner_text.to_i
    end
    
  end
  
end

