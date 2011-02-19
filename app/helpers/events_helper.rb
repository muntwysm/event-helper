module EventsHelper

def add_requirement_link(name)
	link_to_function name do |page|
		page.insert_html :bottom, :requirements, :partial => 'requirement' , :object => Requirement.new
	end
end

end
