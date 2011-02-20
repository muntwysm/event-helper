# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # Return a title on a per-page basis.
  def title
    base_title = "Event supplies application"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

	def short_version_of(date)
		date.strftime("%e-%b")
	end

	def short_date_time(date)
		date.strftime("%a %e-%b-%Y %H:%M")
	end

	def contributions_for(search,event_id,item_id)
				if search
					@contributions = Contribution.find(:all, :conditions => ["email LIKE ? AND event_id = ? AND item_id = ? AND req = true", "%#{search}%", event_id, item_id], :order => "created_at")
				else
					@contributions = Contribution.all(:conditions => ["event_id = ? AND item_id = ? AND req = true", event_id, item_id], :order => "created_at")
				end
	end

	def find_requirement_for(event_id, item_id)
		@requirement = Requirement.all(:conditions => ["event_id = ? AND item_id = ?", event_id, item_id])
		return true if @requirement.any?
		return false
	end

end
