class Lead < ActiveRecord::Base

  workflow do
    #Hold is default state
    state :hold do
      event :escalate, :transitions_to => :escalated
      event :mark_active, :transitions_to => :active
    end

    state :escalated do
    end

    state :active do
      event :assign, :transitions_to => :assigned
    end

    state :assigned
  end
end
